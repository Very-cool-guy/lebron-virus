import Cocoa
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let status = NSStatusBar.system
        statusItem = status.statusItem(withLength: NSStatusItem.squareLength)

        if let img = NSImage(named: NSImage.Name("icon")) {
            statusItem.button?.image = img
            statusItem.button?.imagePosition = NSControl.ImagePosition.imageOnly
        }

        let menu = NSMenu()
        menu.addItem(
            withTitle: "Run Script",
            action: #selector(runScript),
            keyEquivalent: ""
        )
        menu.addItem(NSMenuItem.separator())
        menu.addItem(
            withTitle: "Quit",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )
        statusItem.menu = menu

        RunLoop.current.run()
    }

    @objc func runScript() {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        task.arguments = ["-c", "echo 'Hello from script!' | pbcopy"]
        try? task.run()
    }
}

let app = NSApplication.shared
app.delegate = AppDelegate()
app.setActivationPolicy(.accessory)
app.run()
