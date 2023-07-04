[![tests](https://github.com/bwilliamson55/ddev-n8n/actions/workflows/tests.yml/badge.svg)](https://github.com/bwilliamson55/ddev-n8n/actions/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2024.svg)

# DDEV Add-On: n8n.io

A DDEV add-on that includes n8n.io already configured for use.

## ⚠️ Notice

When using n8n.io inside DDEV, the web container's API endpoint will be `http://web`, not `http://<yourProjectFQDN>`. For example, for a project with the URL `http://magento.ddev.site`, the API endpoint from n8n.io would be seen as `http://web`. Please keep this in mind when configuring your workflows.


## Description

This repository provides a DDEV add-on that integrates [n8n.io](https://n8n.io) into your DDEV project. n8n.io is a free and open-source workflow automation tool that enables you to connect various services and automate tasks using a visual workflow editor.

By default, the n8n.io instance can be accessed at `n8n.<projectName>.ddev.site`, either over HTTP or HTTPS.

To access the n8n.io interface, refer to the [n8n.io documentation](https://docs.n8n.io) for instructions on how to use and configure workflows. Note that the specific URL for accessing n8n.io will depend on your DDEV project name.

Authentication for n8n.io can be configured using different methods [as explained in the n8n.io docs](https://docs.n8n.io/hosting/authentication/). By default, the repository includes an `.env` file that contains the username and password declarations for basic http authentication.

## Usage

To use this DDEV add-on and integrate n8n.io into your DDEV project, follow these steps:

1. Install and set up DDEV on your local machine following the [DDEV documentation](https://ddev.readthedocs.io).
2. In your DDEV project directory, add this project as an add-on by running the following command:  
 `ddev get bwilliamson55/ddev-n8n`  
This command will clone the `bwilliamson55/ddev-n8n` repository and integrate it into your DDEV project.
3. Start your DDEV project using the `ddev start` command, or restart it with `ddev restart`
4. Access the n8n.io interface by visiting `n8n.<projectName>.ddev.site` in your web browser, replacing `<projectName>` with the name of your DDEV project.
5. Follow the [n8n.io documentation](https://docs.n8n.io/) to create and configure workflows according to your needs.

The docker-compose.ddev-n8n.yaml file contains a fairly thorough configuration through environment variables. This is certainly not a one size fits all configuration. You can override any of these variables in your project's .ddev/docker-compose.n8n.yaml file and or map them to .env variables. Refer to the [n8n environment variable documentation](https://docs.n8n.io/hosting/environment-variables/environment-variables/) if you would like to more.

n8n also supports [file based variables, so you can safely integrate secrets](https://docs.n8n.io/hosting/environment-variables/configuration-methods/#keeping-sensitive-data-in-separate-files). This is normally used for cloud provider secrets, but can be used for any secret.
## Contributing

Contributions to this DDEV add-on are welcome! If you'd like to contribute, please follow these guidelines:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Make your modifications and commit your changes.
4. Push your changes to your forked repository.
5. Submit a pull request with a clear description of your changes.

If you encounter any issues or have suggestions for improvements, please open an issue on the GitHub repository.

## Additional Configuration and Actions

[DDEV lifecycle hooks](https://ddev.readthedocs.io/en/latest/users/configuration/hooks/) can be used to perform additional actions related to n8n.io automatically. For example, you can use the hooks to backup, import, export, start, or stop n8n.io workflows every time your project starts or stops. Refer to the [n8n CLI documentation](https://docs.n8n.io/hosting/cli-commands/) for more information on available CLI commands and actions.

---

Feel free to customize and expand upon this readme as needed for your specific DDEV add-on repository.
