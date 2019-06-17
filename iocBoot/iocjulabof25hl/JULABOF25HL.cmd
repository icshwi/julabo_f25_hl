#@field PORTNAME
#@type STRING
#The port name. Should be unique within an IOC.
#
#@field IPADDR
#@type STRING
#IP or hostname of the TCP endpoint.
#
#@field IPPORT
#@type INTEGER
#Port number for the TCP endpoint.
#
#@field PREFIX
#@type STRING
#Prefix for EPICS PVs.


# Set parameters when not using auto deployment
#epicsEnvSet(PORTNAME, "PortA")
#epicsEnvSet(IPADDR, "10.0.17.0")
#epicsEnvSet(IPPORT, "4001")
#epicsEnvSet(PREFIX, "test")

#Use for Kameleon sim
#epicsEnvSet(IPADDR, "127.0.0.1") #For use with Chameleon simulator
#epicsEnvSet(IPPORT, "9999")

# All require need to have version number 
require JULABOF25HL anderspettersson 
#require streamdevice 2.7.7

#Specifying the TCP endpoint and port name
drvAsynIPPortConfigure("$(PORTNAME)", "$(IPADDR):$(IPPORT)")

#Load your database defining the EPICS records
dbLoadTemplate(JULABOF25HL.substitutions, "P=$(PREFIX), PORT=$(PORTNAME), ADDR=$(IPPORT)")

