NOTE: If the name cannot be determined for whatever reason, traditional names such as eth0 are used.

The default names for network cards are based on firmware, device topology, and device types. This leads to network card names that always consist of the following parts:

#1

Ethernet interfaces begin with en

WLAN interfaces begin with wl

WWAN interfaces begin with ww

#2

The next part of the name represents the type of adapter:

o is used for onboard

s is for a hotplug slot

p is for a PCI location

Based on this information, device names such as enp0s3 can be used, which stands for an Ethernet device, PCI location 0, hot plug slot 3.
