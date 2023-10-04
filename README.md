# Helpful-Powershell-Scripts
A variety of helpful Powershell scripts for everyday tasks.

## Clear print spool script

This script is meant to help in the event that you have issues with your printer not printing the items in queue, or you not being able to cancel print jobs.
If the script does not help clear your print queue, try closing any applications you were trying to print from and then run the script again in case something got hung up.

If that still does not work, try one of the following:

### Cancel the Print Jobs from the Queue

1. Open the start menu and start to type "Printers & Scanners" until an option appears in the results that says "Printers & scanners" and "System settings".
2. Open that option.
3. Select the printer you have been trying to print to.
4. Select the "Open print queue" option from the next window.
5. Click the 3 dot menu and select "Cancel All"

### Manually remove print jobs

1. Press Windows + R to open the Run command box.
2. Type "services.msc" in the "Opten" field of the Run window, and click OK to run the command.
3. Scroll in the Services window to "Print Spooler".
4. Right-click "Print Spooler" and select "Stop". DON'T close the window. You will need to return to this window later.
5. Press Windows + R to open the Run window.
6. Insert the following in the "Open" field of the Run window: `%systemroot%\System32\spool\printers\`
7. Press OK to open the print spool folder.
8. The files in this folder represent the individual print jobs in queue currently.
9. Select all the print jobs in the folder and delete them.
10. Return to the Services window.
11. Restart the print spool by right-click "Print Spooler" and selecting "Start".
12. Attempt to print a file again.

### Reinstall Computer

1. Press Windows + X to bring up a special Windows context menu.
2. Select "Device Manager" from that menu.
3. Scroll down the Device Manager window to "Print queues".
4. Right-click on your printer name and select "Uninstall device".
5. Restart the computer.
6. When the computer finishes restarting, Windows should install the necessary drivers for the printer, if it is directly connected to the computer. If it is a wireless one, you may need to manual reinstall it.
7. Try printing something.
