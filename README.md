# PostgresOnEC2

The purpose of this repo is to offer a solution for running Postgres on a free AWS EC2 instance rather than with RDS. This is not intended for production level implementations, but rather personal development where you need a working but free cloud database. If you have already launched an EC2 instance and set its security group for Postgres, then skip to <a href="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Setup.sh">Setup.sh</a>.

## Initial Setup

### Launch an AWS EC2 Instance
For this I will be using the Ubuntu 20.04 server available with the free tier

<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Ubuntu.png" alt="Ubuntu 20"/>

### EC2 Config
1. The t2.micro is available for free
2. Instance details can remain the same
3. Choose storage capacity relevent to your project (free tier allows 30gb)
4. Tags are not necessary, but feel free to add some
5. Security Groups
Inbound Rules should reflect a Postgres db as follows (the SSH is necessary for connecting to the instance).
These conifgs open your instance to any IP address, but they can also be configured to only apply to your IP address by choosing 'MyIP' in the dropdown or by entering the address of the desired server.
* To allow private access to your instance, consider using AWS's <a href="https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html">VPC Peering</a>
<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Inbound.png" alt="Inbound Rules"/>

6. Review and Launch
You can now also confirm that your outbound rules are as follows
<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Outbound.png" alt="Outbound Rules"/>

### Connect to Instance
1. From your new instance's main page, click connect in the upper right and navigate to the SSH Client tab
2. *Copy the `chmod 400` command and run it in your terminal*
* This hides your PEM key from public-access (i.e. non-owners). To learn more about the chmod command and its octal system for representing read, write, and execute permissions, see <a href="https://www.linux.com/training-tutorials/understanding-linux-file-permissions/">Linux Tutorials</a> or the chmod entry on <a href="https://en.wikipedia.org/wiki/Chmod">Wikipedia</a>
* Since PEM keys permit root access to the instance, you will also want to make sure you include the PEM key in your `.gitignore` file before pushing to GitHub
* If you accidentally make your key public, then GitHub, AWS, or your terminal would likely alert you, but to delete it you can run: `aws ec2 delete-key-pair --key-name MyKeyPair` where `MyKeyPair` is the name of your PEM key. This may require the <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html">AWS CLI</a>, which you can get by running `sudo apt-get update` followed by `sudo apt-get install awscli` from your Ubuntu terminal. For more, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html#troubleshoot-unprotected-key">AWS Documentation</a>
3. Copy the 'ssh' prefixed command and run it in your terminal to connect to the instance

### Now follow the steps in <a href="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Setup.sh">Setup.sh</a> in this repo
