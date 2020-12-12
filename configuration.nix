# Edit this configuration file to define what should be installed on
    # your system.  Help is available in the configuration.nix(5) man page
    # and in the NixOS manual (accessible by running ‘nixos-help’).
    
    { config, pkgs, ... }:
    
    {
      imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];
      
      
      # Use the systemd-boot EFI boot loader.
      # boot.loader.systemd-boot.enable = true;
      # boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.grub.enable = true;
      boot.loader.grub.device = [ "nodev" ];
      boot.loader.grub.efiInstallAsRemovable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.useOSProber = true;
      
      
      # networking.hostName = "nixos"; # Define your hostname.
      # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
      
      # The global useDHCP flag is deprecated, therefore explicitly set to false here.
      # Per-interface useDHCP will be mandatory in the future, so this generated config
      # replicates the default behaviour.
      networking.useDHCP = false;
      networking.interfaces. .useDHCP = true;
      
      
      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
      
      
      # Select internationalisation properties.
      i18n.defaultLocale = "es_ ISO-8859-1";
      console = {
        font = "Lat2-Terminus16";
        keyMap = "es";
      };
      
      
      # Set your time zone.
      time.timeZone = "America/";
      
      
      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        wget 
        vim 
        firefox
        discord
        wirelesstools
        broadcom-bt-firmware
      ];
      
      
      nixpkgs.config.allowUnfree = true;
      services.flatpak.enable = true;
      xdg.portal.enable = true;
      # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      
      
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      #   pinentryFlavor = "gnome3";
      # };
      
      
      # List services that you want to enable:
      
      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;
      
      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;
      
      
      # Enable CUPS to print documents.
      services.printing.enable = true;
      
      # Enable hardware.
      sound.enable = true;
      hardware.pulseaudio.enable = true;
      hardware.pulseaudio.support32Bit = true;
      hardware.facetimehd.enable = true;
      hardware.opengl.driSupport32Bit = true;
      
      services.mbpfan = {
          enable = true;
          lowTemp = 61;
          highTemp = 64;
          maxTemp = 84;
      };
      
      # Enable the X11 windowing system.
      services.xserver.enable = true;
      services.xserver.layout = "es";
      services.xserver.xkbVariant = "mac";
      
      # Enable touchpad support.
      services.xserver.libinput.enable = true;
      
      # Enable the KDE Desktop Environment.
      services.xserver.displayManager.lightdm.enable = true;
      services.xserver.desktopManager.plasma5.enable = true;
      
      
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.CR = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      };
      
      
      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "20.03"; # Did you read the comment?
      
      }

