# DKAN Deployment

Follow these steps to deploy a DKAN environment on ec2:

Launch a new ec2 instance and choose Marketplace and then search for CentOS.  Choose server 7 or later.

Choose T2 Medium.

Deploy in a VPC that has both a public and private subnet.

Choose to deploy to the public subnet.

Auto-Assign Public IP should be enabled.

IAM role should be Administrator.

Check the "Protect against accidental termination" box.

Scroll down to user data and paste this [code]([https://github.com/ChadCottle/dkan/blob/master/startup.sh](https://github.com/ChadCottle/dkan/blob/master/startup.sh)) in the box to execute on startup.

On the storage page give the root volume 16 gig to ensure there is enough space to run the databases and drupal.

Add another volume to hold data (suggest 1,024 gb).

Add tags:  Key = Name; Value=dkan;

Choose the DKAN security group that opens 22, 80 and 443.

Launch with a keypair that you currently have or create a new one.


## MySql setup
