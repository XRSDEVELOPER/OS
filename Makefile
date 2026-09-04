# Run this to start both the browser interface and the OS
run-vnc:
	# 1. Start the noVNC proxy on port 6080, pointing to QEMU's VNC port (5900)
	websockify --web /usr/share/novnc 6080 localhost:5900 &
	
	# 2. Start QEMU and tell it to output to VNC display :0 (which is port 5900)
	qemu-system-x86_64 -drive format=raw,file=os.img -vnc :0
