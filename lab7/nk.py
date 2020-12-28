#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan

class Robot:
	def __init__(self):
		rospy.init_node('antpot', anonymous=True)
		self.velocity_publisher = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
		self.pose_subscriber = rospy.Subscriber('/base_scan', LaserScan, self.update_pose)
		self.pose = LaserScan()
		for i in range(18):
			self.pose.ranges.append(0)
		self.rate = rospy.Rate(10)
		self.dist_forward = 3
		self.dist_right = 5
		self.dist_left = 5

	def update_pose(self, data):
		self.pose = data
		self.dist_forward = sum(self.pose.ranges[7:11])/5
		self.dist_right = self.pose.ranges[0]
		self.dist_left = self.pose.ranges[17]

	def move_forward(self):
		vel_msg = Twist()
		#start filling unused fields
		vel_msg.linear.y = 0
		vel_msg.linear.z = 0
		vel_msg.angular.x = 0
		vel_msg.angular.y = 0
		#fill linear speed
		if self.dist_forward >= 3 :
			print(self.dist_forward)
			vel_msg.linear.x = self.dist_forward*0.2
			vel_msg.angular.z = 0
		else:
			#calculate angular speed
			if self.dist_right < self.dist_left:
				print("rotate right")
				self.angz = self.dist_right/self.dist_left
			else: 
				print("rotate left")
				self.angz = -self.dist_left/self.dist_right
			vel_msg.linear.x = 0.2
			vel_msg.angular.z = self.angz*120

		# Publishing our vel_msg
		self.velocity_publisher.publish(vel_msg)

		# Publish at the desired rate.
		self.rate.sleep()

		return

	def move(self):
		while not rospy.is_shutdown():
			self.move_forward()

if __name__ == '__main__':
	try:
		x = Robot()
		x.move()
	except rospy.ROSInterruptException:
		pass
