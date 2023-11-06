# awsbootcamp-week-2
This repository contains UserData scripts for configuring Amazon Linux EC2 instances to launch a simple web server displaying instance metadata information. Each script sets up an HTTP server, fetches the EC2 instance's availability zone and region name, and displays this information on a web page with a unique background color.

# AWS EC2 UserData Scripts

This repository contains a collection of UserData scripts designed for Amazon Linux EC2 instances. These scripts are used to automate the deployment of a simple web server that displays the instance's Availability Zone and Region Name. Additionally, each script configures the background color of the web server's index page.

## Scripts

The repository includes the following UserData scripts:

- `userdata-bg-f16343.sh`: Configures the web server's background color to #F16343 (a shade of red-orange).
- `userdata-bg-e4e3c1.sh`: Configures the web server's background color to #E4E3C1 (a light khaki).
- `userdata-bg-616847.sh`: Configures the web server's background color to #616847 (an olive drab).

Each script performs the following actions:

1. Installs and starts the Apache web server (`httpd`).
2. Retrieves the EC2 instance's Availability Zone and Region Code using IMDSv2 with the necessary authentication.
3. Maps the Region Code to a human-readable Region Name.
4. Creates an index.html file at the web server's root with the instance information and specified background color.

## Usage

To use these UserData scripts, follow these steps:

1. Launch an Amazon Linux EC2 instance.
2. In the instance configuration step, copy and paste the content of the desired script into the UserData field.
3. Proceed with the instance launch.
4. After the instance is running, access the instance's public IP or DNS name in a web browser to view the web server's index page.

## Customization

You can customize the UserData scripts by editing the `REGION_NAMES` associative array to include more mappings from Region Codes to Region Names if necessary.

## Contributions

Contributions to this project are welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
