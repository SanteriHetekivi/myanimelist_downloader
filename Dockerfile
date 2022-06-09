# Use python as base image.
FROM python:3.10.5

# Update package list.
RUN apt-get -y update

# Upgrade packages.
RUN apt-get -y upgrade

# Install requirements for installing Google Chrome.
RUN apt-get -y install software-properties-common apt-transport-https wget ca-certificates gnupg2

# Add Google repository.
RUN wget -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /usr/share/keyrings/google-chrome.gpg
RUN echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | tee /etc/apt/sources.list.d/google-chrome.list

# Update package list.
RUN apt-get -y update

# Install Google Chrome.
RUN apt-get -y install google-chrome-stable

# Install myanimelist_downloader.
RUN pip install --upgrade --no-cache-dir myanimelist_downloader==0.0.3