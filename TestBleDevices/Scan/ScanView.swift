//

import SwiftUI

struct ScanView: View {
    
    @ObservedObject var vmCoordinator: ScanCoordinatorViewModel
    @ObservedObject private var bluetoothScanner = BluetoothScannerViewModel()
    @State private var searchText = ""
    
    var body: some View {
        switch bluetoothScanner.status {
        case .finished:
            content
        case .conecting:
            ProgressView()
        }
    }
    
    private var content: some View {
        VStack {
            HStack {
                // Text field for entering search text
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(bluetoothScanner.discoveredPeripherals.isEmpty)

                // Button for clearing search text
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .buttonStyle(PlainButtonStyle())
                .opacity(searchText == "" ? 0 : 1)
            }
            .padding()

            spacer
            // List of discovered peripherals filtered by search text
            List(bluetoothScanner.discoveredPeripherals.filter {
                self.searchText.isEmpty ? true : $0.peripheral.name?.lowercased().contains(self.searchText.lowercased()) == true
            }, id: \.peripheral.identifier) { discoveredPeripheral in
                VStack(alignment: .leading) {
                    Button(action: { bluetoothScanner.connectPeripheral(peripheral: discoveredPeripheral.peripheral) }) {
                        Text(discoveredPeripheral.peripheral.name ?? "Unknown Device")
                        Text(discoveredPeripheral.advertisedData)
                            .font(.caption)
                            .foregroundColor(.gray)

                    }
                    .buttonStyle(.plain)
                }
            }
            spacer
            
            Button(action: {
                bluetoothScanner.handleScanState()
            }) {
                Text(bluetoothScanner.startBtnTitle())
            }
            .padding()
            .background(bluetoothScanner.isScanning ? Color.red : Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5.0)
            
            spacer
        }
        .padding()
        .alert("Please, Turn on the Ble!", isPresented: $bluetoothScanner.showingWarningAlert) {
            Button("OK", role: .cancel) { bluetoothScanner.showingWarningAlert = false }
        }
    }
    
    private var spacer: some View {
        Spacer()
            .frame(height: 20)
    }
}
