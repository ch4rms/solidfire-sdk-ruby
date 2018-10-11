#!/usr/bin/python
#
# Copyright &copy; 2014-2016 NetApp, Inc. All Rights Reserved.
#
# DO NOT EDIT THIS CODE BY HAND! It has been generated with solidfire-sdk-generators.
require 'uuidtools'
require_relative 'custom_models'


class RemoveClusterAdmin
  attr_accessor :cluster_admin_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveClusterAdmin
    # You can use RemoveClusterAdmin to remove a Cluster Admin. You cannot remove the administrator cluster admin account.
    # param Fixnum cluster_admin_id: [required] ClusterAdminID for the cluster admin to remove.
    self.cluster_admin_id = objectHash["clusterAdminID"]
  end
end

class TestDrivesResult
  attr_accessor :details, :duration, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestDrivesResult
    # param str details: [required]
    self.details = objectHash["details"]

    # param str duration: [required]
    self.duration = objectHash["duration"]

    # param str result: [required]
    self.result = objectHash["result"]
  end
end

class VirtualVolumeHost
  attr_accessor :virtual_volume_host_id, :cluster_id, :visible_protocol_endpoint_ids, :bindings, :initiator_names, :host_address

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualVolumeHost
    # param UUID virtual_volume_host_id: [required]
    self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

    # param UUID cluster_id: [required]
    self.cluster_id = objectHash["clusterID"] ? UUIDTools::UUID.parse(objectHash["clusterID"]) : nil

    # param UUID visible_protocol_endpoint_ids: [required]
    self.visible_protocol_endpoint_ids = Array.new(objectHash["visibleProtocolEndpointIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["visibleProtocolEndpointIDs"][i])}

    # param Fixnum bindings: [required]
    self.bindings = objectHash["bindings"]

    # param str initiator_names: [required]
    self.initiator_names = objectHash["initiatorNames"]

    # param str host_address: [required]
    self.host_address = objectHash["hostAddress"]
  end
end

class ListVirtualVolumeHostsResult
  attr_accessor :hosts

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeHostsResult
    # param VirtualVolumeHost hosts: [required] List of known ESX hosts.
    self.hosts = Array.new(objectHash["hosts"].length) {|i| VirtualVolumeHost.new(objectHash["hosts"][i])}
  end
end

class AddVolumesToVolumeAccessGroup
  attr_accessor :volume_access_group_id, :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddVolumesToVolumeAccessGroup
    # AddVolumesToVolumeAccessGroup enables you to add
    # volumes to a specified volume access group.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group to which volumes are added.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param Fixnum volumes: [required] The list of volumes to add to the volume access group.
    self.volumes = objectHash["volumes"]
  end
end

class CreateGroupSnapshot
  attr_accessor :volumes, :name, :enable_remote_replication, :retention, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateGroupSnapshot
    # CreateGroupSnapshot enables you to create a point-in-time copy of a group of volumes. You can use this snapshot later as a backup or rollback to ensure the data on the group of volumes is consistent for the point in time that you created the snapshot.
    # Note: Creating a group snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param Fixnum volumes: [required] Unique ID of the volume image from which to copy.
    self.volumes = objectHash["volumes"]

    # param str name:  Name for the group snapshot. If unspecified, the date and time the group snapshot was taken is used.
    self.name = objectHash["name"]

    # param bool enable_remote_replication:  Replicates the snapshot created to remote storage. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]

    # param str retention:  Specifies the amount of time for which the snapshots are retained. The format is HH:mm:ss.
    self.retention = objectHash["retention"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ClusterConfig
  attr_accessor :cipi, :cluster, :ensemble, :mipi, :name, :node_id, :pending_node_id, :role, :sipi, :state, :encryption_capable, :has_local_admin, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterConfig
    # Cluster Config object returns information the node uses to communicate with the cluster.
    # param str cipi:  Network interface used for cluster communication.
    self.cipi = objectHash["cipi"]

    # param str cluster:  Unique cluster name.
    self.cluster = objectHash["cluster"]

    # param str ensemble:  Nodes that are participating in the cluster.
    self.ensemble = objectHash["ensemble"]

    # param str mipi:  Network interface used for node management.
    self.mipi = objectHash["mipi"]

    # param str name:  Unique cluster name.
    self.name = objectHash["name"]

    # param Fixnum node_id:
    self.node_id = objectHash["nodeID"]

    # param Fixnum pending_node_id:
    self.pending_node_id = objectHash["pendingNodeID"]

    # param str role:  Identifies the role of the node
    self.role = objectHash["role"]

    # param str sipi:  Network interface used for storage.
    self.sipi = objectHash["sipi"]

    # param str state:
    self.state = objectHash["state"]

    # param bool encryption_capable:
    self.encryption_capable = objectHash["encryptionCapable"]

    # param bool has_local_admin:
    self.has_local_admin = objectHash["hasLocalAdmin"]

    # param str version:
    self.version = objectHash["version"]
  end
end

class PhysicalAdapter
  attr_accessor :address, :mac_address, :mac_address_permanent, :mtu, :netmask, :network, :up_and_running

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PhysicalAdapter
    # param str address:
    self.address = objectHash["address"]

    # param str mac_address:
    self.mac_address = objectHash["macAddress"]

    # param str mac_address_permanent:
    self.mac_address_permanent = objectHash["macAddressPermanent"]

    # param str mtu:
    self.mtu = objectHash["mtu"]

    # param str netmask:
    self.netmask = objectHash["netmask"]

    # param str network:
    self.network = objectHash["network"]

    # param bool up_and_running:
    self.up_and_running = objectHash["upAndRunning"]
  end
end

class NetworkConfigParams
  attr_accessor :_default, :bond_master, :virtual_network_tag, :address, :auto, :bond_downdelay, :bond_fail_over_mac, :bond_primary_reselect, :bond_lacp_rate, :bond_miimon, :bond_mode, :bond_slaves, :bond_updelay, :dns_nameservers, :dns_search, :family, :gateway, :mac_address, :mac_address_permanent, :method, :mtu, :netmask, :network, :physical, :routes, :status, :symmetric_route_rules, :up_and_running

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NetworkConfigParams
    # param bool _default:
    self._default = objectHash["#default"]

    # param str bond_master:
    self.bond_master = objectHash["bond-master"]

    # param str virtual_network_tag:
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param str address:
    self.address = objectHash["address"]

    # param bool auto:
    self.auto = objectHash["auto"]

    # param str bond_downdelay:
    self.bond_downdelay = objectHash["bond-downdelay"]

    # param str bond_fail_over_mac:
    self.bond_fail_over_mac = objectHash["bond-fail_over_mac"]

    # param str bond_primary_reselect:
    self.bond_primary_reselect = objectHash["bond-primary_reselect"]

    # param str bond_lacp_rate:
    self.bond_lacp_rate = objectHash["bond-lacp_rate"]

    # param str bond_miimon:
    self.bond_miimon = objectHash["bond-miimon"]

    # param str bond_mode:
    self.bond_mode = objectHash["bond-mode"]

    # param str bond_slaves:
    self.bond_slaves = objectHash["bond-slaves"]

    # param str bond_updelay:
    self.bond_updelay = objectHash["bond-updelay"]

    # param str dns_nameservers:
    self.dns_nameservers = objectHash["dns-nameservers"]

    # param str dns_search:
    self.dns_search = objectHash["dns-search"]

    # param str family:
    self.family = objectHash["family"]

    # param str gateway:
    self.gateway = objectHash["gateway"]

    # param str mac_address:
    self.mac_address = objectHash["macAddress"]

    # param str mac_address_permanent:
    self.mac_address_permanent = objectHash["macAddressPermanent"]

    # param str method:
    self.method = objectHash["method"]

    # param str mtu:
    self.mtu = objectHash["mtu"]

    # param str netmask:
    self.netmask = objectHash["netmask"]

    # param str network:
    self.network = objectHash["network"]

    # param PhysicalAdapter physical:
    self.physical = objectHash["physical"] ? PhysicalAdapter.new(objectHash["physical"]) : nil

    # param dict routes:
    self.routes = objectHash["routes"]

    # param str status:
    self.status = objectHash["status"]

    # param str symmetric_route_rules:
    self.symmetric_route_rules = objectHash["symmetricRouteRules"]

    # param bool up_and_running:
    self.up_and_running = objectHash["upAndRunning"]
  end
end

class NetworkParams
  attr_accessor :bond10_g, :bond1_g, :eth0, :eth1, :eth2, :eth3, :lo

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NetworkParams
    # param NetworkConfigParams bond10_g:
    self.bond10_g = objectHash["Bond10G"] ? NetworkConfigParams.new(objectHash["Bond10G"]) : nil

    # param NetworkConfigParams bond1_g:
    self.bond1_g = objectHash["Bond1G"] ? NetworkConfigParams.new(objectHash["Bond1G"]) : nil

    # param NetworkConfigParams eth0:
    self.eth0 = objectHash["eth0"] ? NetworkConfigParams.new(objectHash["eth0"]) : nil

    # param NetworkConfigParams eth1:
    self.eth1 = objectHash["eth1"] ? NetworkConfigParams.new(objectHash["eth1"]) : nil

    # param NetworkConfigParams eth2:
    self.eth2 = objectHash["eth2"] ? NetworkConfigParams.new(objectHash["eth2"]) : nil

    # param NetworkConfigParams eth3:
    self.eth3 = objectHash["eth3"] ? NetworkConfigParams.new(objectHash["eth3"]) : nil

    # param NetworkConfigParams lo:
    self.lo = objectHash["lo"] ? NetworkConfigParams.new(objectHash["lo"]) : nil
  end
end

class Config
  attr_accessor :cluster, :network

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Config
    # param ClusterConfig cluster: [required]
    self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil

    # param NetworkParams network: [required]
    self.network = objectHash["network"] ? NetworkParams.new(objectHash["network"]) : nil
  end
end

class GetConfigResult
  attr_accessor :config

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetConfigResult
    # param Config config: [required] The details of the cluster. Values returned in "config": cluster- Cluster information that identifies how the node communicates with the cluster it is associated with. (Object) network - Network information for bonding and Ethernet connections. (Object)
    self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
  end
end

class StartVolumePairingResult
  attr_accessor :volume_pairing_key

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartVolumePairingResult
    # param str volume_pairing_key: [required] A string of characters that is used by the "CompleteVolumePairing" API method.
    self.volume_pairing_key = objectHash["volumePairingKey"]
  end
end

class UpdateBulkVolumeStatus
  attr_accessor :key, :status, :percent_complete, :message, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # UpdateBulkVolumeStatus
    # You can use UpdateBulkVolumeStatus in a script to update the status of a bulk volume job that you started with the
    # StartBulkVolumeRead or StartBulkVolumeWrite methods.
    # param str key: [required] The key assigned during initialization of a StartBulkVolumeRead or StartBulkVolumeWrite session.
    self.key = objectHash["key"]

    # param str status: [required] The status of the given bulk volume job. The system sets the status. Possible values are:  running: Jobs that are still active. complete: Jobs that are done. failed: Jobs that failed.
    self.status = objectHash["status"]

    # param str percent_complete:  The completed progress of the bulk volume job as a percentage value.
    self.percent_complete = objectHash["percentComplete"]

    # param str message:  The message returned indicating the status of the bulk volume job after the job is complete.
    self.message = objectHash["message"]

    # param dict attributes:  JSON attributes; updates what is on the bulk volume job.
    self.attributes = objectHash["attributes"]
  end
end

class GetAccountEfficiency
  attr_accessor :account_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAccountEfficiency
    # GetAccountEfficiency enables you to retrieve efficiency statistics about a volume account. This method returns efficiency information
    # only for the account you specify as a parameter.
    # param Fixnum account_id: [required] Specifies the volume account for which efficiency statistics are returned.
    self.account_id = objectHash["accountID"]
  end
end

class Platform
  attr_accessor :node_type, :chassis_type, :cpu_model, :node_memory_gb, :platform_config_version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Platform
    # param str node_type: [required] SolidFire's name for this platform.
    self.node_type = objectHash["nodeType"]

    # param str chassis_type: [required] Name of the chassis (example: "R620").
    self.chassis_type = objectHash["chassisType"]

    # param str cpu_model: [required] The model of CPU used on this platform.
    self.cpu_model = objectHash["cpuModel"]

    # param Fixnum node_memory_gb: [required] The amount of memory on this platform in GiB.
    self.node_memory_gb = objectHash["nodeMemoryGB"]

    # param str platform_config_version:
    self.platform_config_version = objectHash["platformConfigVersion"]
  end
end

class VirtualNetworkAddress
  attr_accessor :virtual_network_id, :address

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualNetworkAddress
    # param Fixnum virtual_network_id: [required] SolidFire unique identifier for a virtual network.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param str address: [required] Virtual Network Address.
    self.address = objectHash["address"]
  end
end

class Node
  attr_accessor :node_id, :associated_master_service_id, :associated_fservice_id, :fibre_channel_target_port_group, :name, :platform_info, :software_version, :cip, :cipi, :mip, :mipi, :sip, :sipi, :uuid, :virtual_networks, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Node
    # A node refers to an individual machine in a cluster.
    # Each active node hosts a master service, which is responsible for managing the drives and other services on its node.
    # After a node is made active, its drives will become available for addition to the cluster.
    # param Fixnum node_id: [required] The unique identifier for this node.
    self.node_id = objectHash["nodeID"]

    # param Fixnum associated_master_service_id: [required] The master service responsible for controlling other services on this node.
    self.associated_master_service_id = objectHash["associatedMasterServiceID"]

    # param Fixnum associated_fservice_id: [required]
    self.associated_fservice_id = objectHash["associatedFServiceID"]

    # param str fibre_channel_target_port_group:
    self.fibre_channel_target_port_group = objectHash["fibreChannelTargetPortGroup"]

    # param str name: [required]
    self.name = objectHash["name"]

    # param Platform platform_info: [required] Information about the platform this node is.
    self.platform_info = objectHash["platformInfo"] ? Platform.new(objectHash["platformInfo"]) : nil

    # param str software_version: [required] The version of SolidFire software this node is currently running.
    self.software_version = objectHash["softwareVersion"]

    # param str cip: [required] IP address used for both intra- and inter-cluster communication.
    self.cip = objectHash["cip"]

    # param str cipi: [required] The machine's name for the "cip" interface.
    self.cipi = objectHash["cipi"]

    # param str mip: [required] IP address used for cluster management (hosting the API and web site).
    self.mip = objectHash["mip"]

    # param str mipi: [required] The machine's name for the "mip" interface.
    self.mipi = objectHash["mipi"]

    # param str sip: [required] IP address used for iSCSI traffic.
    self.sip = objectHash["sip"]

    # param str sipi: [required] The machine's name for the "sip" interface.
    self.sipi = objectHash["sipi"]

    # param UUID uuid: [required] UUID of node.
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

    # param VirtualNetworkAddress virtual_networks: [required]
    self.virtual_networks = Array.new(objectHash["virtualNetworks"].length) {|i| VirtualNetworkAddress.new(objectHash["virtualNetworks"][i])}

    # param dict attributes: [required]
    self.attributes = objectHash["attributes"]
  end
end

class PendingNode
  attr_accessor :pending_node_id, :assigned_node_id, :name, :compatible, :platform_info, :cip, :cipi, :mip, :mipi, :sip, :sipi, :software_version, :uuid

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PendingNode
    # A "pending node" is one that has not yet joined the cluster.
    # It can be added to a cluster using the AddNode method.
    # param Fixnum pending_node_id: [required]
    self.pending_node_id = objectHash["pendingNodeID"]

    # param Fixnum assigned_node_id: [required]
    self.assigned_node_id = objectHash["assignedNodeID"]

    # param str name: [required] The host name for this node.
    self.name = objectHash["name"]

    # param bool compatible: [required]
    self.compatible = objectHash["compatible"]

    # param Platform platform_info: [required] Information about the platform this node is.
    self.platform_info = objectHash["platformInfo"] ? Platform.new(objectHash["platformInfo"]) : nil

    # param str cip: [required] IP address used for both intra- and inter-cluster communication.
    self.cip = objectHash["cip"]

    # param str cipi: [required] The machine's name for the "cip" interface.
    self.cipi = objectHash["cipi"]

    # param str mip: [required] IP address used for cluster management (hosting the API and web site).
    self.mip = objectHash["mip"]

    # param str mipi: [required] The machine's name for the "mip" interface.
    self.mipi = objectHash["mipi"]

    # param str sip: [required] IP address used for iSCSI traffic.
    self.sip = objectHash["sip"]

    # param str sipi: [required] The machine's name for the "sip" interface.
    self.sipi = objectHash["sipi"]

    # param str software_version: [required] The version of SolidFire software this node is currently running.
    self.software_version = objectHash["softwareVersion"]

    # param UUID uuid: [required] UUID of node.
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil
  end
end

class PendingActiveNode
  attr_accessor :active_node_key, :assigned_node_id, :async_handle, :cip, :mip, :pending_node_id, :platform_info, :sip, :software_version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PendingActiveNode
    # param str active_node_key: [required]
    self.active_node_key = objectHash["activeNodeKey"]

    # param Fixnum assigned_node_id: [required]
    self.assigned_node_id = objectHash["assignedNodeID"]

    # param Fixnum async_handle: [required]
    self.async_handle = objectHash["asyncHandle"]

    # param str cip: [required]
    self.cip = objectHash["cip"]

    # param str mip: [required]
    self.mip = objectHash["mip"]

    # param Fixnum pending_node_id: [required]
    self.pending_node_id = objectHash["pendingNodeID"]

    # param Platform platform_info: [required]
    self.platform_info = objectHash["platformInfo"] ? Platform.new(objectHash["platformInfo"]) : nil

    # param str sip: [required]
    self.sip = objectHash["sip"]

    # param str software_version: [required]
    self.software_version = objectHash["softwareVersion"]
  end
end

class ListAllNodesResult
  attr_accessor :nodes, :pending_nodes, :pending_active_nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListAllNodesResult
    # param Node nodes: [required]
    self.nodes = Array.new(objectHash["nodes"].length) {|i| Node.new(objectHash["nodes"][i])}

    # param PendingNode pending_nodes: [required]
    self.pending_nodes = Array.new(objectHash["pendingNodes"].length) {|i| PendingNode.new(objectHash["pendingNodes"][i])}

    # param PendingActiveNode pending_active_nodes:  List of objects detailing information about all PendingActive nodes in the system.
    self.pending_active_nodes = Array.new(objectHash["pendingActiveNodes"].length) {|i| PendingActiveNode.new(objectHash["pendingActiveNodes"][i])}
  end
end

class ShutdownResult
  attr_accessor :failed, :successful

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ShutdownResult
    # param Fixnum failed: [required]
    self.failed = objectHash["failed"]

    # param Fixnum successful: [required]
    self.successful = objectHash["successful"]
  end
end

class GetAPIResult
  attr_accessor :current_version, :supported_versions

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAPIResult
    # param float current_version: [required]
    self.current_version = objectHash["currentVersion"]

    # param float supported_versions: [required]
    self.supported_versions = objectHash["supportedVersions"]
  end
end

class LunAssignment
  attr_accessor :volume_id, :lun

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # LunAssignment
    # VolumeID and Lun assignment.
    # param Fixnum volume_id: [required] The volume ID assigned to the Lun.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum lun: [required] Correct LUN values are 0 - 16383. An exception will be seen if an incorrect LUN value is passed.
    self.lun = objectHash["lun"]
  end
end

class VolumeAccessGroupLunAssignments
  attr_accessor :volume_access_group_id, :lun_assignments, :deleted_lun_assignments

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VolumeAccessGroupLunAssignments
    # VolumeAccessGroup ID and Lun to be assigned to all volumes within it.
    # param Fixnum volume_access_group_id: [required] Unique volume access group ID for which the LUN assignments will be modified.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param LunAssignment lun_assignments: [required] The volume IDs with assigned LUN values.
    self.lun_assignments = Array.new(objectHash["lunAssignments"].length) {|i| LunAssignment.new(objectHash["lunAssignments"][i])}

    # param LunAssignment deleted_lun_assignments: [required] The volume IDs with deleted LUN values.
    self.deleted_lun_assignments = Array.new(objectHash["deletedLunAssignments"].length) {|i| LunAssignment.new(objectHash["deletedLunAssignments"][i])}
  end
end

class GetVolumeAccessGroupLunAssignmentsResult
  attr_accessor :volume_access_group_lun_assignments

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeAccessGroupLunAssignmentsResult
    # param VolumeAccessGroupLunAssignments volume_access_group_lun_assignments: [required] List of all physical Fibre Channel ports, or a port for a single node.
    self.volume_access_group_lun_assignments = objectHash["volumeAccessGroupLunAssignments"] ? VolumeAccessGroupLunAssignments.new(objectHash["volumeAccessGroupLunAssignments"]) : nil
  end
end

class MetadataHosts
  attr_accessor :dead_secondaries, :live_secondaries, :primary

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # MetadataHosts
    # The volume services on which the volume metadata resides.
    # param Fixnum dead_secondaries: [required] Secondary metadata (slice) services that are in a dead state.
    self.dead_secondaries = objectHash["deadSecondaries"]

    # param Fixnum live_secondaries: [required] Secondary metadata (slice) services that are currently in a "live" state.
    self.live_secondaries = objectHash["liveSecondaries"]

    # param Fixnum primary: [required] The primary metadata (slice) services hosting the volume.
    self.primary = objectHash["primary"]
  end
end

class VolumeStats
  attr_accessor :account_id, :actual_iops, :average_iopsize, :burst_iopscredit, :client_queue_depth, :latency_usec, :metadata_hosts, :non_zero_blocks, :read_bytes, :read_latency_usec, :read_ops, :throttle, :timestamp, :total_latency_usec, :unaligned_reads, :unaligned_writes, :volume_access_groups, :volume_id, :volume_size, :volume_utilization, :write_bytes, :write_latency_usec, :write_ops, :zero_blocks, :write_bytes_last_sample, :sample_period_msec, :read_bytes_last_sample, :read_ops_last_sample, :write_ops_last_sample

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VolumeStats
    # Contains statistical data for an individual volume.
    # param Fixnum account_id: [required] AccountID of the volume owner.
    self.account_id = objectHash["accountID"]

    # param Fixnum actual_iops:  Current actual IOPS to the volume in the last 500 milliseconds.
    self.actual_iops = objectHash["actualIOPS"]

    # param Fixnum average_iopsize:  Average size in bytes of recent I/O to the volume in the last 500 milliseconds.
    self.average_iopsize = objectHash["averageIOPSize"]

    # param Fixnum burst_iopscredit:  The total number of IOP credits available to the user. When users are not using up to the max IOPS, credits are accrued.
    self.burst_iopscredit = objectHash["burstIOPSCredit"]

    # param Fixnum client_queue_depth:  The number of outstanding read and write operations to the cluster.
    self.client_queue_depth = objectHash["clientQueueDepth"]

    # param Fixnum latency_usec:  The observed latency time, in microseconds, to complete operations to a volume. A "0" (zero) value means there is no I/O to the volume.
    self.latency_usec = objectHash["latencyUSec"]

    # param MetadataHosts metadata_hosts:  The volume services on which the volume metadata resides.
    self.metadata_hosts = objectHash["metadataHosts"] ? MetadataHosts.new(objectHash["metadataHosts"]) : nil

    # param Fixnum non_zero_blocks: [required] The number of 4KiB blocks with data after the last garbage collection operation has completed.
    self.non_zero_blocks = objectHash["nonZeroBlocks"]

    # param Fixnum read_bytes: [required] Total bytes read by clients.
    self.read_bytes = objectHash["readBytes"]

    # param Fixnum read_latency_usec:  The average time, in microseconds, to complete read operations.
    self.read_latency_usec = objectHash["readLatencyUSec"]

    # param Fixnum read_ops: [required] Total read operations.
    self.read_ops = objectHash["readOps"]

    # param float throttle:  A floating value between 0 and 1 that represents how much the system is throttling clients below their max IOPS because of re-replication of data, transient errors and snapshots taken.
    self.throttle = objectHash["throttle"]

    # param str timestamp: [required] The current time in UTC.
    self.timestamp = objectHash["timestamp"]

    # param Fixnum total_latency_usec:  The average time, in microseconds, to complete read and write operations to a volume.
    self.total_latency_usec = objectHash["totalLatencyUSec"]

    # param Fixnum unaligned_reads: [required] For 512e volumes, the number of read operations that were not on a 4k sector boundary. High numbers of unaligned reads may indicate improper partition alignment.
    self.unaligned_reads = objectHash["unalignedReads"]

    # param Fixnum unaligned_writes: [required] For 512e volumes, the number of write operations that were not on a 4k sector boundary. High numbers of unaligned writes may indicate improper partition alignment.
    self.unaligned_writes = objectHash["unalignedWrites"]

    # param Fixnum volume_access_groups: [required] List of volume access group(s) to which a volume beintegers.
    self.volume_access_groups = objectHash["volumeAccessGroups"]

    # param Fixnum volume_id: [required] Volume ID of the volume.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum volume_size: [required] Total provisioned capacity in bytes.
    self.volume_size = objectHash["volumeSize"]

    # param float volume_utilization:  A floating value that describes how much the client is using the volume.  Values:  0 = Client is not using the volume 1 = Client is using their max >1 = Client is using their burst
    self.volume_utilization = objectHash["volumeUtilization"]

    # param Fixnum write_bytes: [required] Total bytes written by clients.
    self.write_bytes = objectHash["writeBytes"]

    # param Fixnum write_latency_usec:  The average time, in microseconds, to complete write operations.
    self.write_latency_usec = objectHash["writeLatencyUSec"]

    # param Fixnum write_ops: [required] Total write operations occurring on the volume.
    self.write_ops = objectHash["writeOps"]

    # param Fixnum zero_blocks: [required] Total number of 4KiB blocks without data after the last round of garbage collection operation has completed.
    self.zero_blocks = objectHash["zeroBlocks"]

    # param Fixnum write_bytes_last_sample:  The total number of bytes written to the volume during the last sample period.
    self.write_bytes_last_sample = objectHash["writeBytesLastSample"]

    # param Fixnum sample_period_msec:  The length of the sample period in milliseconds.
    self.sample_period_msec = objectHash["samplePeriodMSec"]

    # param Fixnum read_bytes_last_sample:  The total number of bytes read from the volume during the last sample period.
    self.read_bytes_last_sample = objectHash["readBytesLastSample"]

    # param Fixnum read_ops_last_sample:  The total number of read operations durin gth elast sample period.
    self.read_ops_last_sample = objectHash["readOpsLastSample"]

    # param Fixnum write_ops_last_sample:  The total number of write operations during the last sample period.
    self.write_ops_last_sample = objectHash["writeOpsLastSample"]
  end
end

class ListVolumeStatsByAccountResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByAccountResult
    # param VolumeStats volume_stats: [required] List of account activity information. Note: The volumeID member is 0 for each entry, as the values represent the summation of all volumes owned by the account.
    self.volume_stats = Array.new(objectHash["volumeStats"].length) {|i| VolumeStats.new(objectHash["volumeStats"][i])}
  end
end

class ModifyGroupSnapshot
  attr_accessor :group_snapshot_id, :expiration_time, :enable_remote_replication

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyGroupSnapshot
    # ModifyGroupSnapshot enables you to change the attributes of a group of snapshots. You can also use this method to enable snapshots created on the Read/Write (source) volume to be remotely replicated to a target SolidFire storage system.
    # param Fixnum group_snapshot_id: [required] Specifies the ID of the group of snapshots.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param str expiration_time:  Sets the time when the snapshot should be removed. If unspecified, the current time is used.
    self.expiration_time = objectHash["expirationTime"]

    # param bool enable_remote_replication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]
  end
end

class DeleteSnapshot
  attr_accessor :snapshot_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteSnapshot
    # DeleteSnapshot enables you to delete a snapshot. A snapshot that is currently the "active" snapshot cannot be deleted. You must
    # rollback and make another snapshot "active" before the current snapshot can be deleted. For more details on rolling back snapshots, see RollbackToSnapshot.
    # param Fixnum snapshot_id: [required] The ID of the snapshot to be deleted.
    self.snapshot_id = objectHash["snapshotID"]
  end
end

class ScheduleInfo
  attr_accessor :retention, :volume_ids, :enable_remote_replication, :snapshot_name

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ScheduleInfo
    # param str retention:  The amount of time the snapshot will be retained in HH:mm:ss.
    self.retention = objectHash["retention"]

    # param Fixnum volume_ids:  A list of volume IDs to be included in the group snapshot.
    self.volume_ids = objectHash["volumeIDs"]

    # param bool enable_remote_replication:  Indicates if the snapshot should be included in remote replication.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]

    # param str snapshot_name:  The snapshot name to be used.
    self.snapshot_name = objectHash["snapshotName"]
  end
end

class Schedule
  attr_accessor :schedule_info, :run_next_interval, :has_error, :paused, :last_run_time_started, :starting_date, :to_be_deleted, :recurring, :frequency, :schedule_id, :name, :last_run_status

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Schedule
    # Schedule is an object containing information about each schedule created to autonomously make a snapshot of a volume. The return object includes information for all schedules. If scheduleID is used to identify a specific schedule then only information for that scheduleID is returned. Schedules information is returned with the API method, see ListSchedules on the SolidFire API guide page 245.
    # param bool run_next_interval:  Indicates whether or not the schedule will run the next time the scheduler is active. When set to "true", the schedule will run the next time the scheduler is active and then reset back to "false".
    self.run_next_interval = objectHash["runNextInterval"]

    # param bool has_error:  Indicates whether or not the schedule has errors.
    self.has_error = objectHash["hasError"]

    # param bool paused:  Indicates whether or not the schedule is paused.
    self.paused = objectHash["paused"]

    # param str last_run_time_started:  Indicates the last time the schedule started n ISO 8601 date string. Valid values are: Success Failed
    self.last_run_time_started = objectHash["lastRunTimeStarted"]

    # param str starting_date:  Indicates the date the first time the schedule began of will begin. Formatted in UTC time.
    self.starting_date = objectHash["startingDate"]

    # param bool to_be_deleted:  Indicates if the schedule is marked for deletion.
    self.to_be_deleted = objectHash["toBeDeleted"]

    # param ScheduleInfo schedule_info: [required] Includes the unique name given to the schedule, the retention period for the snapshot that was created, and the volume ID of the volume from which the snapshot was created.
    self.schedule_info = objectHash["scheduleInfo"] ? ScheduleInfo.new(objectHash["scheduleInfo"]) : nil

    # param bool recurring:  Indicates whether or not the schedule is recurring.
    self.recurring = objectHash["recurring"]

    # param Frequency frequency: [required] Indicates the frequency of the schedule occurrence. Set this to a type that inherits from Frequency. Valid types are: DayOfWeekFrequency DayOfMonthFrequency TimeIntervalFrequency
    self.frequency = objectHash["frequency"] ? Frequency.new(objectHash["frequency"]) : nil

    # param Fixnum schedule_id:  Unique ID of the schedule
    self.schedule_id = objectHash["scheduleID"]

    # param str name: [required] Unique name assigned to the schedule.
    self.name = objectHash["name"]

    # param str last_run_status:  Indicates the status of the last scheduled snapshot. Valid values are: Success Failed
    self.last_run_status = objectHash["lastRunStatus"]
  end
end

class GetScheduleResult
  attr_accessor :schedule

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetScheduleResult
    # param Schedule schedule: [required] The schedule attributes.
    self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
  end
end

class ModifyInitiator
  attr_accessor :initiator_id, :alias, :volume_access_group_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyInitiator
    # Object containing characteristics of each initiator to modify
    # param Fixnum initiator_id: [required] (Required) The numeric ID of the initiator to modify. (Integer)
    self.initiator_id = objectHash["initiatorID"]

    # param str alias:  (Optional) A new friendly name to assign to the initiator. (String)
    self.alias = objectHash["alias"]

    # param Fixnum volume_access_group_id:  (Optional) The ID of the volume access group into to which the newly created initiator should be added. If the initiator was previously in a different volume access group, it is removed from the old volume access group. If this key is present but null, the initiator is removed from its current volume access group, but not placed in any new volume access group. (Integer)
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param dict attributes:  (Optional) A new set of JSON attributes assigned to this initiator. (JSON Object)
    self.attributes = objectHash["attributes"]
  end
end

class ModifyInitiators
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyInitiators
    # ModifyInitiators enables you to change the attributes of one or more existing initiators. You cannot change the name of an existing
    # initiator. If you need to change the name of an initiator, delete it first with DeleteInitiators and create a new one with
    # CreateInitiators.
    # If ModifyInitiators fails to change one of the initiators provided in the parameter, the method returns an error and does not modify
    # any initiators (no partial completion is possible).
    # param ModifyInitiator initiators: [required] A list of objects containing characteristics of each initiator to modify. Values are: initiatorID: (Required) The ID of the initiator to modify. (Integer) alias: (Optional) A new friendly name to assign to the initiator. (String) attributes: (Optional) A new set of JSON attributes to assign to the initiator. (JSON Object) volumeAccessGroupID: (Optional) The ID of the volume access group into to which the initiator should be added. If the initiator was previously in a different volume access group, it is removed from the old volume access group. If this key is present but null, the initiator is removed from its current volume access group, but not placed in any new volume access group. (Integer)
    self.initiators = Array.new(objectHash["initiators"].length) {|i| ModifyInitiator.new(objectHash["initiators"][i])}
  end
end

class ListVolumes
  attr_accessor :start_volume_id, :limit, :volume_status, :accounts, :is_paired, :volume_ids, :volume_name, :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumes
    # The ListVolumes method enables you to retrieve a list of volumes that are in a cluster. You can specify the volumes you want to
    # return in the list by using the available parameters.
    # param Fixnum start_volume_id:  Only volumes with an ID greater than or equal to this value are returned. Mutually exclusive with the volumeIDs parameter.
    self.start_volume_id = objectHash["startVolumeID"]

    # param Fixnum limit:  Specifies the maximum number of volume results that are returned. Mutually exclusive with the volumeIDs parameter.
    self.limit = objectHash["limit"]

    # param str volume_status:  Only volumes with a status equal to the status value are returned. Possible values are: creating snapshotting active deleted
    self.volume_status = objectHash["volumeStatus"]

    # param Fixnum accounts:  Returns only the volumes owned by the accounts you specify here. Mutually exclusive with the volumeIDs parameter.
    self.accounts = objectHash["accounts"]

    # param bool is_paired:  Returns volumes that are paired or not paired. Possible values are: true: Returns all paired volumes. false: Returns all volumes that are not paired.
    self.is_paired = objectHash["isPaired"]

    # param Fixnum volume_ids:  A list of volume IDs. If you supply this parameter, other parameters operate only on this set of volumes. Mutually exclusive with the accounts, startVolumeID, and limit parameters.
    self.volume_ids = objectHash["volumeIDs"]

    # param str volume_name:  Only volume object information matching the volume name is returned.
    self.volume_name = objectHash["volumeName"]

    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class ModifyScheduleResult
  attr_accessor :schedule

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyScheduleResult
    # param Schedule schedule:
    self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
  end
end

class ClearClusterFaults
  attr_accessor :fault_types

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClearClusterFaults
    # You can use the ClearClusterFaults method to clear information about both current and previously detected faults. Both resolved
    # and unresolved faults can be cleared.
    # param str fault_types:  Determines the types of faults cleared. Possible values are: current: Faults that are currently detected and have not been resolved. resolved: (Default) Faults that were previously detected and resolved. all: Both current and resolved faults are cleared. The fault status can be determined by the resolved field of the fault object.
    self.fault_types = objectHash["faultTypes"]
  end
end

class RemoveClusterAdminResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveClusterAdminResult
  end
end

class AsyncHandle
  attr_accessor :async_result_id, :completed, :create_time, :last_update_time, :result_type, :success, :data

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AsyncHandle
    # param Fixnum async_result_id: [required] The ID of the result.
    self.async_result_id = objectHash["asyncResultID"]

    # param bool completed: [required] Returns true if it is completed and false if it isn't.
    self.completed = objectHash["completed"]

    # param str create_time: [required] The time at which the asyncronous result was created
    self.create_time = objectHash["createTime"]

    # param str last_update_time: [required] Time at which the result was last updated
    self.last_update_time = objectHash["lastUpdateTime"]

    # param str result_type: [required] The type of result. Could be Clone, DriveAdd, etc.
    self.result_type = objectHash["resultType"]

    # param bool success: [required] Returns whether the result was a success or failure.
    self.success = objectHash["success"]

    # param dict data: [required] Attributes related to the result
    self.data = objectHash["data"]
  end
end

class ListAsyncResultsResult
  attr_accessor :async_handles

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListAsyncResultsResult
    # param AsyncHandle async_handles: [required] An array of serialized asynchronous method results.
    self.async_handles = Array.new(objectHash["asyncHandles"].length) {|i| AsyncHandle.new(objectHash["asyncHandles"][i])}
  end
end

class Account
  attr_accessor :account_id, :username, :status, :volumes, :initiator_secret, :target_secret, :storage_container_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Account
    # The object containing information about an account.
    # This object only includes "configured" information about the account, not any runtime or usage information.
    # param Fixnum account_id: [required] Unique AccountID for the account.
    self.account_id = objectHash["accountID"]

    # param str username: [required] User name for the account.
    self.username = objectHash["username"]

    # param str status: [required] Current status of the account.
    self.status = objectHash["status"]

    # param Fixnum volumes: [required] List of VolumeIDs for Volumes owned by this account.
    self.volumes = objectHash["volumes"]

    # param CHAPSecret initiator_secret:  CHAP secret to use for the initiator.
    self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

    # param CHAPSecret target_secret:  CHAP secret to use for the target (mutual CHAP authentication).
    self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

    # param UUID storage_container_id:  The id of the storage container associated with the account
    self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

    # param dict attributes:  List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class AddAccountResult
  attr_accessor :account_id, :account

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddAccountResult
    # param Fixnum account_id: [required] AccountID for the newly created Account.
    self.account_id = objectHash["accountID"]

    # param Account account:  The full account object
    self.account = objectHash["account"] ? Account.new(objectHash["account"]) : nil
  end
end

class GetFeatureStatus
  attr_accessor :feature

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetFeatureStatus
    # GetFeatureStatus enables you to retrieve the status of a cluster feature.
    # param str feature:  Specifies the feature for which the status is returned. Valid value is: vvols: Retrieve status for the NetApp SolidFire VVols cluster feature.
    self.feature = objectHash["feature"]
  end
end

class GetIpmiConfig
  attr_accessor :chassis_type

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiConfig
    # GetIpmiConfig enables you to retrieve hardware sensor information from sensors that are in your node.
    # param str chassis_type:  Displays information for each node chassis type. Valid values are: all: Returns sensor information for each chassis type. {chassis type}: Returns sensor information for a specified chassis type.
    self.chassis_type = objectHash["chassisType"]
  end
end

class ModifySnapshot
  attr_accessor :snapshot_id, :expiration_time, :enable_remote_replication

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifySnapshot
    # ModifySnapshot enables you to change the attributes currently assigned to a snapshot. You can use this method to enable snapshots created on
    # the Read/Write (source) volume to be remotely replicated to a target SolidFire storage system.
    # param Fixnum snapshot_id: [required] Specifies the ID of the snapshot.
    self.snapshot_id = objectHash["snapshotID"]

    # param str expiration_time:  Sets the time when the snapshot should be removed.
    self.expiration_time = objectHash["expirationTime"]

    # param bool enable_remote_replication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]
  end
end

class ModifyClusterFullThresholdResult
  attr_accessor :block_fullness, :fullness, :max_metadata_over_provision_factor, :metadata_fullness, :slice_reserve_used_threshold_pct, :stage2_aware_threshold, :stage2_block_threshold_bytes, :stage3_block_threshold_bytes, :stage3_block_threshold_percent, :stage3_low_threshold, :stage4_critical_threshold, :stage4_block_threshold_bytes, :stage5_block_threshold_bytes, :sum_total_cluster_bytes, :sum_total_metadata_cluster_bytes, :sum_used_cluster_bytes, :sum_used_metadata_cluster_bytes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyClusterFullThresholdResult
    # param str block_fullness: [required] Current computed level of block fullness of the cluster. Possible values: stage1Happy: No alerts or error conditions. stage2Aware: 3 nodes of capacity available. stage3Low: 2 nodes of capacity available. stage4Critical: 1 node of capacity available. No new volumes or clones can be created. stage5CompletelyConsumed: Completely consumed. Cluster is read-only, iSCSI connection is maintained but all writes are suspended.
    self.block_fullness = objectHash["blockFullness"]

    # param str fullness: [required] Reflects the highest level of fullness between "blockFullness" and "metadataFullness".
    self.fullness = objectHash["fullness"]

    # param Fixnum max_metadata_over_provision_factor: [required] A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created.
    self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]

    # param str metadata_fullness: [required] Current computed level of metadata fullness of the cluster.
    self.metadata_fullness = objectHash["metadataFullness"]

    # param Fixnum slice_reserve_used_threshold_pct: [required] Error condition; message sent to "Alerts" if the reserved slice utilization is greater than the sliceReserveUsedThresholdPct value returned.
    self.slice_reserve_used_threshold_pct = objectHash["sliceReserveUsedThresholdPct"]

    # param Fixnum stage2_aware_threshold: [required] Awareness condition: Value that is set for "Stage 2" cluster threshold level.
    self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

    # param Fixnum stage2_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage2 condition will exist.
    self.stage2_block_threshold_bytes = objectHash["stage2BlockThresholdBytes"]

    # param Fixnum stage3_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage3 condition will exist.
    self.stage3_block_threshold_bytes = objectHash["stage3BlockThresholdBytes"]

    # param Fixnum stage3_block_threshold_percent: [required] The percent value set for stage3. At this percent full, a warning will be posted in the Alerts log.
    self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

    # param Fixnum stage3_low_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is getting low.
    self.stage3_low_threshold = objectHash["stage3LowThreshold"]

    # param Fixnum stage4_critical_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is critically low.
    self.stage4_critical_threshold = objectHash["stage4CriticalThreshold"]

    # param Fixnum stage4_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage4 condition will exist.
    self.stage4_block_threshold_bytes = objectHash["stage4BlockThresholdBytes"]

    # param Fixnum stage5_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage5 condition will exist.
    self.stage5_block_threshold_bytes = objectHash["stage5BlockThresholdBytes"]

    # param Fixnum sum_total_cluster_bytes: [required] Physical capacity of the cluster measured in bytes.
    self.sum_total_cluster_bytes = objectHash["sumTotalClusterBytes"]

    # param Fixnum sum_total_metadata_cluster_bytes: [required] Total amount of space that can be used to store metadata.
    self.sum_total_metadata_cluster_bytes = objectHash["sumTotalMetadataClusterBytes"]

    # param Fixnum sum_used_cluster_bytes: [required] Number of bytes used on the cluster.
    self.sum_used_cluster_bytes = objectHash["sumUsedClusterBytes"]

    # param Fixnum sum_used_metadata_cluster_bytes: [required] Amount of space used on volume drives to store metadata.
    self.sum_used_metadata_cluster_bytes = objectHash["sumUsedMetadataClusterBytes"]
  end
end

class ModifySchedule
  attr_accessor :schedule

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifySchedule
    # ModifySchedule enables you to change the intervals at which a scheduled snapshot occurs. This allows for adjustment to the snapshot frequency and retention.
    # param Schedule schedule: [required] The "Schedule" object will be used to modify an existing schedule. The ScheduleID property is required. Frequency property must be of type that inherits from Frequency. Valid types are: DaysOfMonthFrequency DaysOrWeekFrequency TimeIntervalFrequency
    self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
  end
end

class NewDrive
  attr_accessor :drive_id, :type

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NewDrive
    # param Fixnum drive_id: [required] A unique identifier for this drive.
    self.drive_id = objectHash["driveID"]

    # param str type:  block or slice
    self.type = objectHash["type"]
  end
end

class ClusterStats
  attr_accessor :cluster_utilization, :client_queue_depth, :read_bytes, :read_ops, :timestamp, :write_bytes, :write_ops, :actual_iops, :average_iopsize, :latency_usec, :read_bytes_last_sample, :read_latency_usec, :read_ops_last_sample, :sample_period_msec, :unaligned_reads, :unaligned_writes, :write_bytes_last_sample, :write_latency_usec, :write_ops_last_sample

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterStats
    # param float cluster_utilization: [required] The amount of cluster capacity being utilized.
    self.cluster_utilization = objectHash["clusterUtilization"]

    # param Fixnum client_queue_depth: [required]
    self.client_queue_depth = objectHash["clientQueueDepth"]

    # param Fixnum read_bytes: [required] Total bytes read by clients.
    self.read_bytes = objectHash["readBytes"]

    # param Fixnum read_ops: [required] Total read operations.
    self.read_ops = objectHash["readOps"]

    # param str timestamp: [required] Current time in UTC format. ISO 8601 date string.
    self.timestamp = objectHash["timestamp"]

    # param Fixnum write_bytes: [required] Total bytes written by clients.
    self.write_bytes = objectHash["writeBytes"]

    # param Fixnum write_ops: [required] Total write operations.
    self.write_ops = objectHash["writeOps"]

    # param Fixnum actual_iops:
    self.actual_iops = objectHash["actualIOPS"]

    # param Fixnum average_iopsize:
    self.average_iopsize = objectHash["averageIOPSize"]

    # param Fixnum latency_usec:
    self.latency_usec = objectHash["latencyUSec"]

    # param Fixnum read_bytes_last_sample:
    self.read_bytes_last_sample = objectHash["readBytesLastSample"]

    # param Fixnum read_latency_usec:
    self.read_latency_usec = objectHash["readLatencyUSec"]

    # param Fixnum read_ops_last_sample:
    self.read_ops_last_sample = objectHash["readOpsLastSample"]

    # param Fixnum sample_period_msec:
    self.sample_period_msec = objectHash["samplePeriodMsec"]

    # param Fixnum unaligned_reads:
    self.unaligned_reads = objectHash["unalignedReads"]

    # param Fixnum unaligned_writes:
    self.unaligned_writes = objectHash["unalignedWrites"]

    # param Fixnum write_bytes_last_sample:
    self.write_bytes_last_sample = objectHash["writeBytesLastSample"]

    # param Fixnum write_latency_usec:
    self.write_latency_usec = objectHash["writeLatencyUSec"]

    # param Fixnum write_ops_last_sample:
    self.write_ops_last_sample = objectHash["writeOpsLastSample"]
  end
end

class GetClusterStatsResult
  attr_accessor :cluster_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterStatsResult
    # param ClusterStats cluster_stats: [required]
    self.cluster_stats = objectHash["clusterStats"] ? ClusterStats.new(objectHash["clusterStats"]) : nil
  end
end

class ModifyVolumeAccessGroup
  attr_accessor :volume_access_group_id, :virtual_network_id, :virtual_network_tags, :name, :initiators, :volumes, :delete_orphan_initiators, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumeAccessGroup
    # You can use ModifyVolumeAccessGroup to update initiators and add or remove volumes from a volume access group. If a specified initiator or volume is a duplicate of what currently exists, the volume access group is left as-is. If you do not specify a value for volumes or initiators, the current list of initiators and volumes is not changed.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group to modify.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param Fixnum virtual_network_id:  The ID of the SolidFire virtual network to associate the volume access group with.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tags:  The ID of the SolidFire virtual network to associate the volume access group with.
    self.virtual_network_tags = objectHash["virtualNetworkTags"]

    # param str name:  The new name for this volume access group. Not required to be unique, but recommended.
    self.name = objectHash["name"]

    # param str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators are not modified.
    self.initiators = objectHash["initiators"]

    # param Fixnum volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes are not modified.
    self.volumes = objectHash["volumes"]

    # param bool delete_orphan_initiators:  true: Delete initiator objects after they are removed from a volume access group. false: Do not delete initiator objects after they are removed from a volume access group.
    self.delete_orphan_initiators = objectHash["deleteOrphanInitiators"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class VolumeQOS
  attr_accessor :min_iops, :max_iops, :burst_iops, :burst_time, :curve

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VolumeQOS
    # Quality of Service (QoS) Result values are used on SolidFire volumes to provision performance expectations.
    # param Fixnum min_iops: [required] Desired minimum 4KB IOPS to guarantee. The allowed IOPS will only drop below this level if all volumes have been capped at their min IOPS value and there is still insufficient performance capacity.
    self.min_iops = objectHash["minIOPS"]

    # param Fixnum max_iops: [required] Desired maximum 4KB IOPS allowed over an extended period of time.
    self.max_iops = objectHash["maxIOPS"]

    # param Fixnum burst_iops: [required] Maximum "peak" 4KB IOPS allowed for short periods of time. Allows for bursts of I/O activity over the normal max IOPS value.
    self.burst_iops = objectHash["burstIOPS"]

    # param Fixnum burst_time: [required] The length of time burst IOPS is allowed. The value returned is represented in time units of seconds. Note: this value is calculated by the system based on IOPS set for QoS.
    self.burst_time = objectHash["burstTime"]

    # param Fixnum curve: [required] The curve is a set of key-value pairs. The keys are I/O sizes in bytes. The values represent the cost performing an IOP at a specific I/O size. The curve is calculated relative to a 4096 byte operation set at 100 IOPS.
    self.curve = objectHash["curve"]
  end
end

class SnapshotReplication
  attr_accessor :state, :state_details

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnapshotReplication
    # param str state: [required] The state of the snapshot replication.
    self.state = objectHash["state"]

    # param str state_details: [required] Reserved for future use.
    self.state_details = objectHash["stateDetails"]
  end
end

class RemoteReplication
  attr_accessor :mode, :pause_limit, :remote_service_id, :resume_details, :snapshot_replication, :state, :state_details

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoteReplication
    # Details on the volume replication.
    # param str mode: [required] Volume replication mode. Possible values: Async: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster. Sync: Source acknowledges write when the data is stored locally and on the remote cluster. SnapshotsOnly: Only snapshots created on the source cluster will be replicated. Active writes from the source volume will not be replicated.
    self.mode = objectHash["mode"]

    # param Fixnum pause_limit: [required] The number of occurring write ops before auto-pausing, on a per volume pair level.
    self.pause_limit = objectHash["pauseLimit"]

    # param Fixnum remote_service_id: [required] The remote slice service ID.
    self.remote_service_id = objectHash["remoteServiceID"]

    # param str resume_details: [required] Reserved for future use.
    self.resume_details = objectHash["resumeDetails"]

    # param SnapshotReplication snapshot_replication: [required] The details of snapshot replication.
    self.snapshot_replication = objectHash["snapshotReplication"] ? SnapshotReplication.new(objectHash["snapshotReplication"]) : nil

    # param str state: [required] The state of the volume replication.
    self.state = objectHash["state"]

    # param str state_details: [required] Reserved for future use.
    self.state_details = objectHash["stateDetails"]
  end
end

class VolumePair
  attr_accessor :cluster_pair_id, :remote_volume_id, :remote_slice_id, :remote_volume_name, :volume_pair_uuid, :remote_replication

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VolumePair
    # The Volume Pair Info is an object containing information about a volume that is paired on a remote cluster.
    # If the volume is not paired, this object is null.
    # param Fixnum cluster_pair_id: [required] The remote cluster a volume is paired with.
    self.cluster_pair_id = objectHash["clusterPairID"]

    # param Fixnum remote_volume_id: [required] The VolumeID on the remote cluster a volume is paired with.
    self.remote_volume_id = objectHash["remoteVolumeID"]

    # param Fixnum remote_slice_id: [required] The SliceID on the remote cluster a volume is paired with.
    self.remote_slice_id = objectHash["remoteSliceID"]

    # param str remote_volume_name: [required] The last-observed name of the volume on the remote cluster a volume is paired with.
    self.remote_volume_name = objectHash["remoteVolumeName"]

    # param UUID volume_pair_uuid: [required] A UUID in canonical form.
    self.volume_pair_uuid = objectHash["volumePairUUID"] ? UUIDTools::UUID.parse(objectHash["volumePairUUID"]) : nil

    # param RemoteReplication remote_replication: [required] Details about the replication configuration for this volume pair.
    self.remote_replication = objectHash["remoteReplication"] ? RemoteReplication.new(objectHash["remoteReplication"]) : nil
  end
end

class Volume
  attr_accessor :volume_id, :name, :account_id, :create_time, :status, :access, :enable512e, :iqn, :scsi_euidevice_id, :scsi_naadevice_id, :qos, :volume_access_groups, :volume_pairs, :delete_time, :purge_time, :slice_count, :total_size, :block_size, :virtual_volume_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Volume
    # Volumes Info is an object containing information about a volume.
    # The return objects only include "configured" information about the volume and not runtime or usage information.
    # Information about paired volumes will also be returned.
    # param Fixnum volume_id: [required] Unique VolumeID for the volume.
    self.volume_id = objectHash["volumeID"]

    # param str name: [required] Name of the volume as provided at creation time.
    self.name = objectHash["name"]

    # param Fixnum account_id: [required] Unique AccountID for the account.
    self.account_id = objectHash["accountID"]

    # param str create_time: [required] UTC formatted time the volume was created.
    self.create_time = objectHash["createTime"]

    # param str status: [required] Current status of the volume init: A volume that is being initialized and is not ready for connections. active: An active volume ready for connections.
    self.status = objectHash["status"]

    # param str access: [required] Access allowed for the volume readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. replicationTarget: Designated as a target volume in a replicated volume pair.
    self.access = objectHash["access"]

    # param bool enable512e: [required] If "true", the volume provides 512 byte sector emulation.
    self.enable512e = objectHash["enable512e"]

    # param str iqn:  Volume iSCSI Qualified Name.
    self.iqn = objectHash["iqn"]

    # param str scsi_euidevice_id: [required] Globally unique SCSI device identifier for the volume in EUI-64 based 16-byte format.
    self.scsi_euidevice_id = objectHash["scsiEUIDeviceID"]

    # param str scsi_naadevice_id: [required] Globally unique SCSI device identifier for the volume in NAA IEEE Registered Extended format.
    self.scsi_naadevice_id = objectHash["scsiNAADeviceID"]

    # param VolumeQOS qos: [required] Quality of service settings for this volume.
    self.qos = objectHash["qos"] ? VolumeQOS.new(objectHash["qos"]) : nil

    # param Fixnum volume_access_groups: [required] List of volume access groups to which a volume beintegers.
    self.volume_access_groups = objectHash["volumeAccessGroups"]

    # param VolumePair volume_pairs: [required] Information about a paired volume. Available only if a volume is paired. @see VolumePairs for return values.
    self.volume_pairs = Array.new(objectHash["volumePairs"].length) {|i| VolumePair.new(objectHash["volumePairs"][i])}

    # param str delete_time:  The time this volume was deleted. If this has no value, the volume has not yet been deleted.
    self.delete_time = objectHash["deleteTime"]

    # param str purge_time:  The time this volume will be purged from the system. If this has no value, the volume has not yet been deleted (and is not scheduled for purging).
    self.purge_time = objectHash["purgeTime"]

    # param Fixnum slice_count: [required] The number of slices backing this volume. In the current software, this value will always be 1.
    self.slice_count = objectHash["sliceCount"]

    # param Fixnum total_size: [required] Total size of this volume in bytes.
    self.total_size = objectHash["totalSize"]

    # param Fixnum block_size: [required] Size of the blocks on the volume.
    self.block_size = objectHash["blockSize"]

    # param UUID virtual_volume_id:  Virtual volume ID this volume backs.
    self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class CloneVolumeResult
  attr_accessor :clone_id, :volume, :volume_id, :async_handle

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CloneVolumeResult
    # param Volume volume:  The resulting volume
    self.volume = objectHash["volume"] ? Volume.new(objectHash["volume"]) : nil

    # param Fixnum clone_id: [required] The ID of the newly-created clone.
    self.clone_id = objectHash["cloneID"]

    # param Fixnum volume_id: [required] The volume ID of the newly-created clone.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum async_handle: [required] Handle value used to track the progress of the clone.
    self.async_handle = objectHash["asyncHandle"]
  end
end

class GetVolumeStats
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeStats
    # GetVolumeStats enables  you to retrieve high-level activity measurements for a single volume. Values are cumulative from the creation of the volume.
    # param Fixnum volume_id: [required] Specifies the volume for which statistics are gathered.
    self.volume_id = objectHash["volumeID"]
  end
end

class GetDriveStats
  attr_accessor :drive_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetDriveStats
    # GetDriveStats returns high-level activity measurements for a single drive. Values are cumulative from the addition of the drive to the
    # cluster. Some values are specific to block drives. You might not obtain statistical data for both block and metadata drives when you
    # run this method.
    # param Fixnum drive_id: [required] Specifies the drive for which statistics are gathered.
    self.drive_id = objectHash["driveID"]
  end
end

class GetVolumeAccessGroupLunAssignments
  attr_accessor :volume_access_group_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeAccessGroupLunAssignments
    # The GetVolumeAccessGroupLunAssignments
    # method enables you to retrieve details on LUN mappings
    # of a specified volume access group.
    # param Fixnum volume_access_group_id: [required] The unique volume access group ID used to return information.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]
  end
end

class ListVolumeStats
  attr_accessor :volume_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStats
    # ListVolumeStats returns high-level activity measurements for a single volume, list of volumes, or all volumes (if you omit the volumeIDs parameter). Measurement values are cumulative from the creation of the volume.
    # param Fixnum volume_ids:  A list of volume IDs of volumes from which to retrieve activity information.
    self.volume_ids = objectHash["volumeIDs"]
  end
end

class AddAccount
  attr_accessor :username, :initiator_secret, :target_secret, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddAccount
    # You can use AddAccount to add a new account to the system. You can create new volumes under the new account. The CHAP settings you specify for the account apply to all volumes owned by the account.
    # param str username: [required] Specifies the username for this account. (Might be 1 to 64 characters in length).
    self.username = objectHash["username"]

    # param CHAPSecret initiator_secret:  The CHAP secret to use for the initiator. This secret must be 12-16 characters in length and should be impenetrable. The initiator CHAP secret must be unique and cannot be the same as the target CHAP secret. If unspecified, a random secret is created.
    self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

    # param CHAPSecret target_secret:  The CHAP secret to use for the target (mutual CHAP authentication). This secret must be 12-16 characters in length and should be impenetrable. The target CHAP secret must be unique and cannot be the same as the initiator CHAP secret. If unspecified, a random secret is created.
    self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class GetAccountByName
  attr_accessor :username

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAccountByName
    # GetAccountByName enables you to retrieve details about a specific account, given its username.
    # param str username: [required] Username for the account.
    self.username = objectHash["username"]
  end
end

class ListVolumeStatsByVolumeAccessGroupResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVolumeAccessGroupResult
    # param VolumeStats volume_stats: [required] List of account activity information. Note: The volumeID member is 0 for each entry, as the values represent the summation of all volumes owned by the account.
    self.volume_stats = Array.new(objectHash["volumeStats"].length) {|i| VolumeStats.new(objectHash["volumeStats"][i])}
  end
end

class CreateBackupTargetResult
  attr_accessor :backup_target_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateBackupTargetResult
    # param Fixnum backup_target_id: [required] Unique identifier assigned to the backup target.
    self.backup_target_id = objectHash["backupTargetID"]
  end
end

class ListVirtualVolumeHosts
  attr_accessor :virtual_volume_host_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeHosts
    # ListVirtualVolumeHosts returns a list of all virtual volume hosts known to the cluster. A virtual volume host is a VMware ESX host
    # that has initiated a session with the VASA API provider.
    # param UUID virtual_volume_host_ids:  A list of virtual volume host IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume hosts.
    self.virtual_volume_host_ids = Array.new(objectHash["virtualVolumeHostIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["virtualVolumeHostIDs"][i])}
  end
end

class RemoveDrives
  attr_accessor :drives, :force_during_upgrade

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveDrives
    # You can use RemoveDrives to proactively remove drives that are part of the cluster. You might want to use this method when
    # reducing cluster capacity or preparing to replace drives nearing the end of their service life. Any data on the drives is removed and
    # migrated to other drives in the cluster before the drive is removed from the cluster. This is an asynchronous method. Depending on
    # the total capacity of the drives being removed, it might take several minutes to migrate all of the data. Use the GetAsyncResult
    # method to check the status of the remove operation.
    # When removing multiple drives, use a single RemoveDrives method call rather than multiple individual methods with a single drive
    # each. This reduces the amount of data balancing that must occur to even stabilize the storage load on the cluster.
    # You can also remove drives with a "failed" status using RemoveDrives. When you remove a drive with a "failed" status it is not
    # returned to an "available" or active status. The drive is unavailable for use in the cluster.
    # Use the ListDrives method to obtain the driveIDs for the drives you want to remove.
    # param Fixnum drives: [required] List of driveIDs to remove from the cluster.
    self.drives = objectHash["drives"]

    # param bool force_during_upgrade:  If you want to remove a drive during upgrade, this must be set to true.
    self.force_during_upgrade = objectHash["forceDuringUpgrade"]
  end
end

class CancelCloneResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CancelCloneResult
  end
end

class LdapConfiguration
  attr_accessor :auth_type, :enabled, :group_search_base_dn, :group_search_custom_filter, :group_search_type, :search_bind_dn, :server_uris, :user_dntemplate, :user_search_base_dn, :user_search_filter

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # LdapConfiguration
    # LDAP Configuration object returns information about the LDAP configuration on SolidFire storage. LDAP information is returned with the API method GetLdapConfiguration.
    # param str auth_type: [required] Identifies which user authentcation method will be used.  Valid values: DirectBind SearchAndBind
    self.auth_type = objectHash["authType"]

    # param bool enabled: [required] Identifies whether or not the system is enabled for LDAP.  Valid values: true false
    self.enabled = objectHash["enabled"]

    # param str group_search_base_dn: [required] The base DN of the tree to start the group search (will do a subtree search from here).
    self.group_search_base_dn = objectHash["groupSearchBaseDN"]

    # param str group_search_custom_filter: [required] The custom search filter used.
    self.group_search_custom_filter = objectHash["groupSearchCustomFilter"]

    # param str group_search_type: [required] Controls the default group search filter used, can be one of the following: NoGroups: No group support. ActiveDirectory: Nested membership of all of a user's AD groups. MemberDN: MemberDN style groups (single-level).
    self.group_search_type = objectHash["groupSearchType"]

    # param str search_bind_dn: [required] A fully qualified DN to log in with to perform an LDAP search for the user (needs read access to the LDAP directory).
    self.search_bind_dn = objectHash["searchBindDN"]

    # param str server_uris: [required] A comma-separated list of LDAP server URIs (examples: "ldap://1.2.3.4" and ldaps://1.2.3.4:123")
    self.server_uris = objectHash["serverURIs"]

    # param str user_dntemplate: [required] A string that is used to form a fully qualified user DN.
    self.user_dntemplate = objectHash["userDNTemplate"]

    # param str user_search_base_dn: [required] The base DN of the tree used to start the search (will do a subtree search from here).
    self.user_search_base_dn = objectHash["userSearchBaseDN"]

    # param str user_search_filter: [required] The LDAP filter used.
    self.user_search_filter = objectHash["userSearchFilter"]
  end
end

class TestLdapAuthentication
  attr_accessor :username, :password, :ldap_configuration

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestLdapAuthentication
    # The TestLdapAuthentication method enables you to validate the currently enabled LDAP authentication settings. If the configuration is
    # correct, the API call returns the group membership of the tested user.
    # param str username: [required] The username to be tested.
    self.username = objectHash["username"]

    # param str password: [required] The password for the username to be tested.
    self.password = objectHash["password"]

    # param LdapConfiguration ldap_configuration:  An ldapConfiguration object to be tested. If specified, the API call tests the provided configuration even if LDAP authentication is disabled.
    self.ldap_configuration = objectHash["ldapConfiguration"] ? LdapConfiguration.new(objectHash["ldapConfiguration"]) : nil
  end
end

class DriveConfigInfo
  attr_accessor :canonical_name, :connected, :dev, :dev_path, :drive_type, :product, :name, :path, :path_link, :scsi_compat_id, :smart_ssd_write_capable, :security_enabled, :security_frozen, :security_locked, :security_supported, :size, :slot, :uuid, :vendor, :version, :security_at_maximum, :serial, :scsi_state

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DriveConfigInfo
    # param str canonical_name: [required]
    self.canonical_name = objectHash["canonicalName"]

    # param bool connected: [required]
    self.connected = objectHash["connected"]

    # param Fixnum dev: [required]
    self.dev = objectHash["dev"]

    # param str dev_path: [required]
    self.dev_path = objectHash["devPath"]

    # param str drive_type: [required]
    self.drive_type = objectHash["driveType"]

    # param str product: [required]
    self.product = objectHash["product"]

    # param str name: [required]
    self.name = objectHash["name"]

    # param str path: [required]
    self.path = objectHash["path"]

    # param str path_link: [required]
    self.path_link = objectHash["pathLink"]

    # param str scsi_compat_id: [required]
    self.scsi_compat_id = objectHash["scsiCompatId"]

    # param bool smart_ssd_write_capable:
    self.smart_ssd_write_capable = objectHash["smartSsdWriteCapable"]

    # param bool security_enabled: [required]
    self.security_enabled = objectHash["securityEnabled"]

    # param bool security_frozen: [required]
    self.security_frozen = objectHash["securityFrozen"]

    # param bool security_locked: [required]
    self.security_locked = objectHash["securityLocked"]

    # param bool security_supported: [required]
    self.security_supported = objectHash["securitySupported"]

    # param Fixnum size: [required]
    self.size = objectHash["size"]

    # param Fixnum slot: [required]
    self.slot = objectHash["slot"]

    # param UUID uuid: [required]
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

    # param str vendor: [required]
    self.vendor = objectHash["vendor"]

    # param str version: [required]
    self.version = objectHash["version"]

    # param bool security_at_maximum: [required]
    self.security_at_maximum = objectHash["securityAtMaximum"]

    # param str serial: [required]
    self.serial = objectHash["serial"]

    # param str scsi_state: [required]
    self.scsi_state = objectHash["scsiState"]
  end
end

class DrivesConfigInfo
  attr_accessor :drives, :num_block_actual, :num_block_expected, :num_slice_actual, :num_slice_expected, :num_total_actual, :num_total_expected

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DrivesConfigInfo
    # param DriveConfigInfo drives: [required]
    self.drives = Array.new(objectHash["drives"].length) {|i| DriveConfigInfo.new(objectHash["drives"][i])}

    # param Fixnum num_block_actual: [required]
    self.num_block_actual = objectHash["numBlockActual"]

    # param Fixnum num_block_expected: [required]
    self.num_block_expected = objectHash["numBlockExpected"]

    # param Fixnum num_slice_actual: [required]
    self.num_slice_actual = objectHash["numSliceActual"]

    # param Fixnum num_slice_expected: [required]
    self.num_slice_expected = objectHash["numSliceExpected"]

    # param Fixnum num_total_actual: [required]
    self.num_total_actual = objectHash["numTotalActual"]

    # param Fixnum num_total_expected: [required]
    self.num_total_expected = objectHash["numTotalExpected"]
  end
end

class GetDriveConfigResult
  attr_accessor :drive_config

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetDriveConfigResult
    # param DrivesConfigInfo drive_config: [required] Configuration information for the drives that are connected to the cluster
    self.drive_config = objectHash["driveConfig"] ? DrivesConfigInfo.new(objectHash["driveConfig"]) : nil
  end
end

class GetNodeStats
  attr_accessor :node_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNodeStats
    # GetNodeStats enables you to retrieve the high-level activity measurements for a single node.
    # param Fixnum node_id: [required] Specifies the node for which statistics are gathered.
    self.node_id = objectHash["nodeID"]
  end
end

class ResetDrives
  attr_accessor :drives, :force

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetDrives
    # ResetDrives enables you to proactively initialize drives and remove all data currently residing on a drive. The drive can then be reused
    # in an existing node or used in an upgraded node. This method requires the force parameter to be included in the method call.
    # param str drives: [required] List of device names (not driveIDs) to reset.
    self.drives = objectHash["drives"]

    # param bool force: [required] Required parameter to successfully reset a drive.
    self.force = objectHash["force"]
  end
end

class EventInfo
  attr_accessor :event_id, :severity, :event_info_type, :message, :service_id, :node_id, :drive_id, :drive_ids, :time_of_report, :time_of_publish, :details

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EventInfo
    # param Fixnum event_id: [required]
    self.event_id = objectHash["eventID"]

    # param Fixnum severity: [required]
    self.severity = objectHash["severity"]

    # param str event_info_type: [required]
    self.event_info_type = objectHash["eventInfoType"]

    # param str message: [required]
    self.message = objectHash["message"]

    # param Fixnum service_id: [required]
    self.service_id = objectHash["serviceID"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param Fixnum drive_id: [required]
    self.drive_id = objectHash["driveID"]

    # param Fixnum drive_ids: [required]
    self.drive_ids = objectHash["driveIDs"]

    # param str time_of_report: [required]
    self.time_of_report = objectHash["timeOfReport"]

    # param str time_of_publish: [required]
    self.time_of_publish = objectHash["timeOfPublish"]

    # param omnitype details:
    self.details = objectHash["details"]
  end
end

class ListEventsResult
  attr_accessor :event_queue_type, :events

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListEventsResult
    # param str event_queue_type: [required]
    self.event_queue_type = objectHash["eventQueueType"]

    # param EventInfo events: [required]
    self.events = Array.new(objectHash["events"].length) {|i| EventInfo.new(objectHash["events"][i])}
  end
end

class ModifyBackupTarget
  attr_accessor :backup_target_id, :name, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyBackupTarget
    # ModifyBackupTarget enables you to change attributes of a backup target.
    # param Fixnum backup_target_id: [required] The unique target ID for the target to modify.
    self.backup_target_id = objectHash["backupTargetID"]

    # param str name:  The new name for the backup target.
    self.name = objectHash["name"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class PairedCluster
  attr_accessor :cluster_name, :cluster_pair_id, :cluster_pair_uuid, :latency, :mvip, :status, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PairedCluster
    # param str cluster_name: [required] Name of the other cluster in the pair
    self.cluster_name = objectHash["clusterName"]

    # param Fixnum cluster_pair_id: [required] Unique ID given to each cluster in the pair.
    self.cluster_pair_id = objectHash["clusterPairID"]

    # param UUID cluster_pair_uuid: [required] Universally unique identifier.
    self.cluster_pair_uuid = objectHash["clusterPairUUID"] ? UUIDTools::UUID.parse(objectHash["clusterPairUUID"]) : nil

    # param Fixnum latency: [required] Number, in milliseconds, of latency between clusters.
    self.latency = objectHash["latency"]

    # param str mvip: [required] IP of the management connection for paired clusters.
    self.mvip = objectHash["mvip"]

    # param str status: [required] Can be one of the following: Connected Misconfigured Disconnected
    self.status = objectHash["status"]

    # param str version: [required] The Element OS version of the other cluster in the pair.
    self.version = objectHash["version"]
  end
end

class ListClusterPairsResult
  attr_accessor :cluster_pairs

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListClusterPairsResult
    # param PairedCluster cluster_pairs: [required] Information about each paired cluster.
    self.cluster_pairs = Array.new(objectHash["clusterPairs"].length) {|i| PairedCluster.new(objectHash["clusterPairs"][i])}
  end
end

class ClusterVersionInfo
  attr_accessor :node_id, :node_version, :node_internal_revision

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterVersionInfo
    # Version information for a node in the cluster.
    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param str node_version: [required]
    self.node_version = objectHash["nodeVersion"]

    # param str node_internal_revision: [required]
    self.node_internal_revision = objectHash["nodeInternalRevision"]
  end
end

class SoftwareVersionInfo
  attr_accessor :current_version, :node_id, :package_name, :pending_version, :start_time

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SoftwareVersionInfo
    # param str current_version: [required]
    self.current_version = objectHash["currentVersion"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param str package_name: [required]
    self.package_name = objectHash["packageName"]

    # param str pending_version: [required]
    self.pending_version = objectHash["pendingVersion"]

    # param str start_time: [required]
    self.start_time = objectHash["startTime"]
  end
end

class GetClusterVersionInfoResult
  attr_accessor :cluster_apiversion, :cluster_version, :cluster_version_info, :software_version_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterVersionInfoResult
    # param str cluster_apiversion: [required]
    self.cluster_apiversion = objectHash["clusterAPIVersion"]

    # param str cluster_version: [required]
    self.cluster_version = objectHash["clusterVersion"]

    # param ClusterVersionInfo cluster_version_info: [required]
    self.cluster_version_info = Array.new(objectHash["clusterVersionInfo"].length) {|i| ClusterVersionInfo.new(objectHash["clusterVersionInfo"][i])}

    # param SoftwareVersionInfo software_version_info: [required]
    self.software_version_info = objectHash["softwareVersionInfo"] ? SoftwareVersionInfo.new(objectHash["softwareVersionInfo"]) : nil
  end
end

class CopyVolume
  attr_accessor :volume_id, :dst_volume_id, :snapshot_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CopyVolume
    # CopyVolume enables you to overwrite the data contents of an existing volume with the data contents of another volume (or
    # snapshot). Attributes of the destination volume such as IQN, QoS settings, size, account, and volume access group membership are
    # not changed. The destination volume must already exist and must be the same size as the source volume.
    # NetApp strongly recommends that clients unmount the destination volume before the CopyVolume operation begins. If the
    # destination volume is modified during the copy operation, the changes will be lost.
    # This method is asynchronous and may take a variable amount of time to complete. You can use the GetAsyncResult method to
    # determine when the process has finished, and ListSyncJobs to see the progress of the copy.
    # param Fixnum volume_id: [required] VolumeID of the volume to be read from.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum dst_volume_id: [required] VolumeID of the volume to be overwritten.
    self.dst_volume_id = objectHash["dstVolumeID"]

    # param Fixnum snapshot_id:  ID of the snapshot that is used as the source of the clone. If no ID is provided, the current active volume is used.
    self.snapshot_id = objectHash["snapshotID"]
  end
end

class NetworkInterface
  attr_accessor :address, :broadcast, :mac_address, :mtu, :name, :netmask, :status, :type, :virtual_network_tag, :namespace

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NetworkInterface
    # param str address: [required] IP address of the network.
    self.address = objectHash["address"]

    # param str broadcast: [required] Address of NTP broadcast.
    self.broadcast = objectHash["broadcast"]

    # param str mac_address: [required] Address used to configure the interface.
    self.mac_address = objectHash["macAddress"]

    # param Fixnum mtu: [required] Packet size on the network interface.
    self.mtu = objectHash["mtu"]

    # param str name: [required] Name of the network interface.
    self.name = objectHash["name"]

    # param str netmask: [required] Netmask for the network interface.
    self.netmask = objectHash["netmask"]

    # param str status: [required] Status of the network.
    self.status = objectHash["status"]

    # param str type: [required] The type of network, ie, BondMaster.
    self.type = objectHash["type"]

    # param Fixnum virtual_network_tag: [required] Virtual Network Tag if on virtual network.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param bool namespace:
    self.namespace = objectHash["namespace"]
  end
end

class ListNetworkInterfacesResult
  attr_accessor :interfaces

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListNetworkInterfacesResult
    # param NetworkInterface interfaces: [required]
    self.interfaces = Array.new(objectHash["interfaces"].length) {|i| NetworkInterface.new(objectHash["interfaces"][i])}
  end
end

class CreateVolumeAccessGroup
  attr_accessor :name, :initiators, :volumes, :virtual_network_id, :virtual_network_tags, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateVolumeAccessGroup
    # You can use CreateVolumeAccessGroup to create a new volume access group. When you create the volume access group, you need to give it a name, and you can optionally enter initiators and volumes. After you create the group, you can add volumes and initiator IQNs. Any initiator IQN that you add to the volume access group is able to access any volume in the group without CHAP authentication.
    # param str name: [required] The name for this volume access group. Not required to be unique, but recommended.
    self.name = objectHash["name"]

    # param str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators are not modified.
    self.initiators = objectHash["initiators"]

    # param Fixnum volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes are not modified.
    self.volumes = objectHash["volumes"]

    # param Fixnum virtual_network_id:  The ID of the SolidFire virtual network to associate the volume access group with.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tags:  The ID of the SolidFire virtual network to associate the volume access group with.
    self.virtual_network_tags = objectHash["virtualNetworkTags"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class CreateSnapshot
  attr_accessor :volume_id, :snapshot_id, :name, :enable_remote_replication, :retention, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateSnapshot
    # CreateSnapshot enables you to create a point-in-time copy of a volume. You can create a snapshot from any volume or from an existing snapshot. If you do not provide a SnapshotID with this API method, a snapshot is created from the volume's active branch.
    # If the volume from which the snapshot is created is being replicated to a remote cluster, the snapshot can also be replicated to the same target. Use the enableRemoteReplication parameter to enable snapshot replication.
    # Note: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param Fixnum volume_id: [required] Specifies the unique ID of the volume image from which to copy.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum snapshot_id:  Specifies the unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume.
    self.snapshot_id = objectHash["snapshotID"]

    # param str name:  Specifies a name for the snapshot. If unspecified, the date and time the snapshot was taken is used.
    self.name = objectHash["name"]

    # param bool enable_remote_replication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]

    # param str retention:  Specifies the amount of time for which the snapshot is retained. The format is HH:mm:ss.
    self.retention = objectHash["retention"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class DeleteVolumes
  attr_accessor :account_ids, :volume_access_group_ids, :volume_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolumes
    # DeleteVolumes marks multiple (up to 500) active volumes for deletion. Once marked, the volumes are purged (permanently deleted) after the cleanup interval elapses.The cleanup interval can be set in the SetClusterSettings method. For more information on using this method, see SetClusterSettings on page 1. After making a request to delete volumes, any active iSCSI connections to the volumes are immediately terminated and no further connections are allowed while the volumes are in this state. A marked volume is not returned in target discovery requests. Any snapshots of a volume that has been marked for deletion are not affected. Snapshots are kept until the volume is purged from the system. If a volume is marked for deletion and has a bulk volume read or bulk volume write operation in progress, the bulk volume read or write operation is stopped. If the volumes you delete are paired with a volume, replication between the paired volumes is suspended and no data is transferred to them or from them while in a deleted state. The remote volumes the deleted volumes were paired with enter into a PausedMisconfigured state and data is no integerer sent to them or from the deleted volumes. Until the deleted volumes are purged, they can be restored and data transfers resume. If the deleted volumes are purged from the system, the volumes they were paired with enter into a StoppedMisconfigured state and the volume pairing status is removed. The purged volumes become permanently unavailable.
    # param Fixnum account_ids:  A list of account IDs. All volumes from these accounts are deleted from the system.
    self.account_ids = objectHash["accountIDs"]

    # param Fixnum volume_access_group_ids:  A list of volume access group IDs. All of the volumes from all of the volume access groups you specify in this list are deleted from the system.
    self.volume_access_group_ids = objectHash["volumeAccessGroupIDs"]

    # param Fixnum volume_ids:  The list of IDs of the volumes to delete from the system.
    self.volume_ids = objectHash["volumeIDs"]
  end
end

class CopyVolumeResult
  attr_accessor :clone_id, :async_handle

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CopyVolumeResult
    # param Fixnum clone_id: [required]
    self.clone_id = objectHash["cloneID"]

    # param Fixnum async_handle: [required] Handle value used to track the progress of the volume copy.
    self.async_handle = objectHash["asyncHandle"]
  end
end

class RestartServices
  attr_accessor :force, :service, :action

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RestartServices
    # The RestartServices API method enables you to restart the services on a node.
    # Caution: This method causes temporary node services interruption. Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param bool force: [required] Required parameter to successfully restart services on a node.
    self.force = objectHash["force"]

    # param str service:  Service name to be restarted.
    self.service = objectHash["service"]

    # param str action:  Action to perform on the service (start, stop, restart).
    self.action = objectHash["action"]
  end
end

class GetNvramInfoResult
  attr_accessor :nvram_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNvramInfoResult
    # param dict nvram_info: [required] Arrays of events and errors detected on the NVRAM card.
    self.nvram_info = objectHash["nvramInfo"]
  end
end

class GetClusterMasterNodeIDResult
  attr_accessor :node_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterMasterNodeIDResult
    # param Fixnum node_id: [required] ID of the master node.
    self.node_id = objectHash["nodeID"]
  end
end

class ListDriveHardware
  attr_accessor :force

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDriveHardware
    # ListDriveHardware returns all the drives connected to a node. Use this method on individual nodes to return drive hardware
    # information or use this method on the cluster master node MVIP to see information for all the drives on all nodes.
    # Note: The "securitySupported": true line of the method response does not imply that the drives are capable of
    # encryption; only that the security status can be queried. If you have a node type with a model number ending in "-NE",
    # commands to enable security features on these drives will fail. See the EnableEncryptionAtRest method for more information.
    # param bool force: [required] To run this command, the force parameter must be set to true.
    self.force = objectHash["force"]
  end
end

class DeleteVolumeResult
  attr_accessor :volume

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolumeResult
    # param Volume volume:
    self.volume = objectHash["volume"] ? Volume.new(objectHash["volume"]) : nil
  end
end

class NodeWaitingToJoin
  attr_accessor :version, :name, :node_id, :pending_node_id, :mip, :cip, :sip, :compatible, :chassis_type, :hostname, :node_type

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeWaitingToJoin
    # param str name:
    self.name = objectHash["name"]

    # param str version: [required]
    self.version = objectHash["version"]

    # param Fixnum node_id:
    self.node_id = objectHash["nodeID"]

    # param Fixnum pending_node_id:
    self.pending_node_id = objectHash["pendingNodeID"]

    # param str mip:
    self.mip = objectHash["mip"]

    # param str cip:
    self.cip = objectHash["cip"]

    # param str sip:
    self.sip = objectHash["sip"]

    # param bool compatible: [required]
    self.compatible = objectHash["compatible"]

    # param str chassis_type:
    self.chassis_type = objectHash["chassisType"]

    # param str hostname:
    self.hostname = objectHash["hostname"]

    # param str node_type:
    self.node_type = objectHash["nodeType"]
  end
end

class GetBootstrapConfigResult
  attr_accessor :cluster_name, :node_name, :nodes, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetBootstrapConfigResult
    # param str cluster_name: [required] Name of the cluster.
    self.cluster_name = objectHash["clusterName"]

    # param str node_name: [required] Name of the node.
    self.node_name = objectHash["nodeName"]

    # param NodeWaitingToJoin nodes: [required] List of descriptions for each node that is actively waiting to join this cluster: compatible - Indicates if the listed node is compatible with the node the API call was executed against. name - IP address of each node. version - version of SolidFire Element software currently installed on the node.
    self.nodes = Array.new(objectHash["nodes"].length) {|i| NodeWaitingToJoin.new(objectHash["nodes"][i])}

    # param str version: [required] Version of the SolidFire Element software currently installed.
    self.version = objectHash["version"]
  end
end

class ListTestsResult
  attr_accessor :tests

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListTestsResult
    # param omnitype tests: [required] List of tests that can be performed on the node.
    self.tests = objectHash["tests"]
  end
end

class LoggingServer
  attr_accessor :host, :port

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # LoggingServer
    # param str host: [required] Hostname or IP address of the log server.
    self.host = objectHash["host"]

    # param Fixnum port: [required] Port number that the log server is listening on.
    self.port = objectHash["port"]
  end
end

class SetRemoteLoggingHosts
  attr_accessor :remote_hosts

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetRemoteLoggingHosts
    # SetRemoteLoggingHosts enables you to configure remote logging from the nodes in the storage cluster to a centralized log server or servers. Remote logging is performed over TCP using the default port 514. This API does not add to the existing logging hosts. Rather, it replaces what currently exists with new values specified by this API method. You can use GetRemoteLoggingHosts to determine what the current logging hosts are, and then use SetRemoteLoggingHosts to set the desired list of current and new logging hosts.
    # param LoggingServer remote_hosts: [required] A list of hosts to send log messages to.
    self.remote_hosts = Array.new(objectHash["remoteHosts"].length) {|i| LoggingServer.new(objectHash["remoteHosts"][i])}
  end
end

class GetIpmiConfigNodesResult
  attr_accessor :node_id, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiConfigNodesResult
    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param dict result: [required]
    self.result = objectHash["result"]
  end
end

class GetIpmiConfigResult
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiConfigResult
    # param GetIpmiConfigNodesResult nodes: [required]
    self.nodes = Array.new(objectHash["nodes"].length) {|i| GetIpmiConfigNodesResult.new(objectHash["nodes"][i])}
  end
end

class GetSchedule
  attr_accessor :schedule_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSchedule
    # You can use the GetSchedule method to retrieve information about a scheduled snapshot. You can see information about a specific
    # schedule if there are many snapshot schedules in the system. You also retrieve information about more than one schedule with this
    # method by specifying additional scheduleIDs in the parameter.
    # param Fixnum schedule_id: [required] Specifies the unique ID of the schedule or multiple schedules to display.
    self.schedule_id = objectHash["scheduleID"]
  end
end

class AddLdapClusterAdminResult
  attr_accessor :cluster_admin_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddLdapClusterAdminResult
    # param Fixnum cluster_admin_id:
    self.cluster_admin_id = objectHash["clusterAdminID"]
  end
end

class AddedNode
  attr_accessor :pending_node_id, :node_id, :active_node_key, :assigned_node_id, :async_handle, :cip, :mip, :platform_info, :sip, :software_version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddedNode
    # param Fixnum node_id:
    self.node_id = objectHash["nodeID"]

    # param Fixnum pending_node_id: [required]
    self.pending_node_id = objectHash["pendingNodeID"]

    # param str active_node_key:
    self.active_node_key = objectHash["activeNodeKey"]

    # param Fixnum assigned_node_id:
    self.assigned_node_id = objectHash["assignedNodeID"]

    # param Fixnum async_handle:
    self.async_handle = objectHash["asyncHandle"]

    # param str cip:
    self.cip = objectHash["cip"]

    # param str mip:
    self.mip = objectHash["mip"]

    # param Platform platform_info:
    self.platform_info = objectHash["platformInfo"] ? Platform.new(objectHash["platformInfo"]) : nil

    # param str sip:
    self.sip = objectHash["sip"]

    # param str software_version:
    self.software_version = objectHash["softwareVersion"]
  end
end

class AddNodesResult
  attr_accessor :nodes, :auto_install

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddNodesResult
    # param bool auto_install:
    self.auto_install = objectHash["autoInstall"]

    # param AddedNode nodes: [required] An array of objects mapping the previous "pendingNodeID" to the "nodeID".
    self.nodes = Array.new(objectHash["nodes"].length) {|i| AddedNode.new(objectHash["nodes"][i])}
  end
end

class SnmpTrapRecipient
  attr_accessor :host, :community, :port

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnmpTrapRecipient
    # Host that is to receive the traps generated by the cluster.
    # param str host: [required] The IP address or host name of the target network management station.
    self.host = objectHash["host"]

    # param str community: [required] SNMP community string.
    self.community = objectHash["community"]

    # param Fixnum port: [required] The UDP port number on the host where the trap is to be sent. Valid range is 1 - 65535. 0 (zero) is not a valid port number. Default is 162.
    self.port = objectHash["port"]
  end
end

class AddClusterAdminResult
  attr_accessor :cluster_admin_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddClusterAdminResult
    # param Fixnum cluster_admin_id: [required] ClusterAdminID for the newly created Cluster Admin.
    self.cluster_admin_id = objectHash["clusterAdminID"]
  end
end

class CompleteClusterPairing
  attr_accessor :cluster_pairing_key

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CompleteClusterPairing
    # You can use the CompleteClusterPairing method with the encoded key received from the  StartClusterPairing method to complete the cluster pairing process. The CompleteClusterPairing method is the second step in the cluster pairing process.
    # param str cluster_pairing_key: [required] A string of characters that is returned from the "StartClusterPairing" API method.
    self.cluster_pairing_key = objectHash["clusterPairingKey"]
  end
end

class DriveHardwareInfo
  attr_accessor :description, :dev, :devpath, :drive_security_at_maximum, :drive_security_frozen, :drive_security_locked, :logicalname, :product, :scsi_compat_id, :security_feature_enabled, :security_feature_supported, :serial, :size, :uuid, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DriveHardwareInfo
    # param str description: [required]
    self.description = objectHash["description"]

    # param str dev: [required]
    self.dev = objectHash["dev"]

    # param str devpath: [required]
    self.devpath = objectHash["devpath"]

    # param bool drive_security_at_maximum: [required]
    self.drive_security_at_maximum = objectHash["driveSecurityAtMaximum"]

    # param bool drive_security_frozen: [required]
    self.drive_security_frozen = objectHash["driveSecurityFrozen"]

    # param bool drive_security_locked: [required]
    self.drive_security_locked = objectHash["driveSecurityLocked"]

    # param str logicalname: [required]
    self.logicalname = objectHash["logicalname"]

    # param str product: [required]
    self.product = objectHash["product"]

    # param str scsi_compat_id: [required]
    self.scsi_compat_id = objectHash["scsiCompatID"]

    # param bool security_feature_enabled: [required]
    self.security_feature_enabled = objectHash["securityFeatureEnabled"]

    # param bool security_feature_supported: [required]
    self.security_feature_supported = objectHash["securityFeatureSupported"]

    # param str serial: [required]
    self.serial = objectHash["serial"]

    # param Fixnum size: [required]
    self.size = objectHash["size"]

    # param UUID uuid: [required]
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

    # param str version: [required]
    self.version = objectHash["version"]
  end
end

class GetDriveHardwareInfoResult
  attr_accessor :drive_hardware_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetDriveHardwareInfoResult
    # param DriveHardwareInfo drive_hardware_info: [required]
    self.drive_hardware_info = objectHash["driveHardwareInfo"] ? DriveHardwareInfo.new(objectHash["driveHardwareInfo"]) : nil
  end
end

class DeleteInitiators
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteInitiators
    # DeleteInitiators enables you to delete one or more initiators from the system (and from any associated volumes or volume access
    # groups).
    # If DeleteInitiators fails to delete one of the initiators provided in the parameter, the system returns an error and does not delete any
    # initiators (no partial completion is possible).
    # param Fixnum initiators: [required] An array of IDs of initiators to delete.
    self.initiators = objectHash["initiators"]
  end
end

class SetSnmpTrapInfo
  attr_accessor :trap_recipients, :cluster_fault_traps_enabled, :cluster_fault_resolved_traps_enabled, :cluster_event_traps_enabled

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpTrapInfo
    # You can use SetSnmpTrapInfo to enable and disable the generation of cluster SNMP notifications (traps) and to specify the set of network host computers that receive the notifications. The values you pass with each SetSnmpTrapInfo method call replace all values set in any previous call to SetSnmpTrapInfo.
    # param SnmpTrapRecipient trap_recipients: [required] List of hosts that are to receive the traps generated by the Cluster Master. At least one object is required if any one of the trap types is enabled.
    self.trap_recipients = Array.new(objectHash["trapRecipients"].length) {|i| SnmpTrapRecipient.new(objectHash["trapRecipients"][i])}

    # param bool cluster_fault_traps_enabled: [required] If the value is set to true, a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients when a cluster fault is logged. The default value is false.
    self.cluster_fault_traps_enabled = objectHash["clusterFaultTrapsEnabled"]

    # param bool cluster_fault_resolved_traps_enabled: [required] If the value is set to true, a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients when a cluster fault is resolved. The default value is false.
    self.cluster_fault_resolved_traps_enabled = objectHash["clusterFaultResolvedTrapsEnabled"]

    # param bool cluster_event_traps_enabled: [required] If the value is set to true, a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients when a cluster event is logged. The default value is false.
    self.cluster_event_traps_enabled = objectHash["clusterEventTrapsEnabled"]
  end
end

class RemoveVirtualNetwork
  attr_accessor :virtual_network_id, :virtual_network_tag

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveVirtualNetwork
    # RemoveVirtualNetwork enables you to remove a previously added virtual network.
    # Note: This method requires either the virtualNetworkID or the virtualNetworkTag as a parameter, but not both.
    # param Fixnum virtual_network_id:  Network ID that identifies the virtual network to remove.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tag:  Network tag that identifies the virtual network to remove.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]
  end
end

class ListVolumeStatsResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsResult
    # param VolumeStats volume_stats: [required] List of volume activity information.
    self.volume_stats = Array.new(objectHash["volumeStats"].length) {|i| VolumeStats.new(objectHash["volumeStats"][i])}
  end
end

class SetClusterConfigResult
  attr_accessor :cluster

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetClusterConfigResult
    # param ClusterConfig cluster: [required] Settings for the cluster. All new and current settings are returned.
    self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
  end
end

class CancelGroupClone
  attr_accessor :group_clone_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CancelGroupClone
    # CancelGroupClone enables you to stop an ongoing CloneMultipleVolumes process occurring on a group of volumes. When you cancel
    # a group clone operation, the system completes and removes the operation's associated asyncHandle.
    # param Fixnum group_clone_id: [required] The cloneID for the ongoing clone process.
    self.group_clone_id = objectHash["groupCloneID"]
  end
end

class ListActiveVolumes
  attr_accessor :start_volume_id, :limit, :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListActiveVolumes
    # ListActiveVolumes enables you to return the list of active volumes currently in the system. The list of volumes is returned sorted in
    # VolumeID order and can be returned in multiple parts (pages).
    # param Fixnum start_volume_id:  Starting VolumeID to return. If no volume exists with this VolumeID, the next volume by VolumeID order is used as the start of the list. To page through the list, pass the VolumeID of the last volume in the previous response + 1.
    self.start_volume_id = objectHash["startVolumeID"]

    # param Fixnum limit:  Maximum number of Volume Info objects to return. A value of 0 (zero) returns all volumes (unlimited).
    self.limit = objectHash["limit"]

    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class CreateSchedule
  attr_accessor :schedule

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateSchedule
    # CreateSchedule enables you to schedule an automatic snapshot of a volume at a defined interval.
    # You can use the created snapshot later as a backup or rollback to ensure the data on a volume or group of volumes is consistent for
    # the point in time in which the snapshot was created.
    # If you schedule a snapshot to run at a time period that is not divisible by 5 minutes, the snapshot runs at the next time period
    # that is divisible by 5 minutes. For example, if you schedule a snapshot to run at 12:42:00 UTC, it runs at 12:45:00 UTC.
    # Note: You can create snapshots if cluster fullness is at stage 1, 2 or 3. You cannot create snapshots after cluster fullness reaches stage 4 or 5.
    # param Schedule schedule: [required] The "Schedule" object will be used to create a new schedule. Do not set ScheduleID property, it will be ignored. Frequency property must be of type that inherits from Frequency. Valid types are: DaysOfMonthFrequency DaysOrWeekFrequency TimeIntervalFrequency
    self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
  end
end

class DeleteAllSupportBundlesResult
  attr_accessor :duration, :details, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteAllSupportBundlesResult
    # param str duration: [required]
    self.duration = objectHash["duration"]

    # param dict details: [required]
    self.details = objectHash["details"]

    # param str result: [required]
    self.result = objectHash["result"]
  end
end

class GetDriveHardwareInfo
  attr_accessor :drive_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetDriveHardwareInfo
    # GetDriveHardwareInfo returns all the hardware information for the given drive. This generally includes details about manufacturers, vendors, versions, and
    # other associated hardware identification information.
    # param Fixnum drive_id: [required] DriveID for the drive information requested. You can get DriveIDs by using the ListDrives method.
    self.drive_id = objectHash["driveID"]
  end
end

class StorageContainer
  attr_accessor :name, :storage_container_id, :account_id, :protocol_endpoint_type, :initiator_secret, :target_secret, :status, :virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StorageContainer
    # param str name: [required]
    self.name = objectHash["name"]

    # param UUID storage_container_id: [required]
    self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

    # param Fixnum account_id: [required]
    self.account_id = objectHash["accountID"]

    # param str protocol_endpoint_type: [required]
    self.protocol_endpoint_type = objectHash["protocolEndpointType"]

    # param str initiator_secret: [required]
    self.initiator_secret = objectHash["initiatorSecret"]

    # param str target_secret: [required]
    self.target_secret = objectHash["targetSecret"]

    # param str status: [required]
    self.status = objectHash["status"]

    # param UUID virtual_volumes:
    self.virtual_volumes = Array.new(objectHash["virtualVolumes"].length) {|i| UUIDTools::UUID.parse(objectHash["virtualVolumes"][i])}
  end
end

class ModifyStorageContainerResult
  attr_accessor :storage_container

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyStorageContainerResult
    # param StorageContainer storage_container: [required]
    self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil
  end
end

class InvokeSFApi
  attr_accessor :method, :parameters

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # InvokeSFApi
    # This will invoke any API method supported by the SolidFire API for the version and port the connection is using.
    # Returns a nested hashtable of key/value pairs that contain the result of the invoked method.
    # param str method: [required] The name of the method to invoke. This is case sensitive.
    self.method = objectHash["method"]

    # param omnitype parameters:  An object, normally a dictionary or hashtable of the key/value pairs, to be passed as the params for the method being invoked.
    self.parameters = objectHash["parameters"]
  end
end

class RemoveNodesResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveNodesResult
  end
end

class RemoveAccountResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveAccountResult
  end
end

class GetVolumeCountResult
  attr_accessor :count

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeCountResult
    # param Fixnum count: [required] The number of volumes currently in the system.
    self.count = objectHash["count"]
  end
end

class GetStorageContainerEfficiency
  attr_accessor :storage_container_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetStorageContainerEfficiency
    # GetStorageContainerEfficiency enables you to retrieve efficiency information about a virtual volume storage container.
    # param UUID storage_container_id: [required] The ID of the storage container for which to retrieve efficiency information.
    self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil
  end
end

class Initiator
  attr_accessor :alias, :initiator_id, :initiator_name, :volume_access_groups, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Initiator
    # Object containing characteristics of each initiator
    # param str alias: [required] The friendly name assigned to this initiator. (String)
    self.alias = objectHash["alias"]

    # param Fixnum initiator_id: [required] The numeric ID of the initiator that has been created. (Integer)
    self.initiator_id = objectHash["initiatorID"]

    # param str initiator_name: [required] The name of the initiator that has been created. (String)
    self.initiator_name = objectHash["initiatorName"]

    # param Fixnum volume_access_groups: [required] A list of volumeAccessGroupIDs to which this initiator beintegers. (Array of Integers)
    self.volume_access_groups = objectHash["volumeAccessGroups"]

    # param dict attributes: [required] A set of JSON attributes assigned to this initiator. (JSON Object)
    self.attributes = objectHash["attributes"]
  end
end

class ISCSISession
  attr_accessor :account_id, :drive_ids, :initiator, :account_name, :drive_id, :initiator_ip, :initiator_port_name, :target_port_name, :initiator_name, :node_id, :service_id, :session_id, :target_name, :target_ip, :virtual_network_id, :volume_id, :create_time, :volume_instance, :initiator_session_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ISCSISession
    # param Fixnum drive_ids:
    self.drive_ids = objectHash["driveIDs"]

    # param Fixnum account_id: [required]
    self.account_id = objectHash["accountID"]

    # param Initiator initiator:
    self.initiator = objectHash["initiator"] ? Initiator.new(objectHash["initiator"]) : nil

    # param str account_name: [required]
    self.account_name = objectHash["accountName"]

    # param Fixnum drive_id: [required]
    self.drive_id = objectHash["driveID"]

    # param str initiator_ip: [required]
    self.initiator_ip = objectHash["initiatorIP"]

    # param str initiator_port_name: [required]
    self.initiator_port_name = objectHash["initiatorPortName"]

    # param str target_port_name: [required]
    self.target_port_name = objectHash["targetPortName"]

    # param str initiator_name: [required]
    self.initiator_name = objectHash["initiatorName"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param Fixnum service_id: [required]
    self.service_id = objectHash["serviceID"]

    # param Fixnum session_id: [required]
    self.session_id = objectHash["sessionID"]

    # param str target_name: [required]
    self.target_name = objectHash["targetName"]

    # param str target_ip: [required]
    self.target_ip = objectHash["targetIP"]

    # param Fixnum virtual_network_id: [required]
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum volume_id: [required]
    self.volume_id = objectHash["volumeID"]

    # param str create_time: [required]
    self.create_time = objectHash["createTime"]

    # param Fixnum volume_instance: [required]
    self.volume_instance = objectHash["volumeInstance"]

    # param Fixnum initiator_session_id: [required]
    self.initiator_session_id = objectHash["initiatorSessionID"]
  end
end

class ListISCSISessionsResult
  attr_accessor :sessions

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListISCSISessionsResult
    # param ISCSISession sessions: [required]
    self.sessions = Array.new(objectHash["sessions"].length) {|i| ISCSISession.new(objectHash["sessions"][i])}
  end
end

class ListVirtualVolumes
  attr_accessor :details, :limit, :recursive, :start_virtual_volume_id, :virtual_volume_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumes
    # ListVirtualVolumes enables you to list the virtual volumes currently in the system. You can use this method to list all virtual volumes,
    # or only list a subset.
    # param bool details:  Specifies the level of detail about each virtual volume that is returned. Possible values are: true: Include more details about each virtual volume in the response. false: Include the standard level of detail about each virtual volume in the response.
    self.details = objectHash["details"]

    # param Fixnum limit:  The maximum number of virtual volumes to list.
    self.limit = objectHash["limit"]

    # param bool recursive:  Specifies whether to include information about the children of each virtual volume in the response. Possible values are: true: Include information about the children of each virtual volume in the response. false: Do not include information about the children of each virtual volume in the response.
    self.recursive = objectHash["recursive"]

    # param UUID start_virtual_volume_id:  The ID of the virtual volume at which to begin the list.
    self.start_virtual_volume_id = objectHash["startVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["startVirtualVolumeID"]) : nil

    # param UUID virtual_volume_ids:  A list of virtual volume IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes.
    self.virtual_volume_ids = Array.new(objectHash["virtualVolumeIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["virtualVolumeIDs"][i])}
  end
end

class CompleteVolumePairingResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CompleteVolumePairingResult
  end
end

class ListDeletedVolumes
  attr_accessor :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDeletedVolumes
    # ListDeletedVolumes enables you to retrieve the list of volumes that have been marked for deletion and purged from the system.
    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class ListStorageContainersResult
  attr_accessor :storage_containers

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListStorageContainersResult
    # param StorageContainer storage_containers: [required]
    self.storage_containers = Array.new(objectHash["storageContainers"].length) {|i| StorageContainer.new(objectHash["storageContainers"][i])}
  end
end

class GetLdapConfigurationResult
  attr_accessor :ldap_configuration

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetLdapConfigurationResult
    # param LdapConfiguration ldap_configuration: [required] List of the current LDAP configuration settings. This API call will not return the plain text of the search account password.  Note: If LDAP authentication is currently disabled, all the returned settings will be empty with the exception of "authType", and "groupSearchType" which are set to "SearchAndBind" and "ActiveDirectory" respectively.
    self.ldap_configuration = objectHash["ldapConfiguration"] ? LdapConfiguration.new(objectHash["ldapConfiguration"]) : nil
  end
end

class GroupSnapshotMembers
  attr_accessor :volume_id, :snapshot_id, :snapshot_uuid, :checksum, :attributes, :create_time, :enable_remote_replication, :expiration_reason, :expiration_time, :group_id, :group_snapshot_uuid, :name, :remote_status, :remote_statuses, :status, :total_size, :virtual_volume_id, :volume_pair_uuid

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GroupSnapshotMembers
    # List of checksum, volumeIDs and snapshotIDs for each member of the group.
    # param Fixnum volume_id: [required] The source volume ID for the snapshot.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum snapshot_id: [required] Unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume.
    self.snapshot_id = objectHash["snapshotID"]

    # param str snapshot_uuid: [required] Universal Unique ID of an existing snapshot.
    self.snapshot_uuid = objectHash["snapshotUUID"]

    # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data.
    self.checksum = objectHash["checksum"]

    # param dict attributes:
    self.attributes = objectHash["attributes"]

    # param str create_time:
    self.create_time = objectHash["createTime"]

    # param bool enable_remote_replication:
    self.enable_remote_replication = objectHash["enableRemoteReplication"]

    # param str expiration_reason:
    self.expiration_reason = objectHash["expirationReason"]

    # param str expiration_time:
    self.expiration_time = objectHash["expirationTime"]

    # param Fixnum group_id:
    self.group_id = objectHash["groupID"]

    # param UUID group_snapshot_uuid:
    self.group_snapshot_uuid = objectHash["groupSnapshotUUID"] ? UUIDTools::UUID.parse(objectHash["groupSnapshotUUID"]) : nil

    # param str name:
    self.name = objectHash["name"]

    # param str remote_status:
    self.remote_status = objectHash["remoteStatus"]

    # param dict remote_statuses:
    self.remote_statuses = objectHash["remoteStatuses"]

    # param str status:
    self.status = objectHash["status"]

    # param Fixnum total_size:
    self.total_size = objectHash["totalSize"]

    # param Fixnum virtual_volume_id:
    self.virtual_volume_id = objectHash["virtualVolumeID"]

    # param UUID volume_pair_uuid:
    self.volume_pair_uuid = objectHash["volumePairUUID"] ? UUIDTools::UUID.parse(objectHash["volumePairUUID"]) : nil
  end
end

class GroupSnapshot
  attr_accessor :group_snapshot_id, :group_snapshot_uuid, :members, :name, :create_time, :status, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GroupSnapshot
    # Group Snapshot object represents a point-in-time copy of a group of volumes.
    # param Fixnum group_snapshot_id: [required] Unique ID of the new group snapshot.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param UUID group_snapshot_uuid: [required] UUID of the group snapshot.
    self.group_snapshot_uuid = objectHash["groupSnapshotUUID"] ? UUIDTools::UUID.parse(objectHash["groupSnapshotUUID"]) : nil

    # param GroupSnapshotMembers members: [required] List of volumeIDs and snapshotIDs for each member of the group.
    self.members = Array.new(objectHash["members"].length) {|i| GroupSnapshotMembers.new(objectHash["members"][i])}

    # param str name: [required] Name of the group snapshot, or, if none was given, the UTC formatted day and time on which the snapshot was created.
    self.name = objectHash["name"]

    # param str create_time: [required] The UTC formatted day and time on which the snapshot was created.
    self.create_time = objectHash["createTime"]

    # param str status: [required] Status of the snapshot. Possible values: Preparing: A snapshot that is being prepared for use and is not yet writable. Done: A snapshot that has finished being prepared and is now usable
    self.status = objectHash["status"]

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ModifyGroupSnapshotResult
  attr_accessor :group_snapshot

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyGroupSnapshotResult
    # param GroupSnapshot group_snapshot: [required]
    self.group_snapshot = objectHash["groupSnapshot"] ? GroupSnapshot.new(objectHash["groupSnapshot"]) : nil
  end
end

class ListDriveStats
  attr_accessor :drives

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDriveStats
    # ListDriveStats enables you to retrieve high-level activity measurements for multiple drives in the cluster. By default, this method returns statistics for all drives in the cluster, and these measurements are cumulative from the addition of the drive to the cluster. Some values this method returns are specific to block drives, and some are specific to metadata drives.
    # param Fixnum drives:  Optional list of DriveIDs for which to return drive statistics. If you omit this parameter, measurements for all drives are returned.
    self.drives = objectHash["drives"]
  end
end

class ListInitiators
  attr_accessor :start_initiator_id, :limit, :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListInitiators
    # ListInitiators enables you to list initiator IQNs or World Wide Port Names (WWPNs).
    # param Fixnum start_initiator_id:  The initiator ID at which to begin the listing. You can supply this parameter or the "initiators" parameter, but not both.
    self.start_initiator_id = objectHash["startInitiatorID"]

    # param Fixnum limit:  The maximum number of initiator objects to return.
    self.limit = objectHash["limit"]

    # param Fixnum initiators:  A list of initiator IDs to retrieve. You can provide a value for this parameter or the "startInitiatorID" parameter, but not both.
    self.initiators = objectHash["initiators"]
  end
end

class ListInitiatorsResult
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListInitiatorsResult
    # param Initiator initiators: [required] List of the initiator information.
    self.initiators = Array.new(objectHash["initiators"].length) {|i| Initiator.new(objectHash["initiators"][i])}
  end
end

class AddressBlock
  attr_accessor :start, :size, :available

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddressBlock
    # Unique Range of IP addresses to include in the virtual network.
    # param str start: [required] Start of the IP address range.
    self.start = objectHash["start"]

    # param Fixnum size: [required] Number of IP addresses to include in the block.
    self.size = objectHash["size"]

    # param str available: [required] Nuber of available blocks
    self.available = objectHash["available"]
  end
end

class VirtualNetwork
  attr_accessor :virtual_network_id, :virtual_network_tag, :address_blocks, :name, :netmask, :svip, :gateway, :namespace, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualNetwork
    # param Fixnum virtual_network_id: [required] SolidFire unique identifier for a virtual network.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tag: [required] VLAN Tag identifier.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param AddressBlock address_blocks: [required] Range of address blocks currently assigned to the virtual network. available: Binary string in "1"s and "0"s. 1 equals the IP is available and 0 equals the IP is not available. The string is read from right to left with the digit to the far right being the first IP address in the list of addressBlocks. size: the size of this block of addresses. start: first IP address in the block.
    self.address_blocks = Array.new(objectHash["addressBlocks"].length) {|i| AddressBlock.new(objectHash["addressBlocks"][i])}

    # param str name: [required] The name assigned to the virtual network.
    self.name = objectHash["name"]

    # param str netmask: [required] IP address of the netmask for the virtual network.
    self.netmask = objectHash["netmask"]

    # param str svip: [required] Storage IP address for the virtual network.
    self.svip = objectHash["svip"]

    # param str gateway:
    self.gateway = objectHash["gateway"]

    # param bool namespace:
    self.namespace = objectHash["namespace"]

    # param dict attributes:  List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListVirtualNetworksResult
  attr_accessor :virtual_networks

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualNetworksResult
    # param VirtualNetwork virtual_networks: [required] Object containing virtual network IP addresses.
    self.virtual_networks = Array.new(objectHash["virtualNetworks"].length) {|i| VirtualNetwork.new(objectHash["virtualNetworks"][i])}
  end
end

class StartVolumePairing
  attr_accessor :volume_id, :mode

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartVolumePairing
    # StartVolumePairing enables you to create an encoded key from a volume that is used to pair with another volume. The key that this
    # method creates is used in the CompleteVolumePairing API method to establish a volume pairing.
    # param Fixnum volume_id: [required] The ID of the volume on which to start the pairing process.
    self.volume_id = objectHash["volumeID"]

    # param str mode:  The mode of the volume on which to start the pairing process. The mode can only be set if the volume is the source volume. Possible values are: Async: (default if no mode parameter specified) Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster. Sync: Source acknowledges write when the data is stored locally and on the remote cluster. SnapshotsOnly: Only snapshots created on the source cluster will be replicated. Active writes from the source volume are not replicated.
    self.mode = objectHash["mode"]
  end
end

class DisableSnmpResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DisableSnmpResult
  end
end

class QoS
  attr_accessor :min_iops, :max_iops, :burst_iops, :burst_time

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # QoS
    # Quality of Service (QoS) values are used on SolidFire volumes to provision performance expectations.
    # Minimum, maximum and burst QoS values can be set within the ranges specified in the QoS table below.
    #
    # Volumes created without specified QoS values are created with the Default values listed below.
    # Default values can be found by running the GetDefaultQoS method.
    #
    # minIOPS Min: 100/50 (v7.0/v8.0), Default: 100, Max: 15,000
    # maxIOPS Min: 100/50 (v7.0/v8.0), Default: 15,000, Max: 100,000
    # burstIOPS Min: 100/50 (v7.0/v8.0), Default: 15,000, Max: 100,000
    # param Fixnum min_iops:  Desired minimum 4KB IOPS to guarantee. The allowed IOPS will only drop below this level if all volumes have been capped at their minimum IOPS value and there is still insufficient performance capacity.
    self.min_iops = objectHash["minIOPS"]

    # param Fixnum max_iops:  Desired maximum 4KB IOPS allowed over an extended period of time.
    self.max_iops = objectHash["maxIOPS"]

    # param Fixnum burst_iops:  Maximum "peak" 4KB IOPS allowed for short periods of time. Allows for bursts of I/O activity over the normal max IOPS value.
    self.burst_iops = objectHash["burstIOPS"]

    # param Fixnum burst_time:  The length of time burst IOPS is allowed. The value returned is represented in time units of seconds. Note: this value is calculated by the system based on IOPS set for QoS.
    self.burst_time = objectHash["burstTime"]
  end
end

class NetworkConfig
  attr_accessor :_default, :bond_master, :virtual_network_tag, :address, :auto, :bond_downdelay, :bond_fail_over_mac, :bond_primary_reselect, :bond_lacp_rate, :bond_miimon, :bond_mode, :bond_slaves, :bond_updelay, :dns_nameservers, :dns_search, :family, :gateway, :mac_address, :mac_address_permanent, :method, :mtu, :netmask, :network, :physical, :routes, :status, :symmetric_route_rules, :up_and_running, :bond_xmit_hash_policy, :bond_ad_num_ports

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NetworkConfig
    # param bool _default:
    self._default = objectHash["#default"]

    # param str bond_master:
    self.bond_master = objectHash["bond-master"]

    # param str virtual_network_tag:
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param str address:
    self.address = objectHash["address"]

    # param bool auto:
    self.auto = objectHash["auto"]

    # param str bond_downdelay:
    self.bond_downdelay = objectHash["bond-downdelay"]

    # param str bond_fail_over_mac:
    self.bond_fail_over_mac = objectHash["bond-fail_over_mac"]

    # param str bond_primary_reselect:
    self.bond_primary_reselect = objectHash["bond-primary_reselect"]

    # param str bond_lacp_rate:
    self.bond_lacp_rate = objectHash["bond-lacp_rate"]

    # param str bond_miimon:
    self.bond_miimon = objectHash["bond-miimon"]

    # param str bond_mode:
    self.bond_mode = objectHash["bond-mode"]

    # param str bond_slaves:
    self.bond_slaves = objectHash["bond-slaves"]

    # param str bond_updelay:
    self.bond_updelay = objectHash["bond-updelay"]

    # param str dns_nameservers:
    self.dns_nameservers = objectHash["dns-nameservers"]

    # param str dns_search:
    self.dns_search = objectHash["dns-search"]

    # param str family:
    self.family = objectHash["family"]

    # param str gateway:
    self.gateway = objectHash["gateway"]

    # param str mac_address:
    self.mac_address = objectHash["macAddress"]

    # param str mac_address_permanent:
    self.mac_address_permanent = objectHash["macAddressPermanent"]

    # param str method:
    self.method = objectHash["method"]

    # param str mtu:
    self.mtu = objectHash["mtu"]

    # param str netmask:
    self.netmask = objectHash["netmask"]

    # param str network:
    self.network = objectHash["network"]

    # param PhysicalAdapter physical:
    self.physical = objectHash["physical"] ? PhysicalAdapter.new(objectHash["physical"]) : nil

    # param dict routes:
    self.routes = objectHash["routes"]

    # param str status:
    self.status = objectHash["status"]

    # param str symmetric_route_rules:
    self.symmetric_route_rules = objectHash["symmetricRouteRules"]

    # param bool up_and_running:
    self.up_and_running = objectHash["upAndRunning"]

    # param str bond_xmit_hash_policy:
    self.bond_xmit_hash_policy = objectHash["bond-xmit_hash_policy"]

    # param str bond_ad_num_ports:
    self.bond_ad_num_ports = objectHash["bond-ad_num_ports"]
  end
end

class Network
  attr_accessor :bond10_g, :bond1_g, :eth0, :eth1, :eth2, :eth3, :lo

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Network
    # param NetworkConfig bond10_g:
    self.bond10_g = objectHash["Bond10G"] ? NetworkConfig.new(objectHash["Bond10G"]) : nil

    # param NetworkConfig bond1_g:
    self.bond1_g = objectHash["Bond1G"] ? NetworkConfig.new(objectHash["Bond1G"]) : nil

    # param NetworkConfig eth0:
    self.eth0 = objectHash["eth0"] ? NetworkConfig.new(objectHash["eth0"]) : nil

    # param NetworkConfig eth1:
    self.eth1 = objectHash["eth1"] ? NetworkConfig.new(objectHash["eth1"]) : nil

    # param NetworkConfig eth2:
    self.eth2 = objectHash["eth2"] ? NetworkConfig.new(objectHash["eth2"]) : nil

    # param NetworkConfig eth3:
    self.eth3 = objectHash["eth3"] ? NetworkConfig.new(objectHash["eth3"]) : nil

    # param NetworkConfig lo:
    self.lo = objectHash["lo"] ? NetworkConfig.new(objectHash["lo"]) : nil
  end
end

class SetNetworkConfigResult
  attr_accessor :network

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetNetworkConfigResult
    # param Network network: [required]
    self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
  end
end

class AddVirtualNetwork
  attr_accessor :virtual_network_tag, :name, :address_blocks, :netmask, :svip, :gateway, :namespace, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddVirtualNetwork
    # You can use the AddVirtualNetwork method to add a new virtual network to a cluster configuration. When you add a virtual network,
    # an interface for each node is created and each interface will require a virtual network IP address. The number of IP addresses you
    # specify as a parameter for this API method must be equal to or greater than the number of nodes in the cluster. The system bulk
    # provisions virtual network addresses and assigns them to individual nodes automatically. You do not need to assign virtual
    # network addresses to nodes manually.
    # Note: You can use AddVirtualNetwork only to create a new virtual network. If you want to make changes to an
    # existing virtual network, use ModifyVirtualNetwork.
    # Note: Virtual network parameters must be unique to each virtual network when setting the namespace parameter to false.
    # param Fixnum virtual_network_tag: [required] A unique virtual network (VLAN) tag. Supported values are 1 through 4094.The number zero (0) is not supported.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param str name: [required] A user-defined name for the new virtual network.
    self.name = objectHash["name"]

    # param AddressBlock address_blocks: [required] Unique range of IP addresses to include in the virtual network. Attributes for this parameter are: start: The start of the IP address range. (String) size: The number of IP addresses to include in the block. (Integer)
    self.address_blocks = Array.new(objectHash["addressBlocks"].length) {|i| AddressBlock.new(objectHash["addressBlocks"][i])}

    # param str netmask: [required] Unique network mask for the virtual network being created.
    self.netmask = objectHash["netmask"]

    # param str svip: [required] Unique storage IP address for the virtual network being created.
    self.svip = objectHash["svip"]

    # param str gateway:  The IP address of a gateway of the virtual network. This parameter is only valid if the "namespace" parameter is set to true.
    self.gateway = objectHash["gateway"]

    # param bool namespace:  When set to true, enables the Routable Storage VLANs functionality by creating and configuring a namespace and the virtual network contained by it.
    self.namespace = objectHash["namespace"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListClusterFaults
  attr_accessor :best_practices, :fault_types

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListClusterFaults
    # ListClusterFaults enables you to retrieve information about any faults detected on the cluster. With this method, you can retrieve both current faults as well as faults that have been resolved. The system caches faults every 30 seconds.
    # param bool best_practices:  Specifies whether to include faults triggered by suboptimal system configuration. Possible values are: true false
    self.best_practices = objectHash["bestPractices"]

    # param str fault_types:  Determines the types of faults returned. Possible values are: current: List active, unresolved faults. resolved: List faults that were previously detected and resolved. all: (Default) List both current and resolved faults. You can see the fault status in the resolved field of the Cluster Fault object.
    self.fault_types = objectHash["faultTypes"]
  end
end

class TestPingResult
  attr_accessor :result, :duration, :details

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestPingResult
    # param str result: [required] Result of the ping test.
    self.result = objectHash["result"]

    # param str duration: [required] The total duration of the ping test.
    self.duration = objectHash["duration"]

    # param dict details: [required] List of each IP the node was able to communicate with.
    self.details = objectHash["details"]
  end
end

class BackupTarget
  attr_accessor :name, :backup_target_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # BackupTarget
    # The object containing information about a backup target.
    # param str name: [required] Name for the backup target.
    self.name = objectHash["name"]

    # param Fixnum backup_target_id: [required] Unique identifier assigned to the backup target.
    self.backup_target_id = objectHash["backupTargetID"]

    # param dict attributes:  List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class GetBackupTargetResult
  attr_accessor :backup_target

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetBackupTargetResult
    # param BackupTarget backup_target: [required] Object returned for backup target.
    self.backup_target = objectHash["backupTarget"] ? BackupTarget.new(objectHash["backupTarget"]) : nil
  end
end

class AddDrivesResult
  attr_accessor :async_handle

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddDrivesResult
    # param Fixnum async_handle:
    self.async_handle = objectHash["asyncHandle"]
  end
end

class ListVolumeStatsByVirtualVolume
  attr_accessor :virtual_volume_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVirtualVolume
    # ListVolumeStatsByVirtualVolume enables you to list volume statistics for any volumes in the system that are associated with virtual volumes. Statistics are cumulative from the creation of the volume.
    # param UUID virtual_volume_ids:  A list of one or more virtual volume IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes.
    self.virtual_volume_ids = Array.new(objectHash["virtualVolumeIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["virtualVolumeIDs"][i])}
  end
end

class SetConfigResult
  attr_accessor :config

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetConfigResult
    # param Config config: [required] The new and current configuration for the node.
    self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
  end
end

class StartBulkVolumeWrite
  attr_accessor :volume_id, :format, :script, :script_parameters, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartBulkVolumeWrite
    # StartBulkVolumeWrite enables you to initialize a bulk volume write session on a specified volume. Only two bulk volume processes can run simultaneously on a volume. When you initialize the write session, data is written to a SolidFire storage volume from an external backup source. The external data is accessed by a web server running on an SF-series node. Communications and server
    # interaction information for external data access is passed by a script running on the storage system.
    # param Fixnum volume_id: [required] The ID of the volume to be written to.
    self.volume_id = objectHash["volumeID"]

    # param str format: [required] The format of the volume data. It can be either of the following formats: uncompressed: Every byte of the volume is returned without any compression. native: Opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write.
    self.format = objectHash["format"]

    # param str script:  The executable name of a script. If unspecified, the key and URL are necessary to access SF-series nodes. The script runs on the primary node and the key and URL is returned to the script, so the local web server can be contacted.
    self.script = objectHash["script"]

    # param dict script_parameters:  JSON parameters to pass to the script.
    self.script_parameters = objectHash["scriptParameters"]

    # param dict attributes:  JSON attributes for the bulk volume job.
    self.attributes = objectHash["attributes"]
  end
end

class ModifyVolumeResult
  attr_accessor :volume

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumeResult
    # param Volume volume:  Object containing information about the newly modified volume.
    self.volume = objectHash["volume"] ? Volume.new(objectHash["volume"]) : nil
  end
end

class PurgeDeletedVolumeResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PurgeDeletedVolumeResult
  end
end

class SnapshotRemoteStatus
  attr_accessor :remote_status, :volume_pair_uuid

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnapshotRemoteStatus
    # param str remote_status: [required]
    self.remote_status = objectHash["remoteStatus"]

    # param UUID volume_pair_uuid: [required] The snapshot is done and is writable (the active branch of the slice).
    self.volume_pair_uuid = objectHash["volumePairUUID"] ? UUIDTools::UUID.parse(objectHash["volumePairUUID"]) : nil
  end
end

class Snapshot
  attr_accessor :snapshot_id, :volume_id, :name, :checksum, :enable_remote_replication, :expiration_reason, :expiration_time, :remote_statuses, :status, :snapshot_uuid, :total_size, :group_id, :group_snapshot_uuid, :create_time, :virtual_volume_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Snapshot
    # Snapshots is an object containing information about each snapshot made for a volume.
    # The return object includes information for the active snapshot as well as each snapshot created for the volume.
    # param Fixnum snapshot_id: [required] Unique ID for this snapshot.
    self.snapshot_id = objectHash["snapshotID"]

    # param Fixnum volume_id: [required] The volume this snapshot was taken of.
    self.volume_id = objectHash["volumeID"]

    # param str name: [required] A name for this snapshot. It is not necessarily unique.
    self.name = objectHash["name"]

    # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data.
    self.checksum = objectHash["checksum"]

    # param bool enable_remote_replication: [required] Identifies if snapshot is enabled for remote replication.
    self.enable_remote_replication = objectHash["enableRemoteReplication"]

    # param str expiration_reason: [required] Indicates how the snapshot expiration was set. Possible values: api: expiration time was set by using the API. none: there is no expiration time set. test: expiration time was set for testing.
    self.expiration_reason = objectHash["expirationReason"]

    # param str expiration_time:  The time at which this snapshot will expire and be purged from the cluster.
    self.expiration_time = objectHash["expirationTime"]

    # param SnapshotRemoteStatus remote_statuses:  Current remote status of the snapshot remoteStatus: Possible values: Present: Snapshot exists on a remote cluster Not Present: Snapshot does not exist on remote cluster Syncing: This is a target cluster and it is currently replicating the snapshot Deleted: This is a target cluster, the snapshot has been deleted, and it still exists on the source. volumePairUUID: universal identifier of the volume pair
    self.remote_statuses = Array.new(objectHash["remoteStatuses"].length) {|i| SnapshotRemoteStatus.new(objectHash["remoteStatuses"][i])}

    # param str status: [required] Current status of the snapshot Preparing: A snapshot that is being prepared for use and is not yet writable. Done: A snapshot that has finished being prepared and is now usable. Active: This snapshot is the active branch.
    self.status = objectHash["status"]

    # param UUID snapshot_uuid: [required] Universal Unique ID of an existing snapshot.
    self.snapshot_uuid = objectHash["snapshotUUID"] ? UUIDTools::UUID.parse(objectHash["snapshotUUID"]) : nil

    # param Fixnum total_size: [required] Total size of this snapshot in bytes. It is equivalent to totalSize of the volume when this snapshot was taken.
    self.total_size = objectHash["totalSize"]

    # param Fixnum group_id:  If present, the ID of the group this snapshot is a part of. If not present, this snapshot is not part of a group.
    self.group_id = objectHash["groupID"]

    # param UUID group_snapshot_uuid: [required] The current "members" results contains information about each snapshot in the group. Each of these members will have a "uuid" parameter for the snapshot's UUID.
    self.group_snapshot_uuid = objectHash["groupSnapshotUUID"] ? UUIDTools::UUID.parse(objectHash["groupSnapshotUUID"]) : nil

    # param str create_time: [required] The time this snapshot was taken.
    self.create_time = objectHash["createTime"]

    # param UUID virtual_volume_id:  The ID of the virtual volume with which the snapshot is associated.
    self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class VirtualVolumeInfo
  attr_accessor :virtual_volume_id, :parent_virtual_volume_id, :storage_container, :volume_id, :snapshot_id, :virtual_volume_type, :status, :bindings, :children, :metadata, :snapshot_info, :volume_info, :descendants

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualVolumeInfo
    # param UUID virtual_volume_id: [required]
    self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

    # param UUID parent_virtual_volume_id: [required]
    self.parent_virtual_volume_id = objectHash["parentVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["parentVirtualVolumeID"]) : nil

    # param StorageContainer storage_container: [required]
    self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil

    # param Fixnum volume_id: [required]
    self.volume_id = objectHash["volumeID"]

    # param Fixnum snapshot_id: [required]
    self.snapshot_id = objectHash["snapshotID"]

    # param str virtual_volume_type: [required]
    self.virtual_volume_type = objectHash["virtualVolumeType"]

    # param str status: [required]
    self.status = objectHash["status"]

    # param Fixnum bindings: [required]
    self.bindings = objectHash["bindings"]

    # param UUID children: [required]
    self.children = Array.new(objectHash["children"].length) {|i| UUIDTools::UUID.parse(objectHash["children"][i])}

    # param dict metadata: [required]
    self.metadata = objectHash["metadata"]

    # param Snapshot snapshot_info:
    self.snapshot_info = objectHash["snapshotInfo"] ? Snapshot.new(objectHash["snapshotInfo"]) : nil

    # param Volume volume_info:
    self.volume_info = objectHash["volumeInfo"] ? Volume.new(objectHash["volumeInfo"]) : nil

    # param Fixnum descendants:
    self.descendants = objectHash["descendants"]
  end
end

class ListVirtualVolumesResult
  attr_accessor :virtual_volumes, :next_virtual_volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumesResult
    # param VirtualVolumeInfo virtual_volumes: [required]
    self.virtual_volumes = Array.new(objectHash["virtualVolumes"].length) {|i| VirtualVolumeInfo.new(objectHash["virtualVolumes"][i])}

    # param UUID next_virtual_volume_id:
    self.next_virtual_volume_id = objectHash["nextVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["nextVirtualVolumeID"]) : nil
  end
end

class DeleteVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolumesResult
    # param Volume volumes: [required] Information about the newly deleted volume.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class ClusterCapacity
  attr_accessor :active_block_space, :active_sessions, :average_iops, :cluster_recent_iosize, :current_iops, :max_iops, :max_over_provisionable_space, :max_provisioned_space, :max_used_metadata_space, :max_used_space, :non_zero_blocks, :peak_active_sessions, :peak_iops, :provisioned_space, :snapshot_non_zero_blocks, :timestamp, :total_ops, :unique_blocks, :unique_blocks_used_space, :used_metadata_space, :used_metadata_space_in_snapshots, :used_space, :zero_blocks

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterCapacity
    # High level capacity measurements for the entire cluster.
    # param Fixnum active_block_space: [required] The amount of space on the block drives. This includes additional information such as metadata entries and space which can be cleaned up.
    self.active_block_space = objectHash["activeBlockSpace"]

    # param Fixnum active_sessions: [required] Number of active iSCSI sessions communicating with the cluster
    self.active_sessions = objectHash["activeSessions"]

    # param Fixnum average_iops: [required] Average IPS for the cluster since midnight Coordinated Universal Time (UTC).
    self.average_iops = objectHash["averageIOPS"]

    # param Fixnum cluster_recent_iosize: [required] The average size of IOPS to all volumes in the cluster.
    self.cluster_recent_iosize = objectHash["clusterRecentIOSize"]

    # param Fixnum current_iops: [required] Average IOPS for all volumes in the cluster over the last 5 seconds.
    self.current_iops = objectHash["currentIOPS"]

    # param Fixnum max_iops: [required] Estimated maximum IOPS capability of the current cluster.
    self.max_iops = objectHash["maxIOPS"]

    # param Fixnum max_over_provisionable_space: [required] The maximum amount of provisionable space. This is a computed value. You cannot create new volumes if the current provisioned space plus the new volume size would exceed this number: maxOverProvisionableSpace = maxProvisionedSpace * GetClusterFull
    self.max_over_provisionable_space = objectHash["maxOverProvisionableSpace"]

    # param Fixnum max_provisioned_space: [required] The total amount of provisionable space if all volumes are 100% filled (no thin provisioned metadata).
    self.max_provisioned_space = objectHash["maxProvisionedSpace"]

    # param Fixnum max_used_metadata_space: [required] The amount of bytes on volume drives used to store metadata.
    self.max_used_metadata_space = objectHash["maxUsedMetadataSpace"]

    # param Fixnum max_used_space: [required] The total amount of space on all active block drives.
    self.max_used_space = objectHash["maxUsedSpace"]

    # param Fixnum non_zero_blocks: [required] Total number of 4KiB blocks with data after the last garbage collection operation has completed.
    self.non_zero_blocks = objectHash["nonZeroBlocks"]

    # param Fixnum peak_active_sessions: [required] Peak number of iSCSI connections since midnight UTC.
    self.peak_active_sessions = objectHash["peakActiveSessions"]

    # param Fixnum peak_iops: [required] The highest value for currentIOPS since midnight UTC.
    self.peak_iops = objectHash["peakIOPS"]

    # param Fixnum provisioned_space: [required] Total amount of space provisioned in all volumes on the cluster.
    self.provisioned_space = objectHash["provisionedSpace"]

    # param Fixnum snapshot_non_zero_blocks: [required] Total number of 4KiB blocks in snapshots with data.
    self.snapshot_non_zero_blocks = objectHash["snapshotNonZeroBlocks"]

    # param str timestamp: [required] The date and time this cluster capacity sample was taken.
    self.timestamp = objectHash["timestamp"]

    # param Fixnum total_ops: [required] The total number of I/O operations performed throughout the lifetime of the cluster
    self.total_ops = objectHash["totalOps"]

    # param Fixnum unique_blocks: [required] The total number of blocks stored on the block drives. The value includes replicated blocks.
    self.unique_blocks = objectHash["uniqueBlocks"]

    # param Fixnum unique_blocks_used_space: [required] The total amount of data the uniqueBlocks take up on the block drives. This number is always consistent with the uniqueBlocks value.
    self.unique_blocks_used_space = objectHash["uniqueBlocksUsedSpace"]

    # param Fixnum used_metadata_space: [required] The total amount of bytes on volume drives used to store metadata
    self.used_metadata_space = objectHash["usedMetadataSpace"]

    # param Fixnum used_metadata_space_in_snapshots: [required] The amount of bytes on volume drives used for storing unique data in snapshots. This number provides an estimate of how much metadata space would be regained by deleting all snapshots on the system.
    self.used_metadata_space_in_snapshots = objectHash["usedMetadataSpaceInSnapshots"]

    # param Fixnum used_space: [required] Total amount of space used by all block drives in the system.
    self.used_space = objectHash["usedSpace"]

    # param Fixnum zero_blocks: [required] Total number of 4KiB blocks without data after the last round of garabage collection operation has completed.
    self.zero_blocks = objectHash["zeroBlocks"]
  end
end

class GetClusterCapacityResult
  attr_accessor :cluster_capacity

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterCapacityResult
    # param ClusterCapacity cluster_capacity: [required]
    self.cluster_capacity = objectHash["clusterCapacity"] ? ClusterCapacity.new(objectHash["clusterCapacity"]) : nil
  end
end

class GetHardwareConfigResult
  attr_accessor :hardware_config

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetHardwareConfigResult
    # param dict hardware_config: [required] List of hardware information and current settings.
    self.hardware_config = objectHash["hardwareConfig"]
  end
end

class TestConnectSvip
  attr_accessor :svip

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectSvip
    # The TestConnectSvip API method enables you to test the storage connection to the cluster. The test pings the SVIP using ICMP packets, and when successful, connects as an iSCSI initiator.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param str svip:  If specified, tests the storage connection of a different SVIP. You do not need to use this value when testing the connection to the target cluster. This parameter is optional.
    self.svip = objectHash["svip"]
  end
end

class TestPing
  attr_accessor :attempts, :hosts, :total_timeout_sec, :packet_size, :ping_timeout_msec, :prohibit_fragmentation

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestPing
    # You can use the TestPing API method to validate the
    # connection to all the nodes in a cluster on both 1G and 10G interfaces by using ICMP packets. The test uses the appropriate MTU sizes for each packet based on the MTU settings in the network configuration.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param Fixnum attempts:  Specifies the number of times the system should repeat the test ping. The default value is 5.
    self.attempts = objectHash["attempts"]

    # param str hosts:  Specifies a comma-separated list of addresses or hostnames of devices to ping.
    self.hosts = objectHash["hosts"]

    # param Fixnum total_timeout_sec:  Specifies the length of time the ping should wait for a system response before issuing the next ping attempt or ending the process.
    self.total_timeout_sec = objectHash["totalTimeoutSec"]

    # param Fixnum packet_size:  Specifies the number of bytes to send in the ICMP packet that is sent to each IP. The number must be less than the maximum MTU specified in the network configuration.
    self.packet_size = objectHash["packetSize"]

    # param Fixnum ping_timeout_msec:  Specifies the number of milliseconds to wait for each individual ping response. The default value is 500 ms.
    self.ping_timeout_msec = objectHash["pingTimeoutMsec"]

    # param bool prohibit_fragmentation:  Specifies that the Do not Fragment (DF) flag is enabled for the ICMP packets.
    self.prohibit_fragmentation = objectHash["prohibitFragmentation"]
  end
end

class NodeStatsInfo
  attr_accessor :c_bytes_in, :c_bytes_out, :cpu, :m_bytes_in, :m_bytes_out, :network_utilization_cluster, :network_utilization_storage, :node_id, :s_bytes_in, :s_bytes_out, :timestamp, :used_memory

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeStatsInfo
    # param Fixnum c_bytes_in: [required] Bytes in on the cluster interface.
    self.c_bytes_in = objectHash["cBytesIn"]

    # param Fixnum c_bytes_out: [required] Bytes out on the cluster interface.
    self.c_bytes_out = objectHash["cBytesOut"]

    # param Fixnum cpu: [required] CPU Usage %
    self.cpu = objectHash["cpu"]

    # param Fixnum m_bytes_in: [required] Bytes in on the management interface.
    self.m_bytes_in = objectHash["mBytesIn"]

    # param Fixnum m_bytes_out: [required] Bytes out on the management interface.
    self.m_bytes_out = objectHash["mBytesOut"]

    # param Fixnum network_utilization_cluster: [required] Network interface utilization (in %) for the cluster network interface.
    self.network_utilization_cluster = objectHash["networkUtilizationCluster"]

    # param Fixnum network_utilization_storage: [required] Network interface utilization (in %) for the storage network interface.
    self.network_utilization_storage = objectHash["networkUtilizationStorage"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param Fixnum s_bytes_in: [required] Bytes in on the storage interface.
    self.s_bytes_in = objectHash["sBytesIn"]

    # param Fixnum s_bytes_out: [required] Bytes out on the storage interface.
    self.s_bytes_out = objectHash["sBytesOut"]

    # param str timestamp: [required] Current time in UTC format ISO 8691 date string.
    self.timestamp = objectHash["timestamp"]

    # param Fixnum used_memory: [required] Total memory usage in bytes.
    self.used_memory = objectHash["usedMemory"]
  end
end

class NodeStatsNodes
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeStatsNodes
    # param NodeStatsInfo nodes: [required] Node activity information for a single node.
    self.nodes = Array.new(objectHash["nodes"].length) {|i| NodeStatsInfo.new(objectHash["nodes"][i])}
  end
end

class ListNodeStatsResult
  attr_accessor :node_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListNodeStatsResult
    # param NodeStatsNodes node_stats: [required] Node activity information for all nodes.
    self.node_stats = objectHash["nodeStats"] ? NodeStatsNodes.new(objectHash["nodeStats"]) : nil
  end
end

class DeleteVolumeAccessGroupResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolumeAccessGroupResult
  end
end

class DeleteInitiatorsResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteInitiatorsResult
  end
end

class AddInitiatorsToVolumeAccessGroup
  attr_accessor :volume_access_group_id, :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddInitiatorsToVolumeAccessGroup
    # AddInitiatorsToVolumeAccessGroup enables you
    # to add initiators to a specified volume access group.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group to modify.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param str initiators: [required] The list of initiators to add to the volume access group.
    self.initiators = objectHash["initiators"]
  end
end

class DeleteVolumeAccessGroup
  attr_accessor :volume_access_group_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolumeAccessGroup
    # DeleteVolumeAccessGroup enables you to delete a
    # volume access group.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group to be deleted.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]
  end
end

class FeatureObject
  attr_accessor :enabled, :feature

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # FeatureObject
    # param bool enabled: [required] True if the feature is enabled, otherwise false.
    self.enabled = objectHash["enabled"]

    # param str feature: [required] The name of the feature.
    self.feature = objectHash["feature"]
  end
end

class GetFeatureStatusResult
  attr_accessor :features

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetFeatureStatusResult
    # param FeatureObject features: [required] An array of feature objects indicating the feature name and its status.
    self.features = Array.new(objectHash["features"].length) {|i| FeatureObject.new(objectHash["features"][i])}
  end
end

class ListVirtualNetworks
  attr_accessor :virtual_network_id, :virtual_network_tag, :virtual_network_ids, :virtual_network_tags

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualNetworks
    # ListVirtualNetworks enables you to list all configured virtual networks for the cluster. You can use this method to verify the virtual
    # network settings in the cluster.
    # There are no required parameters for this method. However, to filter the results, you can pass one or more VirtualNetworkID or
    # VirtualNetworkTag values.
    # param Fixnum virtual_network_id:  Network ID to filter the list for a single virtual network.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tag:  Network tag to filter the list for a single virtual network.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param Fixnum virtual_network_ids:  Network IDs to include in the list.
    self.virtual_network_ids = objectHash["virtualNetworkIDs"]

    # param Fixnum virtual_network_tags:  Network tag to include in the list.
    self.virtual_network_tags = objectHash["virtualNetworkTags"]
  end
end

class ListSchedulesResult
  attr_accessor :schedules

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListSchedulesResult
    # param Schedule schedules: [required] The list of schedules currently on the cluster.
    self.schedules = Array.new(objectHash["schedules"].length) {|i| Schedule.new(objectHash["schedules"][i])}
  end
end

class SetNetworkConfig
  attr_accessor :network

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetNetworkConfig
    # The SetNetworkConfig API method enables you to set the network configuration for a node. To display the current network settings for a node, run the GetNetworkConfig API method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # Changing the "bond-mode" on a node can cause a temporary loss of network connectivity. Exercise caution when using this method.
    # param NetworkParams network: [required] An object containing node network settings to modify.
    self.network = objectHash["network"] ? NetworkParams.new(objectHash["network"]) : nil
  end
end

class StartBulkVolumeRead
  attr_accessor :volume_id, :format, :snapshot_id, :script, :script_parameters, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartBulkVolumeRead
    # StartBulkVolumeRead enables you to initialize a bulk volume read session on a specified volume. Only two bulk volume processes
    # can run simultaneously on a volume. When you initialize the session, data is read from a SolidFire storage volume for the purposes
    # of storing the data on an external backup source. The external data is accessed by a web server running on an SF-series node.
    # Communications and server interaction information for external data access is passed by a script running on the storage system.
    # At the start of a bulk volume read operation, a snapshot of the volume is made and the snapshot is deleted when the read is complete. You can also read a snapshot of the volume by entering the ID of the snapshot as a parameter. When you read a
    # previous snapshot, the system does not create a new snapshot of the volume or delete the previous snapshot when the
    # read completes.
    # Note: This process creates a new snapshot if the ID of an existing snapshot is not provided. Snapshots can be created if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param Fixnum volume_id: [required] The ID of the volume to be read.
    self.volume_id = objectHash["volumeID"]

    # param str format: [required] The format of the volume data. It can be either of the following formats: uncompressed: Every byte of the volume is returned without any compression. native: Opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write.
    self.format = objectHash["format"]

    # param Fixnum snapshot_id:  The ID of a previously created snapshot used for bulk volume reads. If no ID is entered, a snapshot of the current active volume image is made.
    self.snapshot_id = objectHash["snapshotID"]

    # param str script:  The executable name of a script. If unspecified, the key and URL is necessary to access SF-series nodes. The script is run on the primary node and the key and URL is returned to the script so the local web server can be contacted.
    self.script = objectHash["script"]

    # param dict script_parameters:  JSON parameters to pass to the script.
    self.script_parameters = objectHash["scriptParameters"]

    # param dict attributes:  JSON attributes for the bulk volume job.
    self.attributes = objectHash["attributes"]
  end
end

class AddDrives
  attr_accessor :drives, :force_during_upgrade

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddDrives
    # AddDrives enables you to add one or more available drives to the cluster, enabling the drives to host a portion of the cluster's data.
    # When you add a node to the cluster or install new drives in an existing node, the new drives are marked as "available" and must be
    # added via AddDrives before they can be utilized. Use the ListDrives method to display drives that are "available" to be added. When
    # you add multiple drives, it is more efficient to add them in a single AddDrives method call rather than multiple individual methods
    # with a single drive each. This reduces the amount of data balancing that must occur to stabilize the storage load on the cluster.
    # When you add a drive, the system automatically determines the "type" of drive it should be.
    # The method is asynchronous and returns immediately. However, it can take some time for the data in the cluster to be rebalanced
    # using the newly added drives. As the new drives are syncing on the system, you can use the ListSyncJobs method to see how the
    # drives are being rebalanced and the progress of adding the new drive. You can also use the GetAsyncResult method to query the
    # method's returned asyncHandle.
    # param NewDrive drives: [required] Returns information about each drive to be added to the cluster. Possible values are: driveID: The ID of the drive to add. (Integer) type: (Optional) The type of drive to add. Valid values are "slice" or "block". If omitted, the system assigns the correct type. (String)
    self.drives = Array.new(objectHash["drives"].length) {|i| NewDrive.new(objectHash["drives"][i])}

    # param bool force_during_upgrade:  Allows the user to force the addition of drives during an upgrade.
    self.force_during_upgrade = objectHash["forceDuringUpgrade"]
  end
end

class DeleteVolume
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteVolume
    # DeleteVolume marks an active volume for deletion. When marked, the volume is purged (permanently deleted) after the cleanup
    # interval elapses. After making a request to delete a volume, any active iSCSI connections to the volume are immediately terminated
    # and no further connections are allowed while the volume is in this state. A marked volume is not returned in target discovery
    # requests.
    # Any snapshots of a volume that has been marked for deletion are not affected. Snapshots are kept until the volume is purged from
    # the system.
    # If a volume is marked for deletion and has a bulk volume read or bulk volume write operation in progress, the bulk volume read or
    # write operation is stopped.
    # If the volume you delete is paired with a volume, replication between the paired volumes is suspended and no data is transferred
    # to it or from it while in a deleted state. The remote volume that the deleted volume was paired with enters into a PausedMisconfigured state and data is no longer sent to it or from the deleted volume. Until the deleted volume is purged, it can be restored and data transfers resume. If the deleted volume gets purged from the system, the volume it was paired with enters into a StoppedMisconfigured state and the volume pairing status is removed. The purged volume becomes permanently unavailable.
    # param Fixnum volume_id: [required] The ID of the volume to be deleted.
    self.volume_id = objectHash["volumeID"]
  end
end

class CreateScheduleResult
  attr_accessor :schedule_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateScheduleResult
    # param Fixnum schedule_id: [required]
    self.schedule_id = objectHash["scheduleID"]
  end
end

class Shutdown
  attr_accessor :nodes, :option

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Shutdown
    # The Shutdown API method enables you to restart or shutdown a node that has not yet been added to a cluster. To use this method,
    # log in to the MIP for the pending node, and enter the "shutdown" method with either the "restart" or "halt" options.
    # param Fixnum nodes: [required] List of NodeIDs for the nodes to be shutdown.
    self.nodes = objectHash["nodes"]

    # param str option:  Specifies the action to take for the node shutdown. Possible values are: restart: Restarts the node. halt: Shuts down the node.
    self.option = objectHash["option"]
  end
end

class GetAsyncResult
  attr_accessor :async_handle, :keep_result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAsyncResult
    # You can use GetAsyncResult to retrieve the result of asynchronous method calls. Some method calls require some time to run, and
    # might not be finished when the system sends the initial response. To obtain the status or result of the method call, use
    # GetAsyncResult to poll the asyncHandle value returned by the method.
    # GetAsyncResult returns the overall status of the operation (in progress, completed, or error) in a standard fashion, but the actual
    # data returned for the operation depends on the original method call and the return data is documented with each method.
    # param Fixnum async_handle: [required] A value that was returned from the original asynchronous method call.
    self.async_handle = objectHash["asyncHandle"]

    # param bool keep_result:  If true, GetAsyncResult does not remove the asynchronous result upon returning it, enabling future queries to that asyncHandle.
    self.keep_result = objectHash["keepResult"]
  end
end

class CreateVolumeResult
  attr_accessor :volume_id, :volume, :curve

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateVolumeResult
    # param Volume volume:
    self.volume = objectHash["volume"] ? Volume.new(objectHash["volume"]) : nil

    # param Fixnum volume_id: [required] VolumeID for the newly created volume.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum curve: [required] The curve is a set of key-value pairs. The keys are I/O sizes in bytes. The values represent the cost performing an IOP at a specific I/O size. The curve is calculated relative to a 4096 byte operation set at 100 IOPS.
    self.curve = objectHash["curve"]
  end
end

class ModifyAccount
  attr_accessor :account_id, :username, :status, :initiator_secret, :target_secret, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyAccount
    # ModifyAccount enables you to modify an existing account.
    # When you lock an account, any existing connections from that account are immediately terminated. When you change an account's
    # CHAP settings, any existing connections remain active, and the new CHAP settings are used on subsequent connections or
    # reconnections.
    # To clear an account's attributes, specify {} for the attributes parameter.
    # param Fixnum account_id: [required] Specifies the AccountID for the account to be modified.
    self.account_id = objectHash["accountID"]

    # param str username:  Specifies the username associated with the account. (Might be 1 to 64 characters in length).
    self.username = objectHash["username"]

    # param str status:  Sets the status for the account. Possible values are: active: The account is active and connections are allowed. locked: The account is locked and connections are refused.
    self.status = objectHash["status"]

    # param CHAPSecret initiator_secret:  Specifies the CHAP secret to use for the initiator. This secret must be 12-16 characters in length and should be impenetrable. The initiator CHAP secret must be unique and cannot be the same as the target CHAP secret.
    self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

    # param CHAPSecret target_secret:  Specifies the CHAP secret to use for the target (mutual CHAP authentication). This secret must be 12-16 characters in length and should be impenetrable. The target CHAP secret must be unique and cannot be the same as the initiator CHAP secret.
    self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ClusterAdmin
  attr_accessor :auth_method, :access, :cluster_admin_id, :username, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterAdmin
    # param str auth_method: [required]
    self.auth_method = objectHash["authMethod"]

    # param str access: [required]
    self.access = objectHash["access"]

    # param Fixnum cluster_admin_id: [required]
    self.cluster_admin_id = objectHash["clusterAdminID"]

    # param str username: [required]
    self.username = objectHash["username"]

    # param dict attributes:  List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class GetCurrentClusterAdminResult
  attr_accessor :cluster_admin

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetCurrentClusterAdminResult
    # param ClusterAdmin cluster_admin: [required] Information about all cluster and LDAP administrators that exist for a cluster.
    self.cluster_admin = objectHash["clusterAdmin"] ? ClusterAdmin.new(objectHash["clusterAdmin"]) : nil
  end
end

class ResetNode
  attr_accessor :build, :force, :options, :reboot

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetNode
    # The ResetNode API method enables you to reset a node to the factory settings. All data, packages (software upgrades, and so on),
    # configurations, and log files are deleted from the node when you call this method. However, network settings for the node are
    # preserved during this operation. Nodes that are participating in a cluster cannot be reset to the factory settings.
    # The ResetNode API can only be used on nodes that are in an "Available" state. It cannot be used on nodes that are "Active" in a
    # cluster, or in a "Pending" state.
    # Caution: This method clears any data that is on the node. Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param str build: [required] Specifies the URL to a remote Element software image to which the node will be reset.
    self.build = objectHash["build"]

    # param bool force: [required] Required parameter to successfully reset the node.
    self.force = objectHash["force"]

    # param str options:  Specifications for running the reset operation.
    self.options = objectHash["options"]

    # param bool reboot:  Should it be rebooted?
    self.reboot = objectHash["reboot"]
  end
end

class SetLoginSessionInfo
  attr_accessor :timeout

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetLoginSessionInfo
    # You can use SetLoginSessionInfo to set the period of time that a session's login authentication is valid. After the log in period elapses without activity on the system, the authentication expires. New login credentials are required for continued access to the cluster after the timeout period has elapsed.
    # param str timeout: [required] Cluster authentication expiration period. Formatted in HH:mm:ss. For example, 01:30:00, 00:90:00, and 00:00:5400 can be used to equal a 90 minute timeout period. The default value is 30 minutes.
    self.timeout = objectHash["timeout"]
  end
end

class CreateSnapshotResult
  attr_accessor :snapshot, :snapshot_id, :checksum

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateSnapshotResult
    # param Snapshot snapshot: [required]
    self.snapshot = objectHash["snapshot"] ? Snapshot.new(objectHash["snapshot"]) : nil

    # param Fixnum snapshot_id: [required] ID of the newly-created snapshot.
    self.snapshot_id = objectHash["snapshotID"]

    # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data.
    self.checksum = objectHash["checksum"]
  end
end

class FibreChannelPortInfo
  attr_accessor :firmware, :hba_port, :model, :n_port_id, :pci_slot, :serial, :speed, :state, :switch_wwn, :wwnn, :wwpn

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # FibreChannelPortInfo
    # Fibre Channel Node Port Info object returns information about all Fibre Channel ports on a node, or for one node in the cluster. The same information is returned for all ports or port information for one node. This information is returned with the API method ListNodeFibreChannelPortInfo (in the SolidFire API Guide).
    # param str firmware: [required] The version of the firmware installed on the Fibre Channel port.
    self.firmware = objectHash["firmware"]

    # param Fixnum hba_port: [required] The ID of the individual HBA port.
    self.hba_port = objectHash["hbaPort"]

    # param str model: [required] Model of the HBA on the port.
    self.model = objectHash["model"]

    # param str n_port_id: [required] Unique SolidFire port node ID.
    self.n_port_id = objectHash["nPortID"]

    # param Fixnum pci_slot: [required] Slot in which the pci card resides on the Fibre Channel node hardware.
    self.pci_slot = objectHash["pciSlot"]

    # param str serial: [required] Serial number on the Fibre Channel port.
    self.serial = objectHash["serial"]

    # param str speed: [required] Speed of the HBA on the port.
    self.speed = objectHash["speed"]

    # param str state: [required] Possible values:  <strong>UnknownNotPresentOnlineOfflineBlockedBypassedDiagnosticsLinkdownErrorLoopbackDeleted</strong>
    self.state = objectHash["state"]

    # param str switch_wwn: [required] The World Wide Name of the Fibre Channel switch port.
    self.switch_wwn = objectHash["switchWwn"]

    # param str wwnn: [required] World Wide Node Name of the HBA node.
    self.wwnn = objectHash["wwnn"]

    # param str wwpn: [required] World Wide Port Name assigned to the physical port of the HBA.
    self.wwpn = objectHash["wwpn"]
  end
end

class FibreChannelPortList
  attr_accessor :fibre_channel_ports

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # FibreChannelPortList
    # List of all Fibre Channel ports.
    # param FibreChannelPortInfo fibre_channel_ports: [required] List of all physical Fibre Channel ports.
    self.fibre_channel_ports = Array.new(objectHash["fibreChannelPorts"].length) {|i| FibreChannelPortInfo.new(objectHash["fibreChannelPorts"][i])}
  end
end

class FibreChannelPortInfoResult
  attr_accessor :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # FibreChannelPortInfoResult
    # Used to return information about the Fibre Channel ports.
    # param FibreChannelPortList result: [required] Used to return information about the Fibre Channel ports.
    self.result = objectHash["result"] ? FibreChannelPortList.new(objectHash["result"]) : nil
  end
end

class ListFibreChannelPortInfoResult
  attr_accessor :fibre_channel_port_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListFibreChannelPortInfoResult
    # ListFibreChannelPortInfoResult is used to return information about the Fibre Channel ports.
    # param FibreChannelPortInfoResult fibre_channel_port_info: [required] Used to return information about the Fibre Channel ports.
    self.fibre_channel_port_info = Hash[*objectHash["fibreChannelPortInfo"].map {|k, obj| [k, FibreChannelPortInfoResult.new(obj)]}.flatten]
  end
end

class EnableLdapAuthenticationResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableLdapAuthenticationResult
  end
end

class RestoreDeletedVolumeResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RestoreDeletedVolumeResult
  end
end

class ListDeletedVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDeletedVolumesResult
    # param Volume volumes: [required] List of deleted volumes.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class ListSnapshots
  attr_accessor :volume_id, :snapshot_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListSnapshots
    # ListSnapshots enables you to return the attributes of each snapshot taken on the volume. Information about snapshots that reside on the target cluster is displayed on the source cluster when this method is called from the source cluster.
    # param Fixnum volume_id:  Retrieves snapshots for a volume. If volumeID is not provided, all snapshots for all volumes are returned.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum snapshot_id:  Retrieves information for a specific snapshot ID.
    self.snapshot_id = objectHash["snapshotID"]
  end
end

class ListActiveVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListActiveVolumesResult
    # param Volume volumes: [required] List of active volumes.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class GetNtpInfoResult
  attr_accessor :broadcastclient, :servers

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNtpInfoResult
    # param bool broadcastclient: [required] Indicates whether or not the nodes in the cluster are listening for broadcast NTP messages. Possible values: true false
    self.broadcastclient = objectHash["broadcastclient"]

    # param str servers: [required] List of NTP servers.
    self.servers = objectHash["servers"]
  end
end

class ListAsyncResults
  attr_accessor :async_result_types

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListAsyncResults
    # You can use ListAsyncResults to list the results of all currently running and completed asynchronous methods on the system.
    # Querying asynchronous results with ListAsyncResults does not cause completed asyncHandles to expire; you can use GetAsyncResult
    # to query any of the asyncHandles returned by ListAsyncResults.
    # param str async_result_types:  An optional list of types of results. You can use this list to restrict the results to only these types of operations. Possible values are: BulkVolume: Copy operations between volumes, such as backups or restores. Clone: Volume cloning operations. DriveRemoval: Operations involving the system copying data from a drive in preparation to remove it from the cluster. RtfiPendingNode: Operations involving the system installing compatible software on a node before adding it to the cluster
    self.async_result_types = objectHash["asyncResultTypes"]
  end
end

class ModifyAccountResult
  attr_accessor :account

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyAccountResult
    # param Account account: [required]
    self.account = objectHash["account"] ? Account.new(objectHash["account"]) : nil
  end
end

class GetVirtualVolumeCountResult
  attr_accessor :count

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVirtualVolumeCountResult
    # param Fixnum count: [required] The number of virtual volumes currently in the system.
    self.count = objectHash["count"]
  end
end

class ListUtilitiesResult
  attr_accessor :utilities

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListUtilitiesResult
    # param omnitype utilities: [required] List of utilities currently available to run on the node.
    self.utilities = objectHash["utilities"]
  end
end

class RemoveInitiatorsFromVolumeAccessGroup
  attr_accessor :volume_access_group_id, :initiators, :delete_orphan_initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveInitiatorsFromVolumeAccessGroup
    # RemoveInitiatorsFromVolumeAccessGroup enables
    # you to remove initiators from a specified volume access
    # group.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group from which the initiators are removed.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param str initiators: [required] The list of initiators to remove from the volume access group.
    self.initiators = objectHash["initiators"]

    # param bool delete_orphan_initiators:  true: Delete initiator objects after they are removed from a volume access group. false: Do not delete initiator objects after they are removed from a volume access group.
    self.delete_orphan_initiators = objectHash["deleteOrphanInitiators"]
  end
end

class SetDefaultQoS
  attr_accessor :min_iops, :max_iops, :burst_iops

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetDefaultQoS
    # SetDefaultQoS enables you to configure the default Quality of Service (QoS) values (measured in inputs and outputs per second, or
    # IOPS) for a volume. For more information about QoS in a SolidFire cluster, see the User Guide.
    # param Fixnum min_iops:  The minimum number of sustained IOPS provided by the cluster to a volume.
    self.min_iops = objectHash["minIOPS"]

    # param Fixnum max_iops:  The maximum number of sustained IOPS provided by the cluster to a volume.
    self.max_iops = objectHash["maxIOPS"]

    # param Fixnum burst_iops:  The maximum number of IOPS allowed in a short burst scenario.
    self.burst_iops = objectHash["burstIOPS"]
  end
end

class SetSnmpTrapInfoResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpTrapInfoResult
  end
end

class DeleteStorageContainers
  attr_accessor :storage_container_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteStorageContainers
    # DeleteStorageContainers enables you to remove up to 2000 Virtual Volume (VVol) storage containers from the system at one time.
    # The storage containers you remove must not contain any VVols.
    # param UUID storage_container_ids: [required] A list of IDs of the storage containers to delete. You can specify up to 2000 IDs in the list.
    self.storage_container_ids = Array.new(objectHash["storageContainerIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["storageContainerIDs"][i])}
  end
end

class VolumeAccessGroup
  attr_accessor :deleted_volumes, :volume_access_group_id, :name, :initiator_ids, :initiators, :volumes, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VolumeAccessGroup
    # A volume access group is a useful way of grouping volumes and initiators together for ease of management.
    #
    # Volume Access Group Limits:
    #
    # - A volume access group can contain up to sixty-four initiator IQNs.
    # - An initiator can only beinteger to only one volume access group.
    # - A volume access group can contain up to two thousand volumes.
    # - Each volume access group can beinteger to a maximum of four other volume access groups.
    # param Fixnum deleted_volumes: [required] A list of deleted volumes that have yet to be purged from the VAG.
    self.deleted_volumes = objectHash["deletedVolumes"]

    # param Fixnum volume_access_group_id: [required] Unique ID for this volume access group.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param str name: [required] Name of the volume access group.
    self.name = objectHash["name"]

    # param Fixnum initiator_ids: [required] A list of IDs of initiators that are mapped to the VAG.
    self.initiator_ids = objectHash["initiatorIDs"]

    # param str initiators: [required] List of unique initiator names beintegering to the volume access group.
    self.initiators = objectHash["initiators"]

    # param Fixnum volumes: [required] List of volumes beintegering to the volume access group.
    self.volumes = objectHash["volumes"]

    # param dict attributes: [required] List of name/value pairs
    self.attributes = objectHash["attributes"]
  end
end

class CreateVolumeAccessGroupResult
  attr_accessor :volume_access_group_id, :volume_access_group

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateVolumeAccessGroupResult
    # param Fixnum volume_access_group_id: [required] The ID for the newly-created volume access group.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param VolumeAccessGroup volume_access_group:
    self.volume_access_group = objectHash["volumeAccessGroup"] ? VolumeAccessGroup.new(objectHash["volumeAccessGroup"]) : nil
  end
end

class CreateStorageContainer
  attr_accessor :name, :initiator_secret, :target_secret, :account_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateStorageContainer
    # CreateStorageContainer enables you to create a Virtual Volume (VVol) storage container. Storage containers are associated with a SolidFire storage system account, and are used for reporting and resource allocation. Storage containers can only be associated with virtual volumes. You need at least one storage container to use the Virtual Volumes feature.
    # param str name: [required] The name of the storage container. Follows SolidFire account naming restrictions.
    self.name = objectHash["name"]

    # param str initiator_secret:  The secret for CHAP authentication for the initiator.
    self.initiator_secret = objectHash["initiatorSecret"]

    # param str target_secret:  The secret for CHAP authentication for the target.
    self.target_secret = objectHash["targetSecret"]

    # param Fixnum account_id:  Non-storage container account that will become a storage container.
    self.account_id = objectHash["accountID"]
  end
end

class AddVirtualNetworkResult
  attr_accessor :virtual_network_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddVirtualNetworkResult
    # param Fixnum virtual_network_id:  The virtual network ID of the new virtual network.
    self.virtual_network_id = objectHash["virtualNetworkID"]
  end
end

class AddNodes
  attr_accessor :pending_nodes, :auto_install

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddNodes
    # AddNodes enables you to add one or more new nodes to a cluster. When a node that is not configured starts up for the first time, you are prompted to configure the node. After you configure the node, it is registered as a "pending node" with the cluster.
    # Note: It might take several seconds after adding a new node for it to start up and register its drives as available.
    # param Fixnum pending_nodes: [required]  List of pending NodeIDs for the nodes to be added. You can  obtain the list of pending nodes using the ListPendingNodes method.
    self.pending_nodes = objectHash["pendingNodes"]

    # param bool auto_install:  Whether these nodes should be autoinstalled
    self.auto_install = objectHash["autoInstall"]
  end
end

class RtfiInfo
  attr_accessor :generation, :mipi, :status_url_logfile, :build, :status_url_all, :generation_next, :mip, :status_url_current, :options

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RtfiInfo
    # param str mipi:
    self.mipi = objectHash["mipi"]

    # param omnitype generation: [required]
    self.generation = objectHash["generation"]

    # param str status_url_logfile:
    self.status_url_logfile = objectHash["statusUrlLogfile"]

    # param str build: [required]
    self.build = objectHash["build"]

    # param str status_url_all: [required]
    self.status_url_all = objectHash["statusUrlAll"]

    # param Fixnum generation_next:
    self.generation_next = objectHash["generationNext"]

    # param str mip:
    self.mip = objectHash["mip"]

    # param str status_url_current: [required]
    self.status_url_current = objectHash["statusUrlCurrent"]

    # param dict options:
    self.options = objectHash["options"]
  end
end

class ResetNodeDetails
  attr_accessor :rtfi_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetNodeDetails
    # param RtfiInfo rtfi_info: [required]
    self.rtfi_info = objectHash["rtfiInfo"] ? RtfiInfo.new(objectHash["rtfiInfo"]) : nil
  end
end

class ResetNodeResult
  attr_accessor :details, :duration, :result, :rtfi_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetNodeResult
    # param ResetNodeDetails details:
    self.details = objectHash["details"] ? ResetNodeDetails.new(objectHash["details"]) : nil

    # param str duration:
    self.duration = objectHash["duration"]

    # param str result:
    self.result = objectHash["result"]

    # param RtfiInfo rtfi_info:
    self.rtfi_info = objectHash["rtfiInfo"] ? RtfiInfo.new(objectHash["rtfiInfo"]) : nil
  end
end

class EnableLdapAuthentication
  attr_accessor :server_uris, :auth_type, :group_search_base_dn, :group_search_custom_filter, :group_search_type, :search_bind_dn, :search_bind_password, :user_dntemplate, :user_search_base_dn, :user_search_filter

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableLdapAuthentication
    # The EnableLdapAuthentication method enables you to configure an LDAP directory connection to use for LDAP authentication to a cluster. Users that are members of the LDAP directory can then log in to the storage system using their LDAP credentials.
    # param str auth_type:  Identifies which user authentication method to use. Must be one of the following: DirectBind SearchAndBind
    self.auth_type = objectHash["authType"]

    # param str group_search_base_dn:  The base DN of the tree to start the group search (will do a subtree search from here).
    self.group_search_base_dn = objectHash["groupSearchBaseDN"]

    # param str group_search_custom_filter:  For use with the CustomFilter search type, an LDAP filter to use to return the DNs of a users groups. The string can have placeholder text of %USERNAME% and %USERDN% to be replaced with their username and full userDN as needed.
    self.group_search_custom_filter = objectHash["groupSearchCustomFilter"]

    # param str group_search_type:  Controls the default group search filter used, and must be one of the following: NoGroups: No group support. ActiveDirectory: Nested membership of all of a users AD groups. MemberDN: MemberDN style groups (single level).
    self.group_search_type = objectHash["groupSearchType"]

    # param str search_bind_dn:  A fully qualified DN to log in with to perform an LDAP search for the user (needs read access to the LDAP directory).
    self.search_bind_dn = objectHash["searchBindDN"]

    # param str search_bind_password:  The password for the searchBindDN account used for searching.
    self.search_bind_password = objectHash["searchBindPassword"]

    # param str server_uris: [required] A comma-separated list of LDAP server URIs (examples: "ldap://1.2.3.4" and ldaps://1.2.3.4:123")
    self.server_uris = objectHash["serverURIs"]

    # param str user_dntemplate:  A string that is used to form a fully qualified user DN. The string should have the placeholder text %USERNAME%, which is replaced with the username of the authenticating user.
    self.user_dntemplate = objectHash["userDNTemplate"]

    # param str user_search_base_dn:  The base DN of the tree to start the search (will do a subtree search from here).
    self.user_search_base_dn = objectHash["userSearchBaseDN"]

    # param str user_search_filter:  The LDAP filter to use. The string should have the placeholder text %USERNAME% which is replaced with the username of the authenticating user. Example: (&(objectClass=person)(sAMAccountName=%USERNAME%)) will use the sAMAccountName field in Active Directory to match the username entered at cluster login.
    self.user_search_filter = objectHash["userSearchFilter"]
  end
end

class NodeStateInfo
  attr_accessor :cluster, :state

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeStateInfo
    # param str cluster: [required] Name of the cluster.
    self.cluster = objectHash["cluster"]

    # param str state: [required] <strong>Available:</strong> Node has not been configured with a cluster name.<br><strong>Pending:</strong> Node is pending for a specific named cluster and can be added.<br><strong>Active:</strong> Node is active and a member of a cluster and may not be added to another cluster.
    self.state = objectHash["state"]
  end
end

class NodeStateResult
  attr_accessor :node_id, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeStateResult
    # param Fixnum node_id: [required] ID of the node.
    self.node_id = objectHash["nodeID"]

    # param NodeStateInfo result:  NodeStateInfo object.
    self.result = objectHash["result"] ? NodeStateInfo.new(objectHash["result"]) : nil
  end
end

class GetClusterStateResult
  attr_accessor :nodes, :cluster, :state

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterStateResult
    # param NodeStateResult nodes:  Array of NodeStateResult objects for each node in the cluster.
    self.nodes = Array.new(objectHash["nodes"].length) {|i| NodeStateResult.new(objectHash["nodes"][i])}

    # param str cluster:
    self.cluster = objectHash["cluster"]

    # param str state:
    self.state = objectHash["state"]
  end
end

class EnableEncryptionAtRestResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableEncryptionAtRestResult
  end
end

class ModifyBackupTargetResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyBackupTargetResult
  end
end

class CancelClone
  attr_accessor :clone_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CancelClone
    # CancelClone enables you to stop an ongoing CloneVolume or CopyVolume process. When you cancel a group clone operation, the
    # system completes and removes the operation's associated asyncHandle.
    # param Fixnum clone_id: [required] The cloneID for the ongoing clone process.
    self.clone_id = objectHash["cloneID"]
  end
end

class GetAccountResult
  attr_accessor :account

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAccountResult
    # param Account account: [required] Account details.
    self.account = objectHash["account"] ? Account.new(objectHash["account"]) : nil
  end
end

class GetAccountByID
  attr_accessor :account_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetAccountByID
    # GetAccountByID enables you to return details about a specific account, given its accountID.
    # param Fixnum account_id: [required] Specifies the account for which details are gathered.
    self.account_id = objectHash["accountID"]
  end
end

class TestConnectEnsemble
  attr_accessor :ensemble

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectEnsemble
    # The TestConnectEnsemble API method enables you to verify connectivity with a specified database ensemble. By default, it uses the ensemble for the cluster that the node is associated with. Alternatively, you can provide a different ensemble to test connectivity with.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param str ensemble:  Uses a comma-separated list of ensemble node cluster IP addresses to test connectivity. This parameter is optional.
    self.ensemble = objectHash["ensemble"]
  end
end

class RollbackToSnapshotResult
  attr_accessor :snapshot, :snapshot_id, :checksum

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RollbackToSnapshotResult
    # param Snapshot snapshot:
    self.snapshot = objectHash["snapshot"] ? Snapshot.new(objectHash["snapshot"]) : nil

    # param Fixnum snapshot_id:  ID of the newly-created snapshot.
    self.snapshot_id = objectHash["snapshotID"]

    # param str checksum:  A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data.
    self.checksum = objectHash["checksum"]
  end
end

class GetSystemStatusResult
  attr_accessor :reboot_required

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSystemStatusResult
    # param bool reboot_required: [required]
    self.reboot_required = objectHash["rebootRequired"]
  end
end

class GetClusterHardwareInfo
  attr_accessor :type

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterHardwareInfo
    # You can use the GetClusterHardwareInfo method to retrieve the hardware status and information for all Fibre Channel nodes, iSCSI
    # nodes and drives in the cluster. This generally includes details about manufacturers, vendors, versions, and other associated hardware
    # identification information.
    # param str type:  Includes only a certain type of hardware information in the response. Possible values are: drives: List only drive information in the response. nodes: List only node information in the response. all: Include both drive and node information in the response. If this parameter is omitted, a type of "all" is assumed.
    self.type = objectHash["type"]
  end
end

class RemoveBackupTarget
  attr_accessor :backup_target_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveBackupTarget
    # RemoveBackupTarget allows you to delete backup targets.
    # param Fixnum backup_target_id: [required] The unique target ID of the target to remove.
    self.backup_target_id = objectHash["backupTargetID"]
  end
end

class CreateVolume
  attr_accessor :name, :account_id, :total_size, :enable512e, :qos, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateVolume
    # CreateVolume enables you to create a new (empty) volume on the cluster. As soon as the volume creation is complete, the volume is
    # available for connection via iSCSI.
    # param str name: [required] The name of the volume access group (might be user specified). Not required to be unique, but recommended. Might be 1 to 64 characters in length.
    self.name = objectHash["name"]

    # param Fixnum account_id: [required] AccountID for the owner of this volume.
    self.account_id = objectHash["accountID"]

    # param Fixnum total_size: [required] Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size.
    self.total_size = objectHash["totalSize"]

    # param bool enable512e: [required] Specifies whether 512e emulation is enabled or not. Possible values are: true: The volume provides 512-byte sector emulation. false: 512e emulation is not enabled.
    self.enable512e = objectHash["enable512e"]

    # param QoS qos:  Initial quality of service settings for this volume. Default values are used if none are specified. Valid settings are: minIOPS maxIOPS burstIOPS You can get the default values for a volume by using the GetDefaultQoS method.
    self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

    # param dict attributes:  The list of name-value pairs in JSON object format. Total attribute size must be less than 1000B, or 1KB, including JSON formatting characters.
    self.attributes = objectHash["attributes"]
  end
end

class CreateClusterResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateClusterResult
  end
end

class SetConfig
  attr_accessor :config

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetConfig
    # The SetConfig API method enables you to set all the configuration information for the node. This includes the same information available via calls to SetClusterConfig and SetNetworkConfig in one API method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # Caution: Changing the "bond-mode" on a node can cause a temporary loss of network connectivity. Exercise caution when using this method.
    # param Config config: [required] Objects that you want changed for the cluster interface settings.
    self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
  end
end

class ModifyVolumes
  attr_accessor :volume_ids, :account_id, :access, :qos, :total_size, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumes
    # ModifyVolumes allows you to configure up to 500 existing volumes at one time. Changes take place immediately. If ModifyVolumes fails to modify any of the specified volumes, none of the specified volumes are changed.If you do not specify QoS values when you modify volumes, the QoS values for each volume remain unchanged. You can retrieve default QoS values for a newly created volume by running the GetDefaultQoS method.When you need to increase the size of volumes that are being replicated, do so in the following order to prevent replication errors:Increase the size of the "Replication Target" volume.Increase the size of the source or "Read / Write" volume. recommends that both the target and source volumes be the same size.NOTE: If you change access status to locked or replicationTarget all existing iSCSI connections are terminated.
    # param Fixnum volume_ids: [required] A list of volumeIDs for the volumes to be modified.
    self.volume_ids = objectHash["volumeIDs"]

    # param Fixnum account_id:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used.
    self.account_id = objectHash["accountID"]

    # param str access:  Access allowed for the volume. Possible values:readOnly: Only read operations are allowed.readWrite: Reads and writes are allowed.locked: No reads or writes are allowed.If not specified, the access value does not change.replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked.If a value is not specified, the access value does not change.
    self.access = objectHash["access"]

    # param QoS qos:  New quality of service settings for this volume.If not specified, the QoS settings are not changed.
    self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

    # param Fixnum total_size:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB in size. This parameter can only be used to increase the size of a volume.
    self.total_size = objectHash["totalSize"]

    # param dict attributes:  List of name/value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListPendingNodesResult
  attr_accessor :pending_nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListPendingNodesResult
    # param PendingNode pending_nodes: [required]
    self.pending_nodes = Array.new(objectHash["pendingNodes"].length) {|i| PendingNode.new(objectHash["pendingNodes"][i])}
  end
end

class CancelGroupCloneResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CancelGroupCloneResult
  end
end

class ListActivePairedVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListActivePairedVolumesResult
    # param Volume volumes: [required] Volume information for the paired volumes.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class RestoreDeletedVolume
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RestoreDeletedVolume
    # RestoreDeletedVolume marks a deleted volume as active again. This action makes the volume immediately available for iSCSI connection.
    # param Fixnum volume_id: [required] VolumeID of the deleted volume to be restored.
    self.volume_id = objectHash["volumeID"]
  end
end

class SetNtpInfo
  attr_accessor :servers, :broadcastclient

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetNtpInfo
    # SetNtpInfo enables you to configure NTP on cluster nodes. The values you set with this interface apply to all nodes in the cluster. If an NTP broadcast server periodically broadcasts time information on your network, you can optionally configure nodes as broadcast clients.
    # Note: NetApp recommends using NTP servers that are internal to your network, rather than the installation defaults.
    # param str servers: [required] List of NTP servers to add to each nodes NTP configuration.
    self.servers = objectHash["servers"]

    # param bool broadcastclient:  Enables every node in the cluster as a broadcast client.
    self.broadcastclient = objectHash["broadcastclient"]
  end
end

class StartClusterPairingResult
  attr_accessor :cluster_pairing_key, :cluster_pair_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartClusterPairingResult
    # param str cluster_pairing_key: [required] A string of characters that is used by the "CompleteClusterPairing" API method.
    self.cluster_pairing_key = objectHash["clusterPairingKey"]

    # param Fixnum cluster_pair_id: [required] Unique identifier for the cluster pair.
    self.cluster_pair_id = objectHash["clusterPairID"]
  end
end

class RemoveVolumePairResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveVolumePairResult
  end
end

class RemoveAccount
  attr_accessor :account_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveAccount
    # RemoveAccount enables you to remove an existing account. You must delete and purge all volumes associated with the account
    # using DeleteVolume before you can remove the account. If volumes on the account are still pending deletion, you cannot use
    # RemoveAccount to remove the account.
    # param Fixnum account_id: [required] Specifies the AccountID for the account to be removed.
    self.account_id = objectHash["accountID"]
  end
end

class CreateStorageContainerResult
  attr_accessor :storage_container

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateStorageContainerResult
    # param StorageContainer storage_container: [required]
    self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil
  end
end

class DeleteGroupSnapshotResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteGroupSnapshotResult
  end
end

class ListGroupSnapshotsResult
  attr_accessor :group_snapshots

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListGroupSnapshotsResult
    # param GroupSnapshot group_snapshots: [required] List of Group Snapshots.
    self.group_snapshots = Array.new(objectHash["groupSnapshots"].length) {|i| GroupSnapshot.new(objectHash["groupSnapshots"][i])}
  end
end

class GetNvramInfo
  attr_accessor :force

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNvramInfo
    # GetNvramInfo enables you to retrieve information from each node about the NVRAM card.
    # param bool force:  Required parameter to successfully run on all nodes in the cluster.
    self.force = objectHash["force"]
  end
end

class GetVolumeEfficiencyResult
  attr_accessor :deduplication, :compression, :missing_volumes, :thin_provisioning, :timestamp

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeEfficiencyResult
    # param float compression:  The amount of space being saved by compressing data on a single volume. Stated as a ratio where "1" means data has been stored without being compressed.
    self.compression = objectHash["compression"]

    # param float deduplication: [required] The amount of space being saved on a single volume by not duplicating data. Stated as a ratio.
    self.deduplication = objectHash["deduplication"]

    # param Fixnum missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by GC being less than hour old, temporary network loss or restarted services since the GC cycle.
    self.missing_volumes = objectHash["missingVolumes"]

    # param float thin_provisioning: [required] The ratio of space used to the amount of space allocated for storing data. Stated as a ratio.
    self.thin_provisioning = objectHash["thinProvisioning"]

    # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC).
    self.timestamp = objectHash["timestamp"]
  end
end

class PendingOperation
  attr_accessor :pending, :operation

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PendingOperation
    # param bool pending: [required] true: operation is still in progress. false: operation is no integerer in progress.
    self.pending = objectHash["pending"]

    # param str operation: [required] Name of operation that is in progress or has completed.
    self.operation = objectHash["operation"]
  end
end

class GetPendingOperationResult
  attr_accessor :pending_operation

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetPendingOperationResult
    # param PendingOperation pending_operation: [required]
    self.pending_operation = objectHash["pendingOperation"] ? PendingOperation.new(objectHash["pendingOperation"]) : nil
  end
end

class CloneMultipleVolumeParams
  attr_accessor :volume_id, :access, :name, :new_account_id, :new_size, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CloneMultipleVolumeParams
    # param Fixnum volume_id: [required] Required parameter for "volumes" array: volumeID.
    self.volume_id = objectHash["volumeID"]

    # param str access:  Access settings for the new volume. readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked.  If unspecified, the access settings of the clone will be the same as the source.
    self.access = objectHash["access"]

    # param str name:  New name for the clone.
    self.name = objectHash["name"]

    # param Fixnum new_account_id:  Account ID for the new volume.
    self.new_account_id = objectHash["newAccountID"]

    # param Fixnum new_size:  New size Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size.
    self.new_size = objectHash["newSize"]

    # param dict attributes:  List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class SetNtpInfoResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetNtpInfoResult
  end
end

class GetVolumeAccessGroupEfficiency
  attr_accessor :volume_access_group_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeAccessGroupEfficiency
    # GetVolumeAccessGroupEfficiency enables you to
    # retrieve efficiency information about a volume access
    # group. Only the volume access group you provide as the
    # parameter in this API method is used to compute the
    # capacity.
    # param Fixnum volume_access_group_id: [required] The volume access group for which capacity is computed.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]
  end
end

class ModifyVolumePairResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumePairResult
  end
end

class CreateInitiator
  attr_accessor :name, :alias, :volume_access_group_id, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateInitiator
    # Object containing characteristics of each new initiator.
    # param str name: [required] (Required) The name of the initiator (IQN or WWPN) to create. (String)
    self.name = objectHash["name"]

    # param str alias:  (Optional) The friendly name to assign to this initiator. (String)
    self.alias = objectHash["alias"]

    # param Fixnum volume_access_group_id:  (Optional) The ID of the volume access group into to which this newly created initiator will be added. (Integer)
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param dict attributes:  (Optional) A set of JSON attributes assigned to this initiator. (JSON Object)
    self.attributes = objectHash["attributes"]
  end
end

class CreateInitiators
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateInitiators
    # CreateInitiators enables you to create multiple new initiator IQNs or World Wide Port Names (WWPNs) and optionally assign them
    # aliases and attributes. When you use CreateInitiators to create new initiators, you can also add them to volume access groups.
    # If CreateInitiators fails to create one of the initiators provided in the parameter, the method returns an error and does not create
    # any initiators (no partial completion is possible).
    # param CreateInitiator initiators: [required] A list of objects containing characteristics of each new initiator. Values are: name: (Required) The name of the initiator (IQN or WWPN) to create. (String) alias: (Optional) The friendly name to assign to this initiator. (String) attributes: (Optional) A set of JSON attributes to assign to this initiator. (JSON Object) volumeAccessGroupID: (Optional) The ID of the volume access group into to which this newly created initiator will be added. (Integer)
    self.initiators = Array.new(objectHash["initiators"].length) {|i| CreateInitiator.new(objectHash["initiators"][i])}
  end
end

class GetClusterFullThresholdResult
  attr_accessor :block_fullness, :fullness, :max_metadata_over_provision_factor, :metadata_fullness, :slice_reserve_used_threshold_pct, :stage2_aware_threshold, :stage2_block_threshold_bytes, :stage3_block_threshold_bytes, :stage3_block_threshold_percent, :stage3_low_threshold, :stage4_critical_threshold, :stage4_block_threshold_bytes, :stage5_block_threshold_bytes, :sum_total_cluster_bytes, :sum_total_metadata_cluster_bytes, :sum_used_cluster_bytes, :sum_used_metadata_cluster_bytes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterFullThresholdResult
    # param str block_fullness: [required] Current computed level of block fullness of the cluster. Possible values: stage1Happy: No alerts or error conditions. stage2Aware: 3 nodes of capacity available. stage3Low: 2 nodes of capacity available. stage4Critical: 1 node of capacity available. No new volumes or clones can be created. stage5CompletelyConsumed: Completely consumed. Cluster is read-only, iSCSI connection is maintained but all writes are suspended.
    self.block_fullness = objectHash["blockFullness"]

    # param str fullness: [required] Reflects the highest level of fullness between "blockFullness" and "metadataFullness".
    self.fullness = objectHash["fullness"]

    # param Fixnum max_metadata_over_provision_factor: [required] A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created.
    self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]

    # param str metadata_fullness: [required] Current computed level of metadata fullness of the cluster.
    self.metadata_fullness = objectHash["metadataFullness"]

    # param Fixnum slice_reserve_used_threshold_pct: [required] Error condition; message sent to "Alerts" if the reserved slice utilization is greater than the sliceReserveUsedThresholdPct value returned.
    self.slice_reserve_used_threshold_pct = objectHash["sliceReserveUsedThresholdPct"]

    # param Fixnum stage2_aware_threshold: [required] Awareness condition: Value that is set for "Stage 2" cluster threshold level.
    self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

    # param Fixnum stage2_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage2 condition will exist.
    self.stage2_block_threshold_bytes = objectHash["stage2BlockThresholdBytes"]

    # param Fixnum stage3_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage3 condition will exist.
    self.stage3_block_threshold_bytes = objectHash["stage3BlockThresholdBytes"]

    # param Fixnum stage3_block_threshold_percent: [required] The percent value set for stage3. At this percent full, a warning will be posted in the Alerts log.
    self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

    # param Fixnum stage3_low_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is getting low.
    self.stage3_low_threshold = objectHash["stage3LowThreshold"]

    # param Fixnum stage4_critical_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is critically low.
    self.stage4_critical_threshold = objectHash["stage4CriticalThreshold"]

    # param Fixnum stage4_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage4 condition will exist.
    self.stage4_block_threshold_bytes = objectHash["stage4BlockThresholdBytes"]

    # param Fixnum stage5_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage5 condition will exist.
    self.stage5_block_threshold_bytes = objectHash["stage5BlockThresholdBytes"]

    # param Fixnum sum_total_cluster_bytes: [required] Physical capacity of the cluster measured in bytes.
    self.sum_total_cluster_bytes = objectHash["sumTotalClusterBytes"]

    # param Fixnum sum_total_metadata_cluster_bytes: [required] Total amount of space that can be used to store metadata.
    self.sum_total_metadata_cluster_bytes = objectHash["sumTotalMetadataClusterBytes"]

    # param Fixnum sum_used_cluster_bytes: [required] Number of bytes used on the cluster.
    self.sum_used_cluster_bytes = objectHash["sumUsedClusterBytes"]

    # param Fixnum sum_used_metadata_cluster_bytes: [required] Amount of space used on volume drives to store metadata.
    self.sum_used_metadata_cluster_bytes = objectHash["sumUsedMetadataClusterBytes"]
  end
end

class ListVolumesForAccount
  attr_accessor :account_id, :start_volume_id, :limit, :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumesForAccount
    # ListVolumesForAccount returns the list of active and (pending) deleted volumes for an account.
    # param Fixnum account_id: [required] Returns all volumes owned by this AccountID.
    self.account_id = objectHash["accountID"]

    # param Fixnum start_volume_id:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID.
    self.start_volume_id = objectHash["startVolumeID"]

    # param Fixnum limit:  The maximum number of volumes to return from the API.
    self.limit = objectHash["limit"]

    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class DisableEncryptionAtRestResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DisableEncryptionAtRestResult
  end
end

class GetVolumeEfficiency
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeEfficiency
    # GetVolumeEfficiency enables you to retrieve information about a volume. Only the volume you give as a parameter in this API method is used to compute the capacity.
    # param Fixnum volume_id: [required] Specifies the volume for which capacity is computed.
    self.volume_id = objectHash["volumeID"]
  end
end

class ModifyVirtualNetwork
  attr_accessor :virtual_network_id, :virtual_network_tag, :name, :address_blocks, :netmask, :svip, :gateway, :namespace, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVirtualNetwork
    # You can use ModifyVirtualNetwork to change the attributes of an existing virtual network. This method enables you to add or remove
    # address blocks, change the netmask, or modify the name or description of the virtual network. You can also use it to enable or
    # disable namespaces, as well as add or remove a gateway if namespaces are enabled on the virtual network.
    # Note: This method requires either the VirtualNetworkID or the VirtualNetworkTag as a parameter, but not both.
    # Caution: Enabling or disabling the Routable Storage VLANs functionality for an existing virtual network by changing the
    # "namespace" parameter disrupts any traffic handled by the virtual network. NetApp strongly recommends changing the
    # "namespace" parameter only during a scheduled maintenance window.
    # param Fixnum virtual_network_id:  The unique identifier of the virtual network to modify. This is the virtual network ID assigned by the cluster.  Note: This parameter is optional but either virtualNetworkID or virtualNetworkTag must be specified with this API method.
    self.virtual_network_id = objectHash["virtualNetworkID"]

    # param Fixnum virtual_network_tag:  The network tag that identifies the virtual network to modify. Note: This parameter is optional but either virtualNetworkID or virtualNetworkTag must be specified with this API method.
    self.virtual_network_tag = objectHash["virtualNetworkTag"]

    # param str name:  The new name for the virtual network.
    self.name = objectHash["name"]

    # param AddressBlock address_blocks:  The new addressBlock to set for this virtual network. This might contain new address blocks to add to the existing object or omit unused address blocks that need to be removed. Alternatively, you can extend or reduce the size of existing address blocks. You can only increase the size of the starting addressBlocks for a virtual network object; you can never decrease it. Attributes for this parameter are: start: The start of the IP address range. (String) size: The number of IP addresses to include in the block. (Integer)
    self.address_blocks = Array.new(objectHash["addressBlocks"].length) {|i| AddressBlock.new(objectHash["addressBlocks"][i])}

    # param str netmask:  New network mask for this virtual network.
    self.netmask = objectHash["netmask"]

    # param str svip:  The storage virtual IP address for this virtual network. The svip for a virtual network cannot be changed. You must create a new virtual network to use a different svip address.
    self.svip = objectHash["svip"]

    # param str gateway:  The IP address of a gateway of the virtual network. This parameter is only valid if the "namespace" parameter is set to true.
    self.gateway = objectHash["gateway"]

    # param bool namespace:  When set to true, enables Routable Storage VLANs functionality by recreating the virtual network and configuring a namespace to contain it. When set to false, disables the VRF functionality for the virtual network. Changing this value disrupts traffic running through this virtual network.
    self.namespace = objectHash["namespace"]

    # param dict attributes:  A new list of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListVolumeStatsByVirtualVolumeResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVirtualVolumeResult
    # param VirtualVolumeStats volume_stats: [required]
    self.volume_stats = objectHash["volumeStats"]
  end
end

class ListVolumesForAccountResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumesForAccountResult
    # param Volume volumes: [required] List of volumes.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class GetNodeHardwareInfo
  attr_accessor :node_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNodeHardwareInfo
    # GetNodeHardwareInfo enables you to return all the hardware information and status for the node specified. This generally includes details about
    # manufacturers, vendors, versions, and other associated hardware identification information.
    # param Fixnum node_id: [required] The ID of the node for which hardware information is being requested. Information about a Fibre Channel node is returned if a Fibre Channel node is specified.
    self.node_id = objectHash["nodeID"]
  end
end

class SecureEraseDrives
  attr_accessor :drives

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SecureEraseDrives
    # SecureEraseDrives enables you to remove any residual data from drives that have a status of "available." You might want to use this method when replacing a drive nearing the end of its service life that contained sensitive data. This method uses a Security Erase Unit command to write a predetermined pattern to the drive and resets the encryption key on the drive. This asynchronous method might take up to two minutes to complete. You can use GetAsyncResult to check on the status of the secure erase operation.
    # You can use the ListDrives method to obtain the driveIDs for the drives you want to secure erase.
    # param Fixnum drives: [required] List of driveIDs to be secure erased.
    self.drives = objectHash["drives"]
  end
end

class DriveInfo
  attr_accessor :capacity, :drive_id, :node_id, :serial, :slot, :status, :type, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DriveInfo
    # param Fixnum capacity: [required] Total capacity of the drive, in bytes.
    self.capacity = objectHash["capacity"]

    # param Fixnum drive_id: [required] DriveID for this drive.
    self.drive_id = objectHash["driveID"]

    # param Fixnum node_id: [required] NodeID where this drive is located.
    self.node_id = objectHash["nodeID"]

    # param str serial: [required] Drive serial number.
    self.serial = objectHash["serial"]

    # param Fixnum slot: [required] Slot number in the server chassis where this drive is located, or -1 if SATADimm used for internal metadata drive.
    self.slot = objectHash["slot"]

    # param str status: [required]
    self.status = objectHash["status"]

    # param str type: [required]
    self.type = objectHash["type"]

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListDrivesResult
  attr_accessor :drives

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDrivesResult
    # param DriveInfo drives: [required] Information for the drives that are connected to the cluster.
    self.drives = Array.new(objectHash["drives"].length) {|i| DriveInfo.new(objectHash["drives"][i])}
  end
end

class VirtualVolumeBinding
  attr_accessor :protocol_endpoint_id, :protocol_endpoint_in_band_id, :protocol_endpoint_type, :virtual_volume_binding_id, :virtual_volume_host_id, :virtual_volume_id, :virtual_volume_secondary_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualVolumeBinding
    # param UUID protocol_endpoint_id: [required] The unique ID of the protocol endpoint.
    self.protocol_endpoint_id = objectHash["protocolEndpointID"] ? UUIDTools::UUID.parse(objectHash["protocolEndpointID"]) : nil

    # param str protocol_endpoint_in_band_id: [required] The scsiNAADeviceID of the protocol endpoint. For more information, see protocolEndpoint.
    self.protocol_endpoint_in_band_id = objectHash["protocolEndpointInBandID"]

    # param str protocol_endpoint_type: [required] The type of protocol endpoint. SCSI is the only value returned for the protocol endpoint type.
    self.protocol_endpoint_type = objectHash["protocolEndpointType"]

    # param Fixnum virtual_volume_binding_id: [required] The unique ID of the virtual volume binding object.
    self.virtual_volume_binding_id = objectHash["virtualVolumeBindingID"]

    # param UUID virtual_volume_host_id: [required] The unique ID of the virtual volume host.
    self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

    # param UUID virtual_volume_id: [required] The unique ID of the virtual volume.
    self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

    # param str virtual_volume_secondary_id: [required] The secondary ID of the virtual volume.
    self.virtual_volume_secondary_id = objectHash["virtualVolumeSecondaryID"]
  end
end

class ListVirtualVolumeBindingsResult
  attr_accessor :bindings

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeBindingsResult
    # param VirtualVolumeBinding bindings: [required] Describes the VVol <-> Host binding.
    self.bindings = Array.new(objectHash["bindings"].length) {|i| VirtualVolumeBinding.new(objectHash["bindings"][i])}
  end
end

class ModifyClusterAdminResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyClusterAdminResult
  end
end

class RollbackToSnapshot
  attr_accessor :volume_id, :snapshot_id, :save_current_state, :name, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RollbackToSnapshot
    # RollbackToSnapshot enables you to make an existing snapshot of the "active" volume image. This method creates a new snapshot
    # from an existing snapshot. The new snapshot becomes "active" and the existing snapshot is preserved until you delete it.
    # The previously "active" snapshot is deleted unless you set the parameter saveCurrentState to true.
    # Note: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is
    # at stage 4 or 5.
    # param Fixnum volume_id: [required] VolumeID for the volume.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum snapshot_id: [required] The ID of a previously created snapshot on the given volume.
    self.snapshot_id = objectHash["snapshotID"]

    # param bool save_current_state: [required] Specifies whether to save an active volume image or delete it. Values are: true: The previous active volume image is kept. false: (default) The previous active volume image is deleted.
    self.save_current_state = objectHash["saveCurrentState"]

    # param str name:  Name for the snapshot. If unspecified, the name of the snapshot being rolled back to is used with "- copy" appended to the end of the name.
    self.name = objectHash["name"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListVolumeStatsByVolume
  attr_accessor :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVolume
    # ListVolumeStatsByVolume returns high-level activity measurements for every volume, by volume. Values are cumulative from the
    # creation of the volume.
    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class ClusterFaultInfo
  attr_accessor :severity, :drive_ids, :network_interface, :type, :code, :details, :node_hardware_fault_id, :node_id, :service_id, :drive_id, :resolved, :cluster_fault_id, :date, :resolved_date, :data

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterFaultInfo
    # param Fixnum drive_ids:
    self.drive_ids = objectHash["driveIDs"]

    # param str network_interface:
    self.network_interface = objectHash["networkInterface"]

    # param str severity: [required]
    self.severity = objectHash["severity"]

    # param str type: [required]
    self.type = objectHash["type"]

    # param str code: [required]
    self.code = objectHash["code"]

    # param str details: [required]
    self.details = objectHash["details"]

    # param Fixnum node_hardware_fault_id: [required]
    self.node_hardware_fault_id = objectHash["nodeHardwareFaultID"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param Fixnum service_id: [required]
    self.service_id = objectHash["serviceID"]

    # param Fixnum drive_id: [required]
    self.drive_id = objectHash["driveID"]

    # param bool resolved: [required]
    self.resolved = objectHash["resolved"]

    # param Fixnum cluster_fault_id: [required]
    self.cluster_fault_id = objectHash["clusterFaultID"]

    # param str date: [required]
    self.date = objectHash["date"]

    # param str resolved_date: [required]
    self.resolved_date = objectHash["resolvedDate"]

    # param dict data:
    self.data = objectHash["data"]
  end
end

class ListClusterFaultsResult
  attr_accessor :faults

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListClusterFaultsResult
    # param ClusterFaultInfo faults: [required] The list of Cluster Fault objects.
    self.faults = Array.new(objectHash["faults"].length) {|i| ClusterFaultInfo.new(objectHash["faults"][i])}
  end
end

class AddLdapClusterAdmin
  attr_accessor :username, :access, :accept_eula, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddLdapClusterAdmin
    # AddLdapClusterAdmin enables you to add a new LDAP cluster administrator user. An LDAP cluster administrator can manage the
    # cluster via the API and management tools. LDAP cluster admin accounts are completely separate and unrelated to standard tenant
    # accounts.
    # You can also use this method to add an LDAP group that has been defined in Active Directory. The access level that is given to the group is passed to the individual users in the LDAP group.
    # param str username: [required] The distinguished user name for the new LDAP cluster admin.
    self.username = objectHash["username"]

    # param str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see the Access Control appendix in the SolidFire API Reference.
    self.access = objectHash["access"]

    # param bool accept_eula:  Accept the End User License Agreement. Set to true to add a cluster administrator account to the system. If omitted or set to false, the method call fails.
    self.accept_eula = objectHash["acceptEula"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ModifyVolumePair
  attr_accessor :volume_id, :paused_manual, :mode, :pause_limit

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumePair
    # ModifyVolumePair enables you to pause or restart replication between a pair of volumes.
    # param Fixnum volume_id: [required] The ID of the volume to be modified.
    self.volume_id = objectHash["volumeID"]

    # param bool paused_manual:  Specifies whether to pause or restart volume replication process. Valid values are:  true: Pauses volume replication false: Restarts volume replication
    self.paused_manual = objectHash["pausedManual"]

    # param str mode:  Specifies the volume replication mode. Possible values are: Async: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster. Sync: The source acknowledges the write when the data is stored locally and on the remote cluster. SnapshotsOnly: Only snapshots created on the source cluster are replicated. Active writes from the source volume are not replicated.
    self.mode = objectHash["mode"]

    # param Fixnum pause_limit:  Internal use only.
    self.pause_limit = objectHash["pauseLimit"]
  end
end

class CloneMultipleVolumes
  attr_accessor :volumes, :access, :group_snapshot_id, :new_account_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CloneMultipleVolumes
    # CloneMultipleVolumes enables you to create a clone of a group of specified volumes. You can assign a consistent set of characteristics
    # to a group of multiple volumes when they are cloned together.
    # Before using groupSnapshotID to clone the volumes in a group snapshot, you must create the group snapshot by using the
    # CreateGroupSnapshot API method or the Element OS Web UI. Using groupSnapshotID is optional when cloning multiple volumes.
    # Note: Cloning multiple volumes is allowed if cluster fullness is at stage 2 or 3. Clones are not created when cluster fullness is
    # at stage 4 or 5.
    # param CloneMultipleVolumeParams volumes: [required] Unique ID for each volume to include in the clone. If optional parameters are not specified, the values are inherited from the source volumes. Required parameter for "volumes" array: volumeID Optional parameters for "volumes" array: access: Can be one of readOnly, readWrite, locked, or replicationTarget attributes: List of name-value pairs in JSON object format. name: New name for the clone. newAccountID: Account ID for the new volumes. newSize: New size Total size of the volume, in bytes. Size is rounded up to the nearest 1MB.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| CloneMultipleVolumeParams.new(objectHash["volumes"][i])}

    # param str access:  New default access method for the new volumes if not overridden by information passed in the volume's array.
    self.access = objectHash["access"]

    # param Fixnum group_snapshot_id:  ID of the group snapshot to use as a basis for the clone.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param Fixnum new_account_id:  New account ID for the volumes if not overridden by information passed in the volumes array.
    self.new_account_id = objectHash["newAccountID"]
  end
end

class ListVolumeAccessGroups
  attr_accessor :start_volume_access_group_id, :limit

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeAccessGroups
    # ListVolumeAccessGroups enables you to return
    # information about the volume access groups that are
    # currently in the system.
    # param Fixnum start_volume_access_group_id:  The volume access group ID at which to begin the listing. If unspecified, there is no lower limit (implicitly 0).
    self.start_volume_access_group_id = objectHash["startVolumeAccessGroupID"]

    # param Fixnum limit:  The maximum number of results to return. This can be useful for paging.
    self.limit = objectHash["limit"]
  end
end

class ProtocolEndpoint
  attr_accessor :protocol_endpoint_id, :protocol_endpoint_state, :provider_type, :primary_provider_id, :secondary_provider_id, :scsi_naadevice_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ProtocolEndpoint
    # param UUID protocol_endpoint_id: [required]
    self.protocol_endpoint_id = objectHash["protocolEndpointID"] ? UUIDTools::UUID.parse(objectHash["protocolEndpointID"]) : nil

    # param str protocol_endpoint_state: [required]
    self.protocol_endpoint_state = objectHash["protocolEndpointState"]

    # param str provider_type: [required]
    self.provider_type = objectHash["providerType"]

    # param Fixnum primary_provider_id: [required]
    self.primary_provider_id = objectHash["primaryProviderID"]

    # param Fixnum secondary_provider_id: [required]
    self.secondary_provider_id = objectHash["secondaryProviderID"]

    # param str scsi_naadevice_id: [required]
    self.scsi_naadevice_id = objectHash["scsiNAADeviceID"]
  end
end

class ListProtocolEndpointsResult
  attr_accessor :protocol_endpoints

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListProtocolEndpointsResult
    # param ProtocolEndpoint protocol_endpoints: [required]
    self.protocol_endpoints = Array.new(objectHash["protocolEndpoints"].length) {|i| ProtocolEndpoint.new(objectHash["protocolEndpoints"][i])}
  end
end

class SetSnmpACLResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpACLResult
  end
end

class ListGroupSnapshots
  attr_accessor :volume_id, :group_snapshot_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListGroupSnapshots
    # ListGroupSnapshots enables you to get information about all group snapshots that have been created.
    # param Fixnum volume_id:  An array of unique volume IDs to query. If you do not specify this parameter, all group snapshots on the cluster are included.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum group_snapshot_id:  Retrieves information for a specific group snapshot ID.
    self.group_snapshot_id = objectHash["groupSnapshotID"]
  end
end

class EnableFeature
  attr_accessor :feature

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableFeature
    # You can use EnableFeature to enable cluster features that are disabled by default.
    # param str feature: [required] Indicates which feature to enable. Valid value is: vvols: Enable the NetApp SolidFire VVols cluster feature.
    self.feature = objectHash["feature"]
  end
end

class SnmpNetwork
  attr_accessor :access, :cidr, :community, :network

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnmpNetwork
    # The SNMP network object contains information about SNMP configuration for the cluster nodes. SNMP v3 is supported on SolidFire clusters.
    # param str access: [required] ro: read-only access.* rw: for read-write access. rosys: for read-only access to a restricted set of system information *SolidFire recommends that all networks other than the default "localhost" be set to "ro" access, because all SolidFire MIB objects are read-only.
    self.access = objectHash["access"]

    # param Fixnum cidr: [required] A CIDR network mask. This network mask must be an integer greater than or equal to 0, and less than or equal to 32. It must also not be equal to 31.
    self.cidr = objectHash["cidr"]

    # param str community: [required] SNMP community string.
    self.community = objectHash["community"]

    # param str network: [required] This parameter ainteger with the cidr variable is used to control which network the access and community string apply to. The special value of "default" is used to specify an entry that applies to all networks. The cidr mask is ignored when network value is either a host name or default.
    self.network = objectHash["network"]
  end
end

class RemoveNodes
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveNodes
    # You can use RemoveNodes to remove one or more nodes that should no longer participate in the cluster. Before removing a node, you must remove all drives the node contains using the RemoveDrives method. You cannot remove a node until the RemoveDrives process has completed and all data has been migrated away from the node.
    # After you remove a node, it registers itself as a pending node. You can add the node again or shut it down (shutting the node down removes it from the Pending Node list).
    # param Fixnum nodes: [required] List of NodeIDs for the nodes to be removed.
    self.nodes = objectHash["nodes"]
  end
end

class DeleteGroupSnapshot
  attr_accessor :group_snapshot_id, :save_members

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteGroupSnapshot
    # DeleteGroupSnapshot enables you to delete a group snapshot. You can use the saveMembers parameter to preserve all the snapshots that were made for the volumes in the group, but the group association is removed.
    # param Fixnum group_snapshot_id: [required] Specifies the unique ID of the group snapshot.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param bool save_members: [required] Specifies whether to preserve snapshots or delete them. Valid values are: true: Snapshots are preserved, but group association is removed. false: The group and snapshots are deleted.
    self.save_members = objectHash["saveMembers"]
  end
end

class ModifySnapshotResult
  attr_accessor :snapshot

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifySnapshotResult
    # param Snapshot snapshot:
    self.snapshot = objectHash["snapshot"] ? Snapshot.new(objectHash["snapshot"]) : nil
  end
end

class RemoveVolumesFromVolumeAccessGroup
  attr_accessor :volume_access_group_id, :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveVolumesFromVolumeAccessGroup
    # The RemoveVolumeFromVolumeAccessGroup method enables you to remove volumes from a volume access group.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group to remove volumes from.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param Fixnum volumes: [required] The ID of the volume access group to remove volumes from.
    self.volumes = objectHash["volumes"]
  end
end

class ModifyStorageContainer
  attr_accessor :storage_container_id, :initiator_secret, :target_secret

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyStorageContainer
    # ModifyStorageContainer enables you to make changes to an existing virtual volume storage container.
    # param UUID storage_container_id: [required] The unique ID of the virtual volume storage container to modify.
    self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

    # param str initiator_secret:  The new secret for CHAP authentication for the initiator.
    self.initiator_secret = objectHash["initiatorSecret"]

    # param str target_secret:  The new secret for CHAP authentication for the target.
    self.target_secret = objectHash["targetSecret"]
  end
end

class TestConnectMvipDetails
  attr_accessor :ping_bytes, :mvip, :connected

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectMvipDetails
    # param dict ping_bytes: [required] Details of the ping tests with 56 Bytes and 1500 Bytes.
    self.ping_bytes = objectHash["pingBytes"]

    # param str mvip: [required] The MVIP tested against.
    self.mvip = objectHash["mvip"]

    # param bool connected: [required] Whether the test could connect to the MVIP.
    self.connected = objectHash["connected"]
  end
end

class TestConnectMvipResult
  attr_accessor :details, :duration, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectMvipResult
    # param TestConnectMvipDetails details: [required] Information about the test operation
    self.details = objectHash["details"] ? TestConnectMvipDetails.new(objectHash["details"]) : nil

    # param str duration: [required] The length of time required to run the test.
    self.duration = objectHash["duration"]

    # param str result: [required] The results of the entire test
    self.result = objectHash["result"]
  end
end

class ClearClusterFaultsResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClearClusterFaultsResult
  end
end

class TestConnectSvipDetails
  attr_accessor :ping_bytes, :svip, :connected

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectSvipDetails
    # param dict ping_bytes: [required] Details of the ping tests with 56 Bytes and 1500 Bytes.
    self.ping_bytes = objectHash["pingBytes"]

    # param str svip: [required] The SVIP tested against.
    self.svip = objectHash["svip"]

    # param bool connected: [required] Whether the test could connect to the MVIP.
    self.connected = objectHash["connected"]
  end
end

class TestConnectSvipResult
  attr_accessor :details, :duration, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectSvipResult
    # param TestConnectSvipDetails details: [required] Information about the test operation
    self.details = objectHash["details"] ? TestConnectSvipDetails.new(objectHash["details"]) : nil

    # param str duration: [required] The length of time required to run the test.
    self.duration = objectHash["duration"]

    # param str result: [required] The results of the entire test
    self.result = objectHash["result"]
  end
end

class ListVolumeStatsByVolumeResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVolumeResult
    # param VolumeStats volume_stats: [required] List of account activity information.
    self.volume_stats = Array.new(objectHash["volumeStats"].length) {|i| VolumeStats.new(objectHash["volumeStats"][i])}
  end
end

class SnmpV3UsmUser
  attr_accessor :access, :name, :password, :passphrase, :sec_level

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnmpV3UsmUser
    # The SNMP v3 usmUser object is used with the API method SetSnmpInfo to configure SNMP on the cluster.
    # param str access: [required] rouser: read-only access.* rwuser: for read-write access. rosys: for read-only access to a restricted set of system information *SolidFire recommends that all USM users be set to "rouser" access, because all SolidFire MIB objects are read-only.
    self.access = objectHash["access"]

    # param str name: [required] The name of the user. Must contain at least one character, but no more than 32 characters. Blank spaces are not allowed.
    self.name = objectHash["name"]

    # param str password: [required] The password of the user. Must be between 8 and 255 characters integer (inclusive). Blank spaces are not allowed. Required if "secLevel" is "auth" or "priv."
    self.password = objectHash["password"]

    # param str passphrase: [required] The passphrase of the user. Must be between 8 and 255 characters integer (inclusive). Blank spaces are not allowed. Required if "secLevel" is "priv."
    self.passphrase = objectHash["passphrase"]

    # param str sec_level: [required] noauth: No password or passphrase is required. auth: A password is required for user access. priv: A password and passphrase is required for user access.
    self.sec_level = objectHash["secLevel"]
  end
end

class GetSnmpInfoResult
  attr_accessor :enabled, :networks, :snmp_v3_enabled, :usm_users

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSnmpInfoResult
    # param SnmpNetwork networks:  List of networks and access types enabled for SNMP.  Note: "networks" will only be present if SNMP V3 is disabled.
    self.networks = Array.new(objectHash["networks"].length) {|i| SnmpNetwork.new(objectHash["networks"][i])}

    # param bool enabled: [required] If the nodes in the cluster are configured for SNMP.
    self.enabled = objectHash["enabled"]

    # param bool snmp_v3_enabled: [required] If the nodes in the cluster are configured for SNMP v3.
    self.snmp_v3_enabled = objectHash["snmpV3Enabled"]

    # param SnmpV3UsmUser usm_users:  If SNMP v3 is enabled, the values returned is a list of user access parameters for SNMP information from the cluster. This will be returned instead of the "networks" parameter.
    self.usm_users = Array.new(objectHash["usmUsers"].length) {|i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
  end
end

class ModifyVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumesResult
    # param Volume volumes: [required]
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class RestartNetworking
  attr_accessor :force

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RestartNetworking
    # The RestartNetworking API method enables you to restart the networking services on a node.
    # Warning: This method restarts all networking services on a node, causing temporary loss of networking connectivity.
    # Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param bool force: [required] Required parameter to successfully reset the node.
    self.force = objectHash["force"]
  end
end

class ListNodeFibreChannelPortInfoResult
  attr_accessor :fibre_channel_ports

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListNodeFibreChannelPortInfoResult
    # List of fibre channel port info results grouped by node.
    # param FibreChannelPortInfo fibre_channel_ports: [required] List of all physical Fibre Channel ports.
    self.fibre_channel_ports = Array.new(objectHash["fibreChannelPorts"].length) {|i| FibreChannelPortInfo.new(objectHash["fibreChannelPorts"][i])}
  end
end

class CreateSupportBundle
  attr_accessor :bundle_name, :extra_args, :timeout_sec

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateSupportBundle
    # CreateSupportBundle enables you to create a support bundle file under the node's directory. After creation, the bundle is stored on the node as a tar.gz file.
    # param str bundle_name:  The unique name for the support bundle. If no name is provided, "supportbundle" and the node name are used as the filename.
    self.bundle_name = objectHash["bundleName"]

    # param str extra_args:  Passed to the sf_make_support_bundle script. You should use this parameter only at the request of NetApp SolidFire Support.
    self.extra_args = objectHash["extraArgs"]

    # param Fixnum timeout_sec:  The number of seconds to allow the support bundle script to run before stopping. The default value is 1500 seconds.
    self.timeout_sec = objectHash["timeoutSec"]
  end
end

class DriveStats
  attr_accessor :failed_die_count, :active_sessions, :drive_id, :life_remaining_percent, :lifetime_read_bytes, :lifetime_write_bytes, :power_on_hours, :read_bytes, :read_ops, :reallocated_sectors, :reserve_capacity_percent, :timestamp, :total_capacity, :used_capacity, :used_memory, :write_bytes, :write_ops

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DriveStats
    # param Fixnum active_sessions:
    self.active_sessions = objectHash["activeSessions"]

    # param Fixnum drive_id:
    self.drive_id = objectHash["driveID"]

    # param Fixnum failed_die_count: [required]
    self.failed_die_count = objectHash["failedDieCount"]

    # param Fixnum life_remaining_percent: [required]
    self.life_remaining_percent = objectHash["lifeRemainingPercent"]

    # param Fixnum lifetime_read_bytes: [required]
    self.lifetime_read_bytes = objectHash["lifetimeReadBytes"]

    # param Fixnum lifetime_write_bytes: [required]
    self.lifetime_write_bytes = objectHash["lifetimeWriteBytes"]

    # param Fixnum power_on_hours: [required]
    self.power_on_hours = objectHash["powerOnHours"]

    # param Fixnum read_bytes: [required]
    self.read_bytes = objectHash["readBytes"]

    # param Fixnum read_ops: [required]
    self.read_ops = objectHash["readOps"]

    # param Fixnum reallocated_sectors: [required]
    self.reallocated_sectors = objectHash["reallocatedSectors"]

    # param Fixnum reserve_capacity_percent: [required]
    self.reserve_capacity_percent = objectHash["reserveCapacityPercent"]

    # param str timestamp: [required]
    self.timestamp = objectHash["timestamp"]

    # param Fixnum total_capacity: [required]
    self.total_capacity = objectHash["totalCapacity"]

    # param Fixnum used_capacity:
    self.used_capacity = objectHash["usedCapacity"]

    # param Fixnum used_memory: [required]
    self.used_memory = objectHash["usedMemory"]

    # param Fixnum write_bytes: [required]
    self.write_bytes = objectHash["writeBytes"]

    # param Fixnum write_ops: [required]
    self.write_ops = objectHash["writeOps"]
  end
end

class GetDriveStatsResult
  attr_accessor :drive_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetDriveStatsResult
    # param DriveStats drive_stats: [required]
    self.drive_stats = objectHash["driveStats"] ? DriveStats.new(objectHash["driveStats"]) : nil
  end
end

class ModifyVolumeAccessGroupLunAssignments
  attr_accessor :volume_access_group_id, :lun_assignments

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumeAccessGroupLunAssignments
    # The ModifyVolumeAccessGroupLunAssignments
    # method enables you to define custom LUN assignments
    # for specific volumes. This method changes only LUN
    # values set on the lunAssignments parameter in the
    # volume access group. All other LUN assignments remain
    # unchanged. LUN assignment values must be unique for volumes in a volume access group. You cannot define duplicate LUN values within a volume access group. However, you can use the same LUN values again in different volume access groups.
    # Note: Correct LUN values are 0 through 16383. The system generates an exception if you pass a LUN value outside of this range. None of the specified LUN assignments are modified if there is an exception.
    # Caution: If you change a LUN assignment for a volume with active I/O, the I/O can be disrupted. You might need to change the server configuration before changing volume LUN assignments.
    # param Fixnum volume_access_group_id: [required] The ID of the volume access group for which the LUN assignments will be modified.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]

    # param LunAssignment lun_assignments: [required] The volume IDs with new assigned LUN values.
    self.lun_assignments = Array.new(objectHash["lunAssignments"].length) {|i| LunAssignment.new(objectHash["lunAssignments"][i])}
  end
end

class StartBulkVolumeReadResult
  attr_accessor :async_handle, :key, :url

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartBulkVolumeReadResult
    # param Fixnum async_handle: [required] ID of the async process to be checked for completion.
    self.async_handle = objectHash["asyncHandle"]

    # param str key: [required] Opaque key uniquely identifying the session.
    self.key = objectHash["key"]

    # param str url: [required] URL to access the node's web server
    self.url = objectHash["url"]
  end
end

class GetNetworkConfigResult
  attr_accessor :network

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNetworkConfigResult
    # param Network network: [required]
    self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
  end
end

class ListVolumeStatsByVolumeAccessGroup
  attr_accessor :volume_access_groups, :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByVolumeAccessGroup
    # ListVolumeStatsByVolumeAccessGroup enables you to get total activity measurements for all of the volumes that are a member of the
    # specified volume access group(s).
    # param Fixnum volume_access_groups:  An array of VolumeAccessGroupIDs for which volume activity is returned. If omitted, statistics for all volume access groups are returned.
    self.volume_access_groups = objectHash["volumeAccessGroups"]

    # param bool include_virtual_volumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class UpdateBulkVolumeStatusResult
  attr_accessor :status, :url, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # UpdateBulkVolumeStatusResult
    # param str status: [required] Status of the session requested. Returned status: preparing active done failed
    self.status = objectHash["status"]

    # param str url: [required] The URL to access the node's web server provided only if the session is still active.
    self.url = objectHash["url"]

    # param dict attributes: [required] Returns attributes that were specified in the BulkVolumeStatusUpdate method. Values are returned if they have changed or not.
    self.attributes = objectHash["attributes"]
  end
end

class EnableSnmpResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableSnmpResult
  end
end

class FibreChannelSession
  attr_accessor :initiator_wwpn, :node_id, :service_id, :target_wwpn, :volume_access_group_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # FibreChannelSession
    # FibreChannelSession contains information about each Fibre Channel session that is visible to the cluster and what target ports it is visible on.
    # param str initiator_wwpn: [required] The WWPN of the initiator which is logged into the target port.
    self.initiator_wwpn = objectHash["initiatorWWPN"]

    # param Fixnum node_id: [required] The node owning the Fibre Channel session.
    self.node_id = objectHash["nodeID"]

    # param Fixnum service_id: [required] The service ID of the FService owning this Fibre Channel session
    self.service_id = objectHash["serviceID"]

    # param str target_wwpn: [required] The WWPN of the target port involved in this session.
    self.target_wwpn = objectHash["targetWWPN"]

    # param Fixnum volume_access_group_id:  The ID of the volume access group to which the initiatorWWPN beintegers. If not in a volume access group, the value will be null.
    self.volume_access_group_id = objectHash["volumeAccessGroupID"]
  end
end

class ListFibreChannelSessionsResult
  attr_accessor :sessions

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListFibreChannelSessionsResult
    # Used to return information about the Fibre Channel sessions.
    # param FibreChannelSession sessions: [required] A list of FibreChannelSession objects with information about the Fibre Channel session.
    self.sessions = Array.new(objectHash["sessions"].length) {|i| FibreChannelSession.new(objectHash["sessions"][i])}
  end
end

class VirtualVolumeTask
  attr_accessor :virtual_volume_task_id, :virtualvolume_id, :clone_virtual_volume_id, :status, :operation, :virtual_volume_host_id, :parent_metadata, :parent_total_size, :parent_used_size, :cancelled

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # VirtualVolumeTask
    # param UUID virtual_volume_task_id: [required]
    self.virtual_volume_task_id = objectHash["virtualVolumeTaskID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeTaskID"]) : nil

    # param UUID virtualvolume_id: [required]
    self.virtualvolume_id = objectHash["virtualvolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualvolumeID"]) : nil

    # param UUID clone_virtual_volume_id: [required]
    self.clone_virtual_volume_id = objectHash["cloneVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["cloneVirtualVolumeID"]) : nil

    # param str status: [required]
    self.status = objectHash["status"]

    # param str operation: [required]
    self.operation = objectHash["operation"]

    # param UUID virtual_volume_host_id: [required]
    self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

    # param dict parent_metadata: [required]
    self.parent_metadata = objectHash["parentMetadata"]

    # param Fixnum parent_total_size: [required]
    self.parent_total_size = objectHash["parentTotalSize"]

    # param Fixnum parent_used_size: [required]
    self.parent_used_size = objectHash["parentUsedSize"]

    # param bool cancelled: [required]
    self.cancelled = objectHash["cancelled"]
  end
end

class ListVirtualVolumeTasksResult
  attr_accessor :tasks

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeTasksResult
    # param VirtualVolumeTask tasks: [required] List of VVol Async Tasks.
    self.tasks = Array.new(objectHash["tasks"].length) {|i| VirtualVolumeTask.new(objectHash["tasks"][i])}
  end
end

class PurgeDeletedVolumes
  attr_accessor :volume_ids, :account_ids, :volume_access_group_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PurgeDeletedVolumes
    # PurgeDeletedVolumes immediately and permanently purges volumes that have been deleted; you can use this method to purge up to 500 volumes at one time. You must delete volumes using DeleteVolumes before they can be purged. Volumes are purged by the system automatically after a period of time, so usage of this method is not typically required.
    # param Fixnum volume_ids:  A list of volumeIDs of volumes to be purged from the system.
    self.volume_ids = objectHash["volumeIDs"]

    # param Fixnum account_ids:  A list of accountIDs. All of the volumes from all of the specified accounts are purged from the system.
    self.account_ids = objectHash["accountIDs"]

    # param Fixnum volume_access_group_ids:  A list of volumeAccessGroupIDs. All of the volumes from all of the specified Volume Access Groups are purged from the system.
    self.volume_access_group_ids = objectHash["volumeAccessGroupIDs"]
  end
end

class GetClusterConfigResult
  attr_accessor :cluster

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterConfigResult
    # param ClusterConfig cluster: [required] Cluster configuration information the node uses to communicate with the cluster.
    self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
  end
end

class GetVolumeStatsResult
  attr_accessor :volume_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetVolumeStatsResult
    # param VolumeStats volume_stats: [required] Volume activity information.
    self.volume_stats = objectHash["volumeStats"] ? VolumeStats.new(objectHash["volumeStats"]) : nil
  end
end

class ClusterHardwareInfo
  attr_accessor :drives, :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterHardwareInfo
    # param DriveHardwareInfo drives: [required]
    self.drives = Hash[*objectHash["drives"].map {|k, obj| [k, DriveHardwareInfo.new(obj)]}.flatten]

    # param dict nodes: [required]
    self.nodes = objectHash["nodes"]
  end
end

class GetClusterHardwareInfoResult
  attr_accessor :cluster_hardware_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterHardwareInfoResult
    # param ClusterHardwareInfo cluster_hardware_info: [required] Hardware information for all nodes and drives in the cluster. Each object in this output is labeled with the nodeID of the given node.
    self.cluster_hardware_info = objectHash["clusterHardwareInfo"] ? ClusterHardwareInfo.new(objectHash["clusterHardwareInfo"]) : nil
  end
end

class SupportBundleDetails
  attr_accessor :bundle_name, :extra_args, :files, :url, :output, :timeout_sec

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SupportBundleDetails
    # param str bundle_name: [required] The name specified in the 'CreateSupportBundle API method. If no name was specified, 'supportbundle' will be used.
    self.bundle_name = objectHash["bundleName"]

    # param str extra_args: [required] The arguments passed with this method.
    self.extra_args = objectHash["extraArgs"]

    # param str files: [required] A list of the support bundle files that were created.
    self.files = objectHash["files"]

    # param str url: [required] The URL that you can use to download the bundle file(s). Should correspond 1:1 with files list.
    self.url = objectHash["url"]

    # param str output: [required] The commands that were run and their output, with newlines replaced by HTML <br> elements.
    self.output = objectHash["output"]

    # param Fixnum timeout_sec: [required] The timeout specified for the support bundle creation process.
    self.timeout_sec = objectHash["timeoutSec"]
  end
end

class CreateSupportBundleResult
  attr_accessor :details, :duration, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateSupportBundleResult
    # param SupportBundleDetails details: [required] The details of the support bundle.
    self.details = objectHash["details"] ? SupportBundleDetails.new(objectHash["details"]) : nil

    # param str duration: [required] The amount of time required to create the support bundle in the format HH:MM:SS.ssssss
    self.duration = objectHash["duration"]

    # param str result: [required] Whether the support bundle creation passed of failed.
    self.result = objectHash["result"]
  end
end

class SetDefaultQoSResult
  attr_accessor :min_iops, :max_iops, :burst_iops

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetDefaultQoSResult
    # param Fixnum min_iops: [required] The minimum number of sustained IOPS that are provided by the cluster to a volume.
    self.min_iops = objectHash["minIOPS"]

    # param Fixnum max_iops: [required] The maximum number of sustained IOPS that are provided by the cluster to a volume.
    self.max_iops = objectHash["maxIOPS"]

    # param Fixnum burst_iops: [required] The maximum number of IOPS allowed in a short burst scenario.
    self.burst_iops = objectHash["burstIOPS"]
  end
end

class SetSnmpInfo
  attr_accessor :networks, :enabled, :snmp_v3_enabled, :usm_users

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpInfo
    # SetSnmpInfo enables you to configure SNMP version 2 and version 3 on cluster nodes. The values you set with this interface apply to
    # all nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpInfo.
    # Note: SetSnmpInfo is deprecated. Use the EnableSnmp and SetSnmpACL methods instead.
    # param SnmpNetwork networks:  List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See the SNMP Network Object for possible "networks" values. This parameter is required only for SNMP v2.
    self.networks = Array.new(objectHash["networks"].length) {|i| SnmpNetwork.new(objectHash["networks"][i])}

    # param bool enabled:  If set to true, SNMP is enabled on each node in the cluster.
    self.enabled = objectHash["enabled"]

    # param bool snmp_v3_enabled:  If set to true, SNMP v3 is enabled on each node in the cluster.
    self.snmp_v3_enabled = objectHash["snmpV3Enabled"]

    # param SnmpV3UsmUser usm_users:  If SNMP v3 is enabled, this value must be passed in place of the networks parameter. This parameter is required only for SNMP v3.
    self.usm_users = Array.new(objectHash["usmUsers"].length) {|i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
  end
end

class ListStorageContainers
  attr_accessor :storage_container_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListStorageContainers
    # ListStorageContainers enables you to retrieve information about all virtual volume storage containers known to the system.
    # param UUID storage_container_ids:  A list of storage container IDs for which to retrieve information. If you omit this parameter, the method returns information about all storage containers in the system.
    self.storage_container_ids = Array.new(objectHash["storageContainerIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["storageContainerIDs"][i])}
  end
end

class GetHardwareInfoResult
  attr_accessor :hardware_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetHardwareInfoResult
    # param dict hardware_info: [required] Hardware information for this node.
    self.hardware_info = objectHash["hardwareInfo"]
  end
end

class ListDriveStatsResult
  attr_accessor :drive_stats, :errors

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDriveStatsResult
    # param DriveStats drive_stats: [required] List of drive activity information for each drive.
    self.drive_stats = Array.new(objectHash["driveStats"].length) {|i| DriveStats.new(objectHash["driveStats"][i])}

    # param dict errors: [required] If there are errors retrieving information about a drive, this list contains the driveID and associated error message. Always present, and empty if there are no errors.
    self.errors = objectHash["errors"]
  end
end

class ModifyVolumeAccessGroupResult
  attr_accessor :volume_access_group

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumeAccessGroupResult
    # param VolumeAccessGroup volume_access_group: [required] An object containing information about the newly modified volume access group.
    self.volume_access_group = objectHash["volumeAccessGroup"] ? VolumeAccessGroup.new(objectHash["volumeAccessGroup"]) : nil
  end
end

class LoginSessionInfo
  attr_accessor :timeout

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # LoginSessionInfo
    # param str timeout: [required]
    self.timeout = objectHash["timeout"]
  end
end

class GetLoginSessionInfoResult
  attr_accessor :login_session_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetLoginSessionInfoResult
    # param LoginSessionInfo login_session_info: [required] The authentication expiration period. Formatted in H:mm:ss. For example: 1:30:00, 20:00, 5:00. All leading zeros and colons are removed regardless of the format the timeout was entered. Objects returned are: timeout - The time, in minutes, when this session will timeout and expire.
    self.login_session_info = objectHash["loginSessionInfo"] ? LoginSessionInfo.new(objectHash["loginSessionInfo"]) : nil
  end
end

class ListClusterAdminsResult
  attr_accessor :cluster_admins

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListClusterAdminsResult
    # param ClusterAdmin cluster_admins: [required] Information about the cluster admin.
    self.cluster_admins = Array.new(objectHash["clusterAdmins"].length) {|i| ClusterAdmin.new(objectHash["clusterAdmins"][i])}
  end
end

class GetNodeStatsResult
  attr_accessor :node_stats

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNodeStatsResult
    # param NodeStatsInfo node_stats: [required] Node activity information.
    self.node_stats = objectHash["nodeStats"] ? NodeStatsInfo.new(objectHash["nodeStats"]) : nil
  end
end

class CreateInitiatorsResult
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateInitiatorsResult
    # param Initiator initiators: [required] List of objects containing details about the newly created initiators
    self.initiators = Array.new(objectHash["initiators"].length) {|i| Initiator.new(objectHash["initiators"][i])}
  end
end

class GetRemoteLoggingHostsResult
  attr_accessor :remote_hosts

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetRemoteLoggingHostsResult
    # param LoggingServer remote_hosts: [required] List of hosts to forward logging information to.
    self.remote_hosts = Array.new(objectHash["remoteHosts"].length) {|i| LoggingServer.new(objectHash["remoteHosts"][i])}
  end
end

class RemoveClusterPairResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveClusterPairResult
  end
end

class ListVolumesResult
  attr_accessor :volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumesResult
    # param Volume volumes: [required] List of volumes.
    self.volumes = Array.new(objectHash["volumes"].length) {|i| Volume.new(objectHash["volumes"][i])}
  end
end

class GetEfficiencyResult
  attr_accessor :timestamp, :compression, :deduplication, :thin_provisioning, :missing_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetEfficiencyResult
    # param float compression:  The amount of space being saved by compressing data on a single volume. Stated as a ratio where "1" means data has been stored without being compressed.
    self.compression = objectHash["compression"]

    # param float deduplication:  The amount of space being saved on a single volume by not duplicating data. Stated as a ratio.
    self.deduplication = objectHash["deduplication"]

    # param float thin_provisioning:  The ratio of space used to the amount of space allocated for storing data. Stated as a ratio.
    self.thin_provisioning = objectHash["thinProvisioning"]

    # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC). ISO 8601 data string.
    self.timestamp = objectHash["timestamp"]

    # param Fixnum missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by GC being less than hour old, temporary network loss or restarted services since the GC cycle.
    self.missing_volumes = objectHash["missingVolumes"]
  end
end

class GetLimitsResult
  attr_accessor :account_count_max, :account_name_length_max, :account_name_length_min, :bulk_volume_jobs_per_node_max, :bulk_volume_jobs_per_volume_max, :clone_jobs_per_volume_max, :cluster_pairs_count_max, :initiator_name_length_max, :initiator_count_max, :initiators_per_volume_access_group_count_max, :iscsi_sessions_from_fibre_channel_nodes_max, :secret_length_max, :secret_length_min, :snapshot_name_length_max, :snapshots_per_volume_max, :volume_access_group_count_max, :volume_access_group_lun_max, :volume_access_group_name_length_max, :volume_access_group_name_length_min, :volume_access_groups_per_initiator_count_max, :volume_access_groups_per_volume_count_max, :initiator_alias_length_max, :volume_burst_iopsmax, :volume_burst_iopsmin, :volume_count_max, :volume_max_iopsmax, :volume_max_iopsmin, :volume_min_iopsmax, :volume_min_iopsmin, :volume_name_length_max, :volume_name_length_min, :volume_size_max, :volume_size_min, :volumes_per_account_count_max, :volumes_per_group_snapshot_max, :volumes_per_volume_access_group_count_max, :cluster_admin_account_max, :fibre_channel_volume_access_max, :virtual_volumes_per_account_count_max, :virtual_volume_count_max

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetLimitsResult
    # Limits for the cluster
    # param Fixnum account_count_max: [required]
    self.account_count_max = objectHash["accountCountMax"]

    # param Fixnum account_name_length_max: [required]
    self.account_name_length_max = objectHash["accountNameLengthMax"]

    # param Fixnum account_name_length_min: [required]
    self.account_name_length_min = objectHash["accountNameLengthMin"]

    # param Fixnum bulk_volume_jobs_per_node_max: [required]
    self.bulk_volume_jobs_per_node_max = objectHash["bulkVolumeJobsPerNodeMax"]

    # param Fixnum bulk_volume_jobs_per_volume_max: [required]
    self.bulk_volume_jobs_per_volume_max = objectHash["bulkVolumeJobsPerVolumeMax"]

    # param Fixnum clone_jobs_per_volume_max: [required]
    self.clone_jobs_per_volume_max = objectHash["cloneJobsPerVolumeMax"]

    # param Fixnum cluster_pairs_count_max: [required]
    self.cluster_pairs_count_max = objectHash["clusterPairsCountMax"]

    # param Fixnum initiator_name_length_max: [required]
    self.initiator_name_length_max = objectHash["initiatorNameLengthMax"]

    # param Fixnum initiator_count_max: [required]
    self.initiator_count_max = objectHash["initiatorCountMax"]

    # param Fixnum initiators_per_volume_access_group_count_max: [required]
    self.initiators_per_volume_access_group_count_max = objectHash["initiatorsPerVolumeAccessGroupCountMax"]

    # param Fixnum iscsi_sessions_from_fibre_channel_nodes_max: [required]
    self.iscsi_sessions_from_fibre_channel_nodes_max = objectHash["iscsiSessionsFromFibreChannelNodesMax"]

    # param Fixnum secret_length_max: [required]
    self.secret_length_max = objectHash["secretLengthMax"]

    # param Fixnum secret_length_min: [required]
    self.secret_length_min = objectHash["secretLengthMin"]

    # param Fixnum snapshot_name_length_max: [required]
    self.snapshot_name_length_max = objectHash["snapshotNameLengthMax"]

    # param Fixnum snapshots_per_volume_max: [required]
    self.snapshots_per_volume_max = objectHash["snapshotsPerVolumeMax"]

    # param Fixnum volume_access_group_count_max: [required]
    self.volume_access_group_count_max = objectHash["volumeAccessGroupCountMax"]

    # param Fixnum volume_access_group_lun_max: [required]
    self.volume_access_group_lun_max = objectHash["volumeAccessGroupLunMax"]

    # param Fixnum volume_access_group_name_length_max: [required]
    self.volume_access_group_name_length_max = objectHash["volumeAccessGroupNameLengthMax"]

    # param Fixnum volume_access_group_name_length_min: [required]
    self.volume_access_group_name_length_min = objectHash["volumeAccessGroupNameLengthMin"]

    # param Fixnum volume_access_groups_per_initiator_count_max: [required]
    self.volume_access_groups_per_initiator_count_max = objectHash["volumeAccessGroupsPerInitiatorCountMax"]

    # param Fixnum volume_access_groups_per_volume_count_max: [required]
    self.volume_access_groups_per_volume_count_max = objectHash["volumeAccessGroupsPerVolumeCountMax"]

    # param Fixnum initiator_alias_length_max: [required]
    self.initiator_alias_length_max = objectHash["initiatorAliasLengthMax"]

    # param Fixnum volume_burst_iopsmax: [required]
    self.volume_burst_iopsmax = objectHash["volumeBurstIOPSMax"]

    # param Fixnum volume_burst_iopsmin: [required]
    self.volume_burst_iopsmin = objectHash["volumeBurstIOPSMin"]

    # param Fixnum volume_count_max: [required]
    self.volume_count_max = objectHash["volumeCountMax"]

    # param Fixnum volume_max_iopsmax: [required]
    self.volume_max_iopsmax = objectHash["volumeMaxIOPSMax"]

    # param Fixnum volume_max_iopsmin: [required]
    self.volume_max_iopsmin = objectHash["volumeMaxIOPSMin"]

    # param Fixnum volume_min_iopsmax: [required]
    self.volume_min_iopsmax = objectHash["volumeMinIOPSMax"]

    # param Fixnum volume_min_iopsmin: [required]
    self.volume_min_iopsmin = objectHash["volumeMinIOPSMin"]

    # param Fixnum volume_name_length_max: [required]
    self.volume_name_length_max = objectHash["volumeNameLengthMax"]

    # param Fixnum volume_name_length_min: [required]
    self.volume_name_length_min = objectHash["volumeNameLengthMin"]

    # param Fixnum volume_size_max: [required]
    self.volume_size_max = objectHash["volumeSizeMax"]

    # param Fixnum volume_size_min: [required]
    self.volume_size_min = objectHash["volumeSizeMin"]

    # param Fixnum volumes_per_account_count_max: [required]
    self.volumes_per_account_count_max = objectHash["volumesPerAccountCountMax"]

    # param Fixnum volumes_per_group_snapshot_max: [required]
    self.volumes_per_group_snapshot_max = objectHash["volumesPerGroupSnapshotMax"]

    # param Fixnum volumes_per_volume_access_group_count_max: [required]
    self.volumes_per_volume_access_group_count_max = objectHash["volumesPerVolumeAccessGroupCountMax"]

    # param Fixnum cluster_admin_account_max:
    self.cluster_admin_account_max = objectHash["clusterAdminAccountMax"]

    # param Fixnum fibre_channel_volume_access_max:
    self.fibre_channel_volume_access_max = objectHash["fibreChannelVolumeAccessMax"]

    # param Fixnum virtual_volumes_per_account_count_max:
    self.virtual_volumes_per_account_count_max = objectHash["virtualVolumesPerAccountCountMax"]

    # param Fixnum virtual_volume_count_max:
    self.virtual_volume_count_max = objectHash["virtualVolumeCountMax"]
  end
end

class RollbackToGroupSnapshot
  attr_accessor :group_snapshot_id, :save_current_state, :name, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RollbackToGroupSnapshot
    # RollbackToGroupSnapshot enables you to roll back all individual volumes in a snapshot group to each volume's individual snapshot.
    # Note: Rolling back to a group snapshot creates a temporary snapshot of each volume within the group snapshot.
    # Snapshots are allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param Fixnum group_snapshot_id: [required] Specifies the unique ID of the group snapshot.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param bool save_current_state: [required] Specifies whether to save an active volume image or delete it. Values are: true: The previous active volume image is kept. false: (default) The previous active volume image is deleted.
    self.save_current_state = objectHash["saveCurrentState"]

    # param str name:  Name for the group snapshot of the volume's current state that is created if "saveCurrentState" is set to true. If you do not give a name, the name of the snapshots (group and individual volume) are set to a timestamp of the time that the rollback occurred.
    self.name = objectHash["name"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class GetBackupTarget
  attr_accessor :backup_target_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetBackupTarget
    # GetBackupTarget enables you to return information about a specific backup target that you have created.
    # param Fixnum backup_target_id: [required] The unique identifier assigned to the backup target.
    self.backup_target_id = objectHash["backupTargetID"]
  end
end

class RollbackToGroupSnapshotResult
  attr_accessor :group_snapshot, :group_snapshot_id, :members

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RollbackToGroupSnapshotResult
    # param GroupSnapshot group_snapshot:
    self.group_snapshot = objectHash["groupSnapshot"] ? GroupSnapshot.new(objectHash["groupSnapshot"]) : nil

    # param Fixnum group_snapshot_id:  Unique ID of the new group snapshot.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param GroupSnapshotMembers members:  List of checksum, volumeIDs and snapshotIDs for each member of the group.
    self.members = Array.new(objectHash["members"].length) {|i| GroupSnapshotMembers.new(objectHash["members"][i])}
  end
end

class DeleteSnapshotResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteSnapshotResult
  end
end

class IpmiInfo
  attr_accessor :sensors

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # IpmiInfo
    # param dict sensors: [required]
    self.sensors = objectHash["sensors"]
  end
end

class GetIpmiInfoNodesResultObject
  attr_accessor :ipmi_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiInfoNodesResultObject
    # param IpmiInfo ipmi_info: [required]
    self.ipmi_info = objectHash["ipmiInfo"] ? IpmiInfo.new(objectHash["ipmiInfo"]) : nil
  end
end

class GetIpmiInfoNodesResult
  attr_accessor :node_id, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiInfoNodesResult
    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param GetIpmiInfoNodesResultObject result: [required]
    self.result = objectHash["result"] ? GetIpmiInfoNodesResultObject.new(objectHash["result"]) : nil
  end
end

class GetIpmiInfoResult
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetIpmiInfoResult
    # param GetIpmiInfoNodesResult nodes: [required] Detailed information from each sensor within a node.
    self.nodes = Array.new(objectHash["nodes"].length) {|i| GetIpmiInfoNodesResult.new(objectHash["nodes"][i])}
  end
end

class DeleteStorageContainerResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DeleteStorageContainerResult
  end
end

class ListVirtualVolumeTasks
  attr_accessor :virtual_volume_task_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeTasks
    # ListVirtualVolumeTasks returns a list of virtual volume tasks in the system.
    # param UUID virtual_volume_task_ids:  A list of virtual volume task IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume tasks.
    self.virtual_volume_task_ids = Array.new(objectHash["virtualVolumeTaskIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["virtualVolumeTaskIDs"][i])}
  end
end

class TestDrives
  attr_accessor :minutes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestDrives
    # You can use the TestDrives API method to run a hardware validation on all drives on the node. This method detects hardware
    # failures on the drives (if present) and reports them in the results of the validation tests.
    # You can only use the TestDrives method on nodes that are not "active" in a cluster.
    # Note: This test takes approximately 10 minutes.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param Fixnum minutes:  Specifies the number of minutes to run the test.
    self.minutes = objectHash["minutes"]
  end
end

class ModifyVolumeAccessGroupLunAssignmentsResult
  attr_accessor :volume_access_group_lun_assignments

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolumeAccessGroupLunAssignmentsResult
    # param VolumeAccessGroupLunAssignments volume_access_group_lun_assignments: [required]
    self.volume_access_group_lun_assignments = objectHash["volumeAccessGroupLunAssignments"] ? VolumeAccessGroupLunAssignments.new(objectHash["volumeAccessGroupLunAssignments"]) : nil
  end
end

class Signature
  attr_accessor :data, :pubkey, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Signature
    # param str data: [required]
    self.data = objectHash["data"]

    # param str pubkey: [required]
    self.pubkey = objectHash["pubkey"]

    # param Fixnum version: [required]
    self.version = objectHash["version"]
  end
end

class Origin
  attr_accessor :signature, :contract_date, :contract_name, :contract_quantity, :contract_type, :integrator, :location, :organization, :type

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end

    puts objectHash
    # Origin
    # param Signature &lt;signature&gt;: [required]
    self.signature = objectHash["&lt;signature&gt;"] ? Signature.new(objectHash["&lt;signature&gt;"]) : nil

    # param str contract_date: [required]
    self.contract_date = objectHash["contract-date"]

    # param str contract_name: [required]
    self.contract_name = objectHash["contract-name"]

    # param Fixnum contract_quantity: [required]
    self.contract_quantity = objectHash["contract-quantity"]

    # param str contract_type: [required]
    self.contract_type = objectHash["contract-type"]

    # param str integrator: [required]
    self.integrator = objectHash["integrator"]

    # param str location: [required]
    self.location = objectHash["location"]

    # param str organization: [required]
    self.organization = objectHash["organization"]

    # param str type: [required]
    self.type = objectHash["type"]
  end
end

class GetOriginNodeResult
  attr_accessor :origin

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetOriginNodeResult
    # param Origin origin:
    self.origin = objectHash["origin"] ? Origin.new(objectHash["origin"]) : nil
  end
end

class GetOriginNode
  attr_accessor :node_id, :result

  def initialize(objectHash = nil)
    puts "objhash #{objectHash}"
    if (objectHash == nil)
      return
    end


    # GetOriginNode
    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param GetOriginNodeResult result: [required]
    self.result = objectHash["result"] ? GetOriginNodeResult.new(objectHash["result"]) : nil
  end
end

class GetOriginResult
  attr_accessor :nodes

  def initialize(objectHash = nil)
    puts "objhash #{objectHash}"
    if (objectHash == nil)
      return
    end
    # GetOriginResult
    # param GetOriginNode nodes: [required]
    self.nodes = Array.new(objectHash["nodes"].length) {|i| GetOriginNode.new(objectHash["nodes"][i])}
  end
end

class ClusterInfo
  attr_accessor :encryption_at_rest_state, :mvip_interface, :mvip_vlan_tag, :svip_interface, :svip_vlan_tag, :ensemble, :mvip, :mvip_node_id, :name, :rep_count, :svip, :svip_node_id, :unique_id, :uuid, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ClusterInfo
    # Cluster Info object returns information the node uses to communicate with the cluster.
    # param str mvip_interface:
    self.mvip_interface = objectHash["mvipInterface"]

    # param str mvip_vlan_tag:
    self.mvip_vlan_tag = objectHash["mvipVlanTag"]

    # param str svip_interface:
    self.svip_interface = objectHash["svipInterface"]

    # param str svip_vlan_tag:
    self.svip_vlan_tag = objectHash["svipVlanTag"]

    # param str encryption_at_rest_state: [required] Encryption at rest state.
    self.encryption_at_rest_state = objectHash["encryptionAtRestState"]

    # param str ensemble: [required] Array of Node IP addresses that are participating in the cluster.
    self.ensemble = objectHash["ensemble"]

    # param str mvip: [required] Management network interface.
    self.mvip = objectHash["mvip"]

    # param Fixnum mvip_node_id: [required] Node holding the master MVIP address
    self.mvip_node_id = objectHash["mvipNodeID"]

    # param str name: [required] Unique cluster name.
    self.name = objectHash["name"]

    # param Fixnum rep_count: [required] Number of replicas of each piece of data to store in the cluster. Valid value is 2
    self.rep_count = objectHash["repCount"]

    # param str svip: [required] Storage virtual IP
    self.svip = objectHash["svip"]

    # param Fixnum svip_node_id: [required] Node holding the master SVIP address.
    self.svip_node_id = objectHash["svipNodeID"]

    # param str unique_id: [required] Unique ID for the cluster.
    self.unique_id = objectHash["uniqueID"]

    # param UUID uuid: [required]
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class GetClusterInfoResult
  attr_accessor :cluster_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterInfoResult
    # param ClusterInfo cluster_info: [required]
    self.cluster_info = objectHash["clusterInfo"] ? ClusterInfo.new(objectHash["clusterInfo"]) : nil
  end
end

class ListActivePairedVolumes
  attr_accessor :start_volume_id, :limit

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListActivePairedVolumes
    # ListActivePairedVolumes enables you to list all the active volumes paired with a volume. This method returns information about volumes with active and pending pairings.
    # param Fixnum start_volume_id:  The beginning of the range of active paired volumes to return.
    self.start_volume_id = objectHash["startVolumeID"]

    # param Fixnum limit:  Maximum number of active paired volumes to return.
    self.limit = objectHash["limit"]
  end
end

class StartBulkVolumeWriteResult
  attr_accessor :async_handle, :key, :url

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # StartBulkVolumeWriteResult
    # param Fixnum async_handle: [required] ID of the async process to be checked for completion.
    self.async_handle = objectHash["asyncHandle"]

    # param str key: [required] Opaque key uniquely identifying the session.
    self.key = objectHash["key"]

    # param str url: [required] URL to access the node's web server
    self.url = objectHash["url"]
  end
end

class Service
  attr_accessor :service_id, :service_type, :node_id, :associated_bv, :associated_ts, :associated_vs, :async_result_ids, :drive_id, :first_time_startup, :ipc_port, :iscsi_port, :status, :started_drive_ids, :drive_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Service
    # param Fixnum service_id: [required] Unique identifier for this service.
    self.service_id = objectHash["serviceID"]

    # param str service_type: [required]
    self.service_type = objectHash["serviceType"]

    # param Fixnum node_id: [required] The node this service resides on.
    self.node_id = objectHash["nodeID"]

    # param Fixnum associated_bv:  This service's associated bulk volume service. This will only be set if the service type is a slice service.
    self.associated_bv = objectHash["associatedBV"]

    # param Fixnum associated_ts:  This service's associated transport service. This will only be set if the service type is a slice service.
    self.associated_ts = objectHash["associatedTS"]

    # param Fixnum associated_vs:  This service's associated volume service. This will only be set if the service type is a slice service.
    self.associated_vs = objectHash["associatedVS"]

    # param Fixnum async_result_ids: [required] The list of asynchronous jobs currently running for this service.
    self.async_result_ids = objectHash["asyncResultIDs"]

    # param Fixnum drive_id:  If this service resides on a drive, the ID of that drive.
    self.drive_id = objectHash["driveID"]

    # param bool first_time_startup: [required] Has this service started successfully? When a new drive is added to the system, the created service will initially have a value of false here. After the service has started, this value will be set to true. This can be used to check if the service has ever started.
    self.first_time_startup = objectHash["firstTimeStartup"]

    # param Fixnum ipc_port: [required] The port used for intra-cluster communication. This will be in the 4000-4100 range.
    self.ipc_port = objectHash["ipcPort"]

    # param Fixnum iscsi_port: [required] The port used for iSCSI traffic. This will only be set if the service type is a transport service.
    self.iscsi_port = objectHash["iscsiPort"]

    # param str status: [required]
    self.status = objectHash["status"]

    # param Fixnum started_drive_ids: [required]
    self.started_drive_ids = objectHash["startedDriveIDs"]

    # param Fixnum drive_ids: [required]
    self.drive_ids = objectHash["driveIDs"]
  end
end

class Drive
  attr_accessor :drive_id, :node_id, :assigned_service, :async_result_ids, :capacity, :serial, :slot, :drive_status, :drive_type, :reserved_slice_file_capacity, :customer_slice_file_capacity, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # Drive
    # param Fixnum drive_id: [required] A unique identifier for this drive.
    self.drive_id = objectHash["driveID"]

    # param Fixnum node_id: [required] The node this drive is located. If the drive has been physically removed from the node, this is where it was last seen.
    self.node_id = objectHash["nodeID"]

    # param Fixnum assigned_service:  If this drive is hosting a service, the identifier for that service.
    self.assigned_service = objectHash["assignedService"]

    # param Fixnum async_result_ids: [required] The list of asynchronous jobs currently running on the drive (for example: a secure erase job).
    self.async_result_ids = objectHash["asyncResultIDs"]

    # param Fixnum capacity: [required] The raw capacity of this drive in bytes.
    self.capacity = objectHash["capacity"]

    # param str serial: [required] The manufacturer's serial number for this drive.
    self.serial = objectHash["serial"]

    # param Fixnum slot:  Slot number in the server chassis where this drive is located. If the drive has been physically removed from the node, this will not have a value.
    self.slot = objectHash["slot"]

    # param str drive_status: [required] The current status of this drive.
    self.drive_status = objectHash["driveStatus"]

    # param str drive_type: [required] The type of this drive.
    self.drive_type = objectHash["driveType"]

    # param Fixnum reserved_slice_file_capacity:
    self.reserved_slice_file_capacity = objectHash["reservedSliceFileCapacity"]

    # param Fixnum customer_slice_file_capacity:
    self.customer_slice_file_capacity = objectHash["customerSliceFileCapacity"]

    # param dict attributes: [required] List of Name/Value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class DetailedService
  attr_accessor :service, :node, :drive, :drives

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DetailedService
    # param Service service: [required]
    self.service = objectHash["service"] ? Service.new(objectHash["service"]) : nil

    # param Node node: [required]
    self.node = objectHash["node"] ? Node.new(objectHash["node"]) : nil

    # param Drive drive:
    self.drive = objectHash["drive"] ? Drive.new(objectHash["drive"]) : nil

    # param Drive drives: [required]
    self.drives = Array.new(objectHash["drives"].length) {|i| Drive.new(objectHash["drives"][i])}
  end
end

class ListServicesResult
  attr_accessor :services

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListServicesResult
    # param DetailedService services: [required]
    self.services = Array.new(objectHash["services"].length) {|i| DetailedService.new(objectHash["services"][i])}
  end
end

class ListActiveNodesResult
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListActiveNodesResult
    # param Node nodes: [required]
    self.nodes = Array.new(objectHash["nodes"].length) {|i| Node.new(objectHash["nodes"][i])}
  end
end

class ListBackupTargetsResult
  attr_accessor :backup_targets

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListBackupTargetsResult
    # param BackupTarget backup_targets: [required] Objects returned for each backup target.
    self.backup_targets = Array.new(objectHash["backupTargets"].length) {|i| BackupTarget.new(objectHash["backupTargets"][i])}
  end
end

class SnmpSendTestTrapsResult
  attr_accessor :status

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SnmpSendTestTrapsResult
    # param str status: [required]
    self.status = objectHash["status"]
  end
end

class ListVirtualVolumeBindings
  attr_accessor :virtual_volume_binding_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVirtualVolumeBindings
    # ListVirtualVolumeBindings returns a list of all virtual volumes in the cluster that are bound to protocol endpoints.
    # param Fixnum virtual_volume_binding_ids:  A list of virtual volume binding IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume bindings.
    self.virtual_volume_binding_ids = objectHash["virtualVolumeBindingIDs"]
  end
end

class ListVolumeStatsByAccount
  attr_accessor :accounts, :include_virtual_volumes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeStatsByAccount
    # ListVolumeStatsByAccount returns high-level activity measurements for every account. Values are summed from all the volumes owned by the account.
    # param Fixnum accounts:  One or more account ids by which to filter the result.
    self.accounts = objectHash["accounts"]

    # param bool include_virtual_volumes:  Includes virtual volumes in the response by default. To exclude virtual volumes, set to false.
    self.include_virtual_volumes = objectHash["includeVirtualVolumes"]
  end
end

class GetSnmpACLResult
  attr_accessor :networks, :usm_users

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSnmpACLResult
    # param SnmpNetwork networks:  List of networks and what type of access they have to the SNMP servers running on the cluster nodes. Present if SNMP v3 is disabled.
    self.networks = Array.new(objectHash["networks"].length) {|i| SnmpNetwork.new(objectHash["networks"][i])}

    # param SnmpV3UsmUser usm_users:  List of users and the type of access they have to the SNMP servers running on the cluster nodes. Present if SNMP v3 is enabled.
    self.usm_users = Array.new(objectHash["usmUsers"].length) {|i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
  end
end

class RemoveVirtualNetworkResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveVirtualNetworkResult
  end
end

class EnableSnmp
  attr_accessor :snmp_v3_enabled

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableSnmp
    # EnableSnmp enables you to enable SNMP on cluster nodes. When you enable SNMP, the action applies to all nodes in the cluster, and
    # the values that are passed replace, in whole, all values set in any previous call to EnableSnmp.
    # param bool snmp_v3_enabled: [required] If set to "true", then SNMP v3 is enabled on each node in the cluster. If set to "false", then SNMP v2 is enabled.
    self.snmp_v3_enabled = objectHash["snmpV3Enabled"]
  end
end

class SetSnmpInfoResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpInfoResult
  end
end

class DisableLdapAuthenticationResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DisableLdapAuthenticationResult
  end
end

class ListSnapshotsResult
  attr_accessor :snapshots

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListSnapshotsResult
    # param Snapshot snapshots: [required] Information about each snapshot for each volume. If volumeID is not provided, all snapshots for all volumes is returned. Snapshots that are in a group will be returned with a "groupID". Snapshots that are enabled for replication.
    self.snapshots = Array.new(objectHash["snapshots"].length) {|i| Snapshot.new(objectHash["snapshots"][i])}
  end
end

class ModifyInitiatorsResult
  attr_accessor :initiators

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyInitiatorsResult
    # param Initiator initiators: [required] List of objects containing details about the modified initiators
    self.initiators = Array.new(objectHash["initiators"].length) {|i| Initiator.new(objectHash["initiators"][i])}
  end
end

class CreateCluster
  attr_accessor :mvip, :accept_eula, :svip, :rep_count, :username, :password, :nodes, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateCluster
    # The CreateCluster method enables you to initialize the node in a cluster that has ownership of the "mvip" and "svip" addresses. Each new cluster is initialized using the management IP (MIP) of the first node in the cluster. This method also automatically adds all the nodes being configured into the cluster. You only need to use this method once each time a new cluster is initialized.
    # Note: You need to log in to the node that is used as the master node for the cluster. After you log in, run the GetBootstrapConfig method on the node to get the IP addresses for the rest of the nodes that you want to include in the
    # cluster. Then, run the CreateCluster method.
    # param bool accept_eula:  Required to indicate your acceptance of the End User License Agreement when creating this cluster. To accept the EULA, set this parameter to true.
    self.accept_eula = objectHash["acceptEula"]

    # param str mvip: [required] Floating (virtual) IP address for the cluster on the management network.
    self.mvip = objectHash["mvip"]

    # param str svip: [required] Floating (virtual) IP address for the cluster on the storage (iSCSI) network.
    self.svip = objectHash["svip"]

    # param Fixnum rep_count: [required] Number of replicas of each piece of data to store in the cluster. Valid value is "2".
    self.rep_count = objectHash["repCount"]

    # param str username: [required] Username for the cluster admin.
    self.username = objectHash["username"]

    # param str password: [required] Initial password for the cluster admin account.
    self.password = objectHash["password"]

    # param str nodes: [required] CIP/SIP addresses of the initial set of nodes making up the cluster. This node's IP must be in the list.
    self.nodes = objectHash["nodes"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ListEvents
  attr_accessor :max_events, :start_event_id, :end_event_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListEvents
    # ListEvents returns events detected on the cluster, sorted from oldest to newest.
    # param Fixnum max_events:  Specifies the maximum number of events to return.
    self.max_events = objectHash["maxEvents"]

    # param Fixnum start_event_id:  Identifies the beginning of a range of events to return.
    self.start_event_id = objectHash["startEventID"]

    # param Fixnum end_event_id:  Identifies the end of a range of events to return.
    self.end_event_id = objectHash["endEventID"]
  end
end

class PurgeDeletedVolumesResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PurgeDeletedVolumesResult
  end
end

class ListProtocolEndpoints
  attr_accessor :protocol_endpoint_ids

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListProtocolEndpoints
    # ListProtocolEndpoints enables you to retrieve information about all protocol endpoints in the cluster. Protocol endpoints govern
    # access to their associated virtual volume storage containers.
    # param UUID protocol_endpoint_ids:  A list of protocol endpoint IDs for which to retrieve information. If you omit this parameter, the method returns information about all protocol endpoints.
    self.protocol_endpoint_ids = Array.new(objectHash["protocolEndpointIDs"].length) {|i| UUIDTools::UUID.parse(objectHash["protocolEndpointIDs"][i])}
  end
end

class ListVolumeAccessGroupsResult
  attr_accessor :volume_access_groups, :volume_access_groups_not_found

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListVolumeAccessGroupsResult
    # param VolumeAccessGroup volume_access_groups: [required] A list of objects describing each volume access group.
    self.volume_access_groups = Array.new(objectHash["volumeAccessGroups"].length) {|i| VolumeAccessGroup.new(objectHash["volumeAccessGroups"][i])}

    # param Fixnum volume_access_groups_not_found:  A list of volume access groups not found by the system. Present if you used the "volumeAccessGroups" parameter and the system was unable to find one or more volume access groups that you specified.
    self.volume_access_groups_not_found = objectHash["volumeAccessGroupsNotFound"]
  end
end

class TestLdapAuthenticationResult
  attr_accessor :groups, :user_dn

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestLdapAuthenticationResult
    # param str groups: [required] List of LDAP groups that the tested user is a member of.
    self.groups = objectHash["groups"]

    # param str user_dn: [required] The tested user's full LDAP distinguished name.
    self.user_dn = objectHash["userDN"]
  end
end

class ListAccountsResult
  attr_accessor :accounts

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListAccountsResult
    # param Account accounts: [required] List of accounts.
    self.accounts = Array.new(objectHash["accounts"].length) {|i| Account.new(objectHash["accounts"][i])}
  end
end

class SetSnmpACL
  attr_accessor :networks, :usm_users

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetSnmpACL
    # SetSnmpACL enables you to configure SNMP access permissions on the cluster nodes. The values you set with this interface apply to all
    # nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpACL. Also note
    # that the values set with this interface replace all network or usmUsers values set with the older SetSnmpInfo.
    # param SnmpNetwork networks: [required] List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. This parameter is required if SNMP v3 is disabled.
    self.networks = Array.new(objectHash["networks"].length) {|i| SnmpNetwork.new(objectHash["networks"][i])}

    # param SnmpV3UsmUser usm_users: [required] List of users and the type of access they have to the SNMP servers running on the cluster nodes.
    self.usm_users = Array.new(objectHash["usmUsers"].length) {|i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
  end
end

class GroupCloneVolumeMember
  attr_accessor :volume_id, :src_volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GroupCloneVolumeMember
    # Represents the relationship between the source Volume and cloned Volume IDs.
    # param Fixnum volume_id: [required] The VolumeID of the cloned volume.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum src_volume_id: [required] The VolumeID of the source volume.
    self.src_volume_id = objectHash["srcVolumeID"]
  end
end

class CloneMultipleVolumesResult
  attr_accessor :async_handle, :group_clone_id, :members

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CloneMultipleVolumesResult
    # param Fixnum async_handle: [required] A value returned from an asynchronous method call.
    self.async_handle = objectHash["asyncHandle"]

    # param Fixnum group_clone_id: [required] Unique ID of the new group clone.
    self.group_clone_id = objectHash["groupCloneID"]

    # param GroupCloneVolumeMember members: [required] List of volumeIDs for the source and destination volume pairs.
    self.members = Array.new(objectHash["members"].length) {|i| GroupCloneVolumeMember.new(objectHash["members"][i])}
  end
end

class RemoveVolumePair
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveVolumePair
    # RemoveVolumePair enables you to remove the remote pairing between two volumes. Use this method on both the source and target volumes that are paired together. When you remove the volume pairing information, data is no longer replicated to or from the volume.
    # param Fixnum volume_id: [required] The ID of the volume on which to stop the replication process.
    self.volume_id = objectHash["volumeID"]
  end
end

class GetStorageContainerEfficiencyResult
  attr_accessor :compression, :deduplication, :missing_volumes, :thin_provisioning, :timestamp

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetStorageContainerEfficiencyResult
    # param float compression: [required]
    self.compression = objectHash["compression"]

    # param float deduplication: [required]
    self.deduplication = objectHash["deduplication"]

    # param Fixnum missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by the Garbage Collection (GC) cycle being less than an hour old, temporary loss of network connectivity, or restarted services since the GC cycle.
    self.missing_volumes = objectHash["missingVolumes"]

    # param float thin_provisioning: [required]
    self.thin_provisioning = objectHash["thinProvisioning"]

    # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC).
    self.timestamp = objectHash["timestamp"]
  end
end

class SetLoginSessionInfoResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetLoginSessionInfoResult
  end
end

class AsyncHandleResult
  attr_accessor :async_handle

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AsyncHandleResult
    # param Fixnum async_handle: [required]
    self.async_handle = objectHash["asyncHandle"]
  end
end

class PurgeDeletedVolume
  attr_accessor :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # PurgeDeletedVolume
    # PurgeDeletedVolume immediately and permanently purges a volume that has been deleted. You must delete a volume using
    # DeleteVolume before it can be purged. Volumes are purged automatically after a period of time, so usage of this method is not
    # typically required.
    # param Fixnum volume_id: [required] The ID of the volume to be purged.
    self.volume_id = objectHash["volumeID"]
  end
end

class SyncJob
  attr_accessor :bytes_per_second, :current_bytes, :dst_service_id, :elapsed_time, :percent_complete, :remaining_time, :slice_id, :src_service_id, :total_bytes, :type, :clone_id, :dst_volume_id, :node_id, :snapshot_id, :src_volume_id, :blocks_per_second, :stage

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SyncJob
    # param float bytes_per_second: [required]
    self.bytes_per_second = objectHash["bytesPerSecond"]

    # param Fixnum current_bytes: [required]
    self.current_bytes = objectHash["currentBytes"]

    # param Fixnum dst_service_id: [required]
    self.dst_service_id = objectHash["dstServiceID"]

    # param float elapsed_time: [required]
    self.elapsed_time = objectHash["elapsedTime"]

    # param float percent_complete: [required]
    self.percent_complete = objectHash["percentComplete"]

    # param float remaining_time: [required]
    self.remaining_time = objectHash["remainingTime"]

    # param Fixnum slice_id: [required]
    self.slice_id = objectHash["sliceID"]

    # param Fixnum src_service_id: [required]
    self.src_service_id = objectHash["srcServiceID"]

    # param Fixnum total_bytes: [required]
    self.total_bytes = objectHash["totalBytes"]

    # param str type: [required]
    self.type = objectHash["type"]

    # param Fixnum clone_id: [required]
    self.clone_id = objectHash["cloneID"]

    # param Fixnum dst_volume_id: [required]
    self.dst_volume_id = objectHash["dstVolumeID"]

    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param Fixnum snapshot_id: [required]
    self.snapshot_id = objectHash["snapshotID"]

    # param Fixnum src_volume_id: [required]
    self.src_volume_id = objectHash["srcVolumeID"]

    # param float blocks_per_second: [required]
    self.blocks_per_second = objectHash["blocksPerSecond"]

    # param str stage: [required]
    self.stage = objectHash["stage"]
  end
end

class ListSyncJobsResult
  attr_accessor :sync_jobs

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListSyncJobsResult
    # param SyncJob sync_jobs: [required]
    self.sync_jobs = Array.new(objectHash["syncJobs"].length) {|i| SyncJob.new(objectHash["syncJobs"][i])}
  end
end

class BulkVolumeJob
  attr_accessor :bulk_volume_id, :create_time, :elapsed_time, :format, :key, :percent_complete, :remaining_time, :src_volume_id, :status, :script, :snapshot_id, :type, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # BulkVolumeJob
    # param Fixnum bulk_volume_id: [required] The internal bulk volume job ID.
    self.bulk_volume_id = objectHash["bulkVolumeID"]

    # param str create_time: [required] Timestamp created for the bulk volume job.
    self.create_time = objectHash["createTime"]

    # param Fixnum elapsed_time: [required] The number of seconds since the job began.
    self.elapsed_time = objectHash["elapsedTime"]

    # param str format: [required] Format is either "compressed" or "native".
    self.format = objectHash["format"]

    # param str key: [required] The unique key created by the bulk volume session.
    self.key = objectHash["key"]

    # param Fixnum percent_complete: [required] The completed percentage reported by the operation.
    self.percent_complete = objectHash["percentComplete"]

    # param Fixnum remaining_time: [required] The estimated time remaining in seconds.
    self.remaining_time = objectHash["remainingTime"]

    # param Fixnum src_volume_id: [required] The source volume ID.
    self.src_volume_id = objectHash["srcVolumeID"]

    # param str status: [required] Can be one of the following: preparing active done failed
    self.status = objectHash["status"]

    # param str script:  The name of the script if one is provided.
    self.script = objectHash["script"]

    # param Fixnum snapshot_id:  ID of the snapshot if a snapshot is in the source of the bulk volume job.
    self.snapshot_id = objectHash["snapshotID"]

    # param str type: [required] Can be one of the following: read write
    self.type = objectHash["type"]

    # param dict attributes: [required] JSON attributes on the bulk volume job.
    self.attributes = objectHash["attributes"]
  end
end

class ListBulkVolumeJobsResult
  attr_accessor :bulk_volume_jobs

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListBulkVolumeJobsResult
    # param BulkVolumeJob bulk_volume_jobs: [required] An array of information for each bulk volume job.
    self.bulk_volume_jobs = Array.new(objectHash["bulkVolumeJobs"].length) {|i| BulkVolumeJob.new(objectHash["bulkVolumeJobs"][i])}
  end
end

class TestConnectMvip
  attr_accessor :mvip

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectMvip
    # The TestConnectMvip API method enables you to test the
    # management connection to the cluster. The test pings the MVIP and executes a simple API method to verify connectivity.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param str mvip:  If specified, tests the management connection of a different MVIP. You do not need to use this value when testing the connection to the target cluster. This parameter is optional.
    self.mvip = objectHash["mvip"]
  end
end

class GetSnmpStateResult
  attr_accessor :enabled, :snmp_v3_enabled

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSnmpStateResult
    # param bool enabled: [required] If the nodes in the cluster are configured for SNMP.
    self.enabled = objectHash["enabled"]

    # param bool snmp_v3_enabled: [required] If the node in the cluster is configured for SNMP v3.
    self.snmp_v3_enabled = objectHash["snmpV3Enabled"]
  end
end

class ListPendingActiveNodesResult
  attr_accessor :pending_active_nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListPendingActiveNodesResult
    # param PendingActiveNode pending_active_nodes: [required] List of objects detailing information about all PendingActive nodes in the system.
    self.pending_active_nodes = Array.new(objectHash["pendingActiveNodes"].length) {|i| PendingActiveNode.new(objectHash["pendingActiveNodes"][i])}
  end
end

class CompleteVolumePairing
  attr_accessor :volume_pairing_key, :volume_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CompleteVolumePairing
    # You can use the CompleteVolumePairing method to complete the pairing of two volumes.
    # param str volume_pairing_key: [required] The key returned from the StartVolumePairing method.
    self.volume_pairing_key = objectHash["volumePairingKey"]

    # param Fixnum volume_id: [required] The ID of the volume on which to complete the pairing process.
    self.volume_id = objectHash["volumeID"]
  end
end

class GetClusterState
  attr_accessor :force

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetClusterState
    # The GetClusterState API method enables you to indicate if a node is part of a cluster or not. The three states are:
    # Available: Node has not been configured with a cluster name.
    # Pending: Node is pending for a specific named cluster and can be added.
    # Active: Node is an active member of a cluster and may not be added to another
    # cluster.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param bool force: [required] To run this command, the force parameter must be set to true.
    self.force = objectHash["force"]
  end
end

class DriveHardware
  attr_accessor :canonical_name, :connected, :dev, :dev_path, :drive_type, :life_remaining_percent, :lifetime_read_bytes, :lifetime_write_bytes, :name, :path, :path_link, :power_on_hours, :product, :reallocated_sectors, :reserve_capacity_percent, :scsi_compat_id, :scsi_state, :security_at_maximum, :security_enabled, :security_frozen, :security_locked, :security_supported, :serial, :size, :slot, :smart_ssd_write_capable, :uuid, :vendor, :version

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DriveHardware
    # param str canonical_name: [required]
    self.canonical_name = objectHash["canonicalName"]

    # param bool connected: [required]
    self.connected = objectHash["connected"]

    # param Fixnum dev: [required]
    self.dev = objectHash["dev"]

    # param str dev_path: [required]
    self.dev_path = objectHash["devPath"]

    # param str drive_type: [required]
    self.drive_type = objectHash["driveType"]

    # param Fixnum life_remaining_percent: [required]
    self.life_remaining_percent = objectHash["lifeRemainingPercent"]

    # param Fixnum lifetime_read_bytes: [required]
    self.lifetime_read_bytes = objectHash["lifetimeReadBytes"]

    # param Fixnum lifetime_write_bytes: [required]
    self.lifetime_write_bytes = objectHash["lifetimeWriteBytes"]

    # param str name: [required]
    self.name = objectHash["name"]

    # param str path: [required]
    self.path = objectHash["path"]

    # param str path_link: [required]
    self.path_link = objectHash["pathLink"]

    # param Fixnum power_on_hours: [required]
    self.power_on_hours = objectHash["powerOnHours"]

    # param str product: [required]
    self.product = objectHash["product"]

    # param Fixnum reallocated_sectors: [required]
    self.reallocated_sectors = objectHash["reallocatedSectors"]

    # param Fixnum reserve_capacity_percent: [required]
    self.reserve_capacity_percent = objectHash["reserveCapacityPercent"]

    # param str scsi_compat_id: [required]
    self.scsi_compat_id = objectHash["scsiCompatId"]

    # param str scsi_state: [required]
    self.scsi_state = objectHash["scsiState"]

    # param bool security_at_maximum: [required]
    self.security_at_maximum = objectHash["securityAtMaximum"]

    # param bool security_enabled: [required]
    self.security_enabled = objectHash["securityEnabled"]

    # param bool security_frozen: [required]
    self.security_frozen = objectHash["securityFrozen"]

    # param bool security_locked: [required]
    self.security_locked = objectHash["securityLocked"]

    # param bool security_supported: [required]
    self.security_supported = objectHash["securitySupported"]

    # param str serial: [required]
    self.serial = objectHash["serial"]

    # param Fixnum size: [required]
    self.size = objectHash["size"]

    # param Fixnum slot: [required]
    self.slot = objectHash["slot"]

    # param bool smart_ssd_write_capable:
    self.smart_ssd_write_capable = objectHash["smartSsdWriteCapable"]

    # param UUID uuid: [required]
    self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

    # param str vendor: [required]
    self.vendor = objectHash["vendor"]

    # param str version: [required]
    self.version = objectHash["version"]
  end
end

class DrivesHardware
  attr_accessor :drive_hardware

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # DrivesHardware
    # param DriveHardware drive_hardware: [required]
    self.drive_hardware = Array.new(objectHash["driveHardware"].length) {|i| DriveHardware.new(objectHash["driveHardware"][i])}
  end
end

class NodeDriveHardware
  attr_accessor :node_id, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # NodeDriveHardware
    # param Fixnum node_id: [required]
    self.node_id = objectHash["nodeID"]

    # param DrivesHardware result: [required]
    self.result = objectHash["result"] ? DrivesHardware.new(objectHash["result"]) : nil
  end
end

class ListDriveHardwareResult
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListDriveHardwareResult
    # param NodeDriveHardware nodes: [required]
    self.nodes = Array.new(objectHash["nodes"].length) {|i| NodeDriveHardware.new(objectHash["nodes"][i])}
  end
end

class GetNodeHardwareInfoResult
  attr_accessor :node_hardware_info

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetNodeHardwareInfoResult
    # param dict node_hardware_info: [required] Hardware information for the specified nodeID.
    self.node_hardware_info = objectHash["nodeHardwareInfo"]
  end
end

class GetSnmpTrapInfoResult
  attr_accessor :trap_recipients, :cluster_fault_traps_enabled, :cluster_fault_resolved_traps_enabled, :cluster_event_traps_enabled

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # GetSnmpTrapInfoResult
    # param SnmpTrapRecipient trap_recipients: [required] List of hosts that are to receive the traps generated by the cluster.
    self.trap_recipients = Array.new(objectHash["trapRecipients"].length) {|i| SnmpTrapRecipient.new(objectHash["trapRecipients"][i])}

    # param bool cluster_fault_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients.
    self.cluster_fault_traps_enabled = objectHash["clusterFaultTrapsEnabled"]

    # param bool cluster_fault_resolved_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients.
    self.cluster_fault_resolved_traps_enabled = objectHash["clusterFaultResolvedTrapsEnabled"]

    # param bool cluster_event_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients.
    self.cluster_event_traps_enabled = objectHash["clusterEventTrapsEnabled"]
  end
end

class SetRemoteLoggingHostsResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetRemoteLoggingHostsResult
  end
end

class SetClusterConfig
  attr_accessor :cluster

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # SetClusterConfig
    # The SetClusterConfig API method enables you to set the configuration this node uses to communicate with the cluster it is associated with. To see the states in which these objects can be modified, see Cluster Object Attributes. To display the current cluster
    # interface settings for a node, run the GetClusterConfig API method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param ClusterConfig cluster: [required] Objects that are changed for the cluster interface settings.
    self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
  end
end

class ResetDriveDetails
  attr_accessor :drive, :return_code, :stderr, :stdout

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetDriveDetails
    # param str drive: [required] Drive name
    self.drive = objectHash["drive"]

    # param Fixnum return_code: [required]
    self.return_code = objectHash["returnCode"]

    # param str stderr: [required]
    self.stderr = objectHash["stderr"]

    # param str stdout: [required]
    self.stdout = objectHash["stdout"]
  end
end

class ResetDrivesDetails
  attr_accessor :drives

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetDrivesDetails
    # param ResetDriveDetails drives: [required] Details of a single drive that is being reset.
    self.drives = Array.new(objectHash["drives"].length) {|i| ResetDriveDetails.new(objectHash["drives"][i])}
  end
end

class ResetDrivesResult
  attr_accessor :details

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ResetDrivesResult
    # param ResetDrivesDetails details: [required] Details of drives that are being reset.
    self.details = objectHash["details"] ? ResetDrivesDetails.new(objectHash["details"]) : nil
  end
end

class ListAccounts
  attr_accessor :start_account_id, :limit, :include_storage_containers

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ListAccounts
    # ListAccounts returns the entire list of accounts, with optional paging support.
    # param Fixnum start_account_id:  Starting AccountID to return. If no account exists with this AccountID, the next account by AccountID order is used as the start of the list. To page through the list, pass the AccountID of the last account in the previous response + 1.
    self.start_account_id = objectHash["startAccountID"]

    # param Fixnum limit:  Maximum number of AccountInfo objects to return.
    self.limit = objectHash["limit"]

    # param bool include_storage_containers:  Includes storage containers in the response by default. To exclude storage containers, set to false.
    self.include_storage_containers = objectHash["includeStorageContainers"]
  end
end

class ModifyClusterFullThreshold
  attr_accessor :stage2_aware_threshold, :stage3_block_threshold_percent, :max_metadata_over_provision_factor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyClusterFullThreshold
    # You can use ModifyClusterFullThreshold to change the level at which the system generates an event when the storage cluster approaches a certain capacity utilization. You can use the threshold setting to indicate the acceptable amount of utilized block storage before the system generates a warning. For example, if you want to be alerted when the system reaches 3% below the "Error" level block storage utilization, enter a value of "3" for the stage3BlockThresholdPercent parameter. If this level is reached, the system sends an alert to the Event Log in the Cluster Management Console.
    # param Fixnum stage2_aware_threshold:  The number of nodes of capacity remaining in the cluster before the system triggers a capacity notification.
    self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

    # param Fixnum stage3_block_threshold_percent:  The percentage of block storage utilization below the "Error" threshold that causes the system to trigger a cluster "Warning" alert.
    self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

    # param Fixnum max_metadata_over_provision_factor:  A value representative of the number of times metadata space can be overprovisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes can be created.
    self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]
  end
end

class AddClusterAdmin
  attr_accessor :username, :password, :access, :accept_eula, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # AddClusterAdmin
    # You can use AddClusterAdmin to add a new cluster admin account. A cluster ddmin can manage the cluster using the API and management tools. Cluster admins are completely separate and unrelated to standard tenant accounts.
    # Each cluster admin can be restricted to a subset of the API. NetApp recommends using multiple cluster admin accounts for different users and applications. You should give each cluster admin the minimal permissions necessary; this reduces the potential impact of credential compromise.
    # You must accept the End User License Agreement (EULA) by setting the acceptEula parameter to true to add a cluster administrator account to the system.
    # param str username: [required] Unique username for this cluster admin. Must be between 1 and 1024 characters in length.
    self.username = objectHash["username"]

    # param str password: [required] Password used to authenticate this cluster admin.
    self.password = objectHash["password"]

    # param str access: [required] Controls which methods this cluster admin can use. For more details on the levels of access, see Access Control in the Element API Reference Guide.
    self.access = objectHash["access"]

    # param bool accept_eula:  Required to indicate your acceptance of the End User License Agreement when creating this cluster. To accept the EULA, set this parameter to true.
    self.accept_eula = objectHash["acceptEula"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class EnableFeatureResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # EnableFeatureResult
  end
end

class RemoveBackupTargetResult
  attr_accessor

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveBackupTargetResult
  end
end

class CloneVolume
  attr_accessor :volume_id, :name, :new_account_id, :new_size, :access, :snapshot_id, :attributes, :enable512e

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CloneVolume
    # CloneVolume enables you to create a copy of a volume. This method is asynchronous and might take a variable amount of time to complete. The cloning process begins immediately when you make the CloneVolume request and is representative of the state of the volume when the API method is issued. You can use the GetAsyncResult method to determine when the cloning process is complete and the new volume is available for connections. You can use ListSyncJobs to see the progress of creating the clone.
    # Note: The initial attributes and QoS settings for the volume are inherited from the volume being cloned. You can change these settings with ModifyVolume.
    # Note: Cloned volumes do not inherit volume access group memberships from the source volume.
    # param Fixnum volume_id: [required] VolumeID for the volume to be cloned.
    self.volume_id = objectHash["volumeID"]

    # param str name: [required] The name of the new cloned volume. Might be 1 to 64 characters in length.
    self.name = objectHash["name"]

    # param Fixnum new_account_id:  AccountID for the owner of the new volume. If unspecified, the accountID of the owner of the volume being cloned is used.
    self.new_account_id = objectHash["newAccountID"]

    # param Fixnum new_size:  New size of the volume, in bytes. Might be greater or less than the size of the volume being cloned. If unspecified, the volume size is not changed. Size is rounded to the nearest 1MB.
    self.new_size = objectHash["newSize"]

    # param str access:  Specifies the level of access allowed for the new volume. Possible values are: readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. If unspecified, the level of access of the volume being cloned is used. replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. If a value is not specified, the access value does not change.
    self.access = objectHash["access"]

    # param Fixnum snapshot_id:  ID of the snapshot that is used as the source of the clone. If no ID is provided, the current active volume is used.
    self.snapshot_id = objectHash["snapshotID"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]

    # param bool enable512e:  Should the volume provide 512-byte sector emulation?
    self.enable512e = objectHash["enable512e"]
  end
end

class CreateBackupTarget
  attr_accessor :name, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateBackupTarget
    # CreateBackupTarget enables you to create and store backup target information so that you do not need to re-enter it each time a backup is created.
    # param str name: [required] The name of the backup target.
    self.name = objectHash["name"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class ModifyVolume
  attr_accessor :volume_id, :account_id, :access, :qos, :total_size, :set_create_time, :create_time, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyVolume
    # ModifyVolume enables you to modify settings on an existing volume. You can make modifications to one volume at a time and
    # changes take place immediately. If you do not specify QoS values when you modify a volume, they remain the same as before the modification. You can retrieve
    # default QoS values for a newly created volume by running the GetDefaultQoS method.
    # When you need to increase the size of a volume that is being replicated, do so in the following order to prevent replication errors:
    # 1. Increase the size of the "Replication Target" volume.
    # 2. Increase the size of the source or "Read / Write" volume.
    # NetApp recommends that both the target and source volumes are the same size.
    # Note: If you change the "access" status to locked or target, all existing iSCSI connections are terminated.
    # param Fixnum volume_id: [required] VolumeID for the volume to be modified.
    self.volume_id = objectHash["volumeID"]

    # param Fixnum account_id:  AccountID to which the volume is reassigned. If unspecified, the previous account name is used.
    self.account_id = objectHash["accountID"]

    # param str access:  Specifies the access allowed for the volume. Possible values are: readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. If not specified, the access value does not change. replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. If a value is not specified, the access value does not change.
    self.access = objectHash["access"]

    # param QoS qos:  New QoS settings for this volume. If not specified, the QoS settings are not changed.
    self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

    # param Fixnum total_size:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB. This parameter can only be used to increase the size of a volume.
    self.total_size = objectHash["totalSize"]

    # param bool set_create_time:  If set to true, changes the recorded date of volume creation.
    self.set_create_time = objectHash["setCreateTime"]

    # param str create_time:  An ISO 8601 date string to set as the new volume creation date. Required if "setCreateTime" is set to true.
    self.create_time = objectHash["createTime"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class CreateGroupSnapshotResult
  attr_accessor :group_snapshot, :group_snapshot_id, :members

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CreateGroupSnapshotResult
    # param GroupSnapshot group_snapshot: [required]
    self.group_snapshot = objectHash["groupSnapshot"] ? GroupSnapshot.new(objectHash["groupSnapshot"]) : nil

    # param Fixnum group_snapshot_id: [required] Unique ID of the new group snapshot.
    self.group_snapshot_id = objectHash["groupSnapshotID"]

    # param GroupSnapshotMembers members: [required] List of checksum, volumeIDs and snapshotIDs for each member of the group.
    self.members = Array.new(objectHash["members"].length) {|i| GroupSnapshotMembers.new(objectHash["members"][i])}
  end
end

class ModifyClusterAdmin
  attr_accessor :cluster_admin_id, :password, :access, :attributes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # ModifyClusterAdmin
    # You can use ModifyClusterAdmin to change the settings for a cluster admin or LDAP cluster admin. You cannot change access for the administrator cluster admin account.
    # param Fixnum cluster_admin_id: [required] ClusterAdminID for the cluster admin or LDAP cluster admin to modify.
    self.cluster_admin_id = objectHash["clusterAdminID"]

    # param str password:  Password used to authenticate this cluster admin.
    self.password = objectHash["password"]

    # param str access:  Controls which methods this cluster admin can use. For more details, see Access Control in the Element API Reference Guide.
    self.access = objectHash["access"]

    # param dict attributes:  List of name-value pairs in JSON object format.
    self.attributes = objectHash["attributes"]
  end
end

class RemoveClusterPair
  attr_accessor :cluster_pair_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # RemoveClusterPair
    # You can use the RemoveClusterPair method to close the open connections between two paired clusters.
    # Note: Before you remove a cluster pair, you must first remove all volume pairing to the clusters with the "RemoveVolumePair" API method.
    # param Fixnum cluster_pair_id: [required] Unique identifier used to pair two clusters.
    self.cluster_pair_id = objectHash["clusterPairID"]
  end
end

class CompleteClusterPairingResult
  attr_accessor :cluster_pair_id

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # CompleteClusterPairingResult
    # param Fixnum cluster_pair_id: [required] Unique identifier for the cluster pair.
    self.cluster_pair_id = objectHash["clusterPairID"]
  end
end

class TestConnectEnsembleDetails
  attr_accessor :nodes

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectEnsembleDetails
    # param dict nodes: [required] A list of each ensemble node in the test and the results of the tests.
    self.nodes = objectHash["nodes"]
  end
end

class TestConnectEnsembleResult
  attr_accessor :details, :duration, :result

  def initialize(objectHash = nil)
    if (objectHash == nil)
      return
    end
    # TestConnectEnsembleResult
    # param TestConnectEnsembleDetails details: [required]
    self.details = objectHash["details"] ? TestConnectEnsembleDetails.new(objectHash["details"]) : nil

    # param str duration: [required] The length of time required to run the test.
    self.duration = objectHash["duration"]

    # param str result: [required] The results of the entire test
    self.result = objectHash["result"]
  end
end


