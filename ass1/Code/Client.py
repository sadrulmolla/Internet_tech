import socket
from sys import argv
import time

class client():
	def __init__(self):
		try:
			self.serverhost = argv[1]
			self.serverport = int(argv[2])
		except:
			print("ERROR: Please Enter The serverhost & serverport!!!")
			exit(0)
	def query(self, args):
		#creating the socket 
		s= socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		#connecting with the server 
		s.connect((self.serverhost,self.serverport))
		print("client is ready to send....")
		for i in args:
			#sleep time between sending the data
			time.sleep(.07)
			#sending data to the server
			s.send(i.encode())
		time.sleep(.07)
		s.send("end".encode())
		#geting the value for the key
		print("client is Listing....")
		Ans=s.recv(1024).decode()
		while True:
			if(Ans=="end"):
				break
			print(Ans)
			Ans=s.recv(1024).decode()
		s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)


c=client()
client_no=argv[3]
c.query(argv)
	