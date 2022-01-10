# Compose-REDHAWK

A repository for launching the [Docker-REDHAWK](https://github.com/Geontech/docker-redhawk) containers with Docker Compose.

## Prerequisites

* [Docker Engine](https://docs.docker.com/engine/install/centos/) (Tested with 19.03.12)
* [Docker Engine Post-installation Steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

## Install Docker Compose

Install Docker Compose (sourced from instructions [here](https://docs.docker.com/compose/install/)).

> NOTE: Replace 1.29.2 with the version you would like to use.

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Show the version to make sure it installed.

```bash
docker-compose --version
```

Optionally, install the bash command completion with the instructions [here](https://docs.docker.com/compose/completion/).

## Launch Compose-REDHAWK

First initialize the SDRROOT Docker volume.

```bash
./init_sdrroot.sh
```

Launch the REDHAWK containers with the following command.

```bash
docker-compose up -d
```

To add another instance of the GPP REDHAWK Device to the Domain, run the following script.

```bash
$ ./add_gpp.sh
```

To attach a REDHAWK IDE to the running domain and set the workspace to the REDHAWK assets in this directory, run the following script.

```bash
$ ./start_rhide.sh
```

## Test Compose-REDHAWK

Follow the instructions below in the REDHAWK IDE to validate Compose-REDHAWK is operational.

1. Click the **+** button in the "REDHAWK Explorer"
2. In the "New Domain Manager" dialog:
    1. Enter "REDHAWK_DEV" for the **Domain Name** textbox
    2. The **Display Name** textbox should auto-populate with "REDHAWK_DEV"
    3. Click **Finish**
3. Expand the **REDHAWK_DEV>Device Managers** node in the "REDHAWK Explorer" and verify that two GPP nodes exist (assuming you ran `add_gpp.sh`)
4. Right-click on the **REDHAWK_DEV** node in the "REDHAWK Explorer" and click **Launch Waveform...**
5. In the "Launch Waveform" dialog:
    1. Select **rh>basic_components_demo**
    2. Check the **Start the Waveform after launching** checkbox
    3. Click **Finish**
6. Expand the **REDHAWK_DEV>Waveforms** node in the "REDHAWK Explorer" and verify that the "rh.basic_components_demo" waveform was launched

Follow the instructions below in the REDHAWK IDE to test a development flow on Compose-REDHAWK.

1. Click **File>New>REDHAWK Waveform Project**
2. In the "New Waveform Project" dialog:
    1. Type "my_demo" in the **Project name** textbox
    2. Select the **Use existing waveform as a template** radio button
    3. Type "/var/redhawk/sdr/dom/waveforms/rh/basic_components_demo/basic_components_demo.sad.xml" in the **SAD File** textbox
    4. Click **Finish**
3. In the "my_demo" panel in the center-top of the screen:
    1. Select the **Overview** tab
    2. Click the **Generate Waveform** button in the top right-hand corner of the panel
    3. Click **OK** in the "Generate Files" dialog
4. Right-click **my_demo** in the "Project Explorer" panel on the left-hand side of the screen and click **Export to SDR**
6. Expand the **Target SDR>Waveforms** node in the "REDHAWK Explorer" and verify that the "my_demo" waveform is listed
4. Right-click on the **REDHAWK_DEV** node in the "REDHAWK Explorer" and click **Launch Waveform...**
5. In the "Launch Waveform" dialog:
    1. Select **my_demo**
    2. Check the **Start the Waveform after launching** checkbox
    3. Click **Finish**
6. Expand the **REDHAWK_DEV>Waveforms** node in the "REDHAWK Explorer" and verify that the "my_demo" waveform was launched

## Tear Down Compose-REDHAWK

To stop all of the running REDHAWK containers, execute the following command.

```bash
docker-compose down
```

To clean out the SDRROOT volume, execute the following command.

```bash
docker volume rm redhawk_sdrroot
```

## FEI Example

To attach a RTLSDR to the running domain, run the following script.

```bash
$ ./add_rtlsdr.sh
```

> NOTE: The operating system must have certain kernel modules removed before running the container that is launched by the script above. To temporarily remove them, run the command: `modprobe -r dvb_usb_rtl28xxu rtl2832 rtl2830`. See the documentation [here](https://github.com/Geontech/docker-redhawk#rtl2832u) for more information.
