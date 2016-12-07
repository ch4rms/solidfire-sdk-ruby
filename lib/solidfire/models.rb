#!/usr/bin/python
#
# Copyright &copy; 2014-2016 NetApp, Inc. All Rights Reserved.
#
# DO NOT EDIT THIS CODE BY HAND! It has been generated with solidfire-sdk-generators.
require 'uuidtools'
require_relative 'custom_models'


class TestPingResult
    attr_accessor :result, :duration, :details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str result: [required] Result of the ping test. 
        self.result = objectHash["result"]

        # param str duration: [required] The total duration of the ping test. 
        self.duration = objectHash["duration"]

        # param str details: [required] List of each IP the node was able to communicate with. 
        self.details = objectHash["details"]
    end
end

class NewDrive
    attr_accessor :drive_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drive_id: [required] A unique identifier for this drive. 
        self.drive_id = objectHash["driveID"]
    end
end

class ClusterCapacity
    attr_accessor :active_block_space, :active_sessions, :average_iops, :cluster_recent_iosize, :current_iops, :max_iops, :max_over_provisionable_space, :max_provisioned_space, :max_used_metadata_space, :max_used_space, :non_zero_blocks, :peak_active_sessions, :peak_iops, :provisioned_space, :snapshot_non_zero_blocks, :timestamp, :total_ops, :unique_blocks, :unique_blocks_used_space, :used_metadata_space, :used_metadata_space_in_snapshots, :used_space, :zero_blocks

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # High level capacity measurements for the entire cluster.
        # param int active_block_space: [required] The amount of space on the block drives. This includes additional information such as metadata entries and space which can be cleaned up. 
        self.active_block_space = objectHash["activeBlockSpace"]

        # param int active_sessions: [required] Number of active iSCSI sessions communicating with the cluster 
        self.active_sessions = objectHash["activeSessions"]

        # param int average_iops: [required] Average IPS for the cluster since midnight Coordinated Universal Time (UTC). 
        self.average_iops = objectHash["averageIOPS"]

        # param int cluster_recent_iosize: [required] The average size of IOPS to all volumes in the cluster. 
        self.cluster_recent_iosize = objectHash["clusterRecentIOSize"]

        # param int current_iops: [required] Average IOPS for all volumes in the cluster over the last 5 seconds. 
        self.current_iops = objectHash["currentIOPS"]

        # param int max_iops: [required] Estimated maximum IOPS capability of the current cluster. 
        self.max_iops = objectHash["maxIOPS"]

        # param int max_over_provisionable_space: [required] The maximum amount of provisionable space. This is a computed value. You cannot create new volumes if the current provisioned space plus the new volume size would exceed this number: maxOverProvisionableSpace = maxProvisionedSpace * GetClusterFull 
        self.max_over_provisionable_space = objectHash["maxOverProvisionableSpace"]

        # param int max_provisioned_space: [required] The total amount of provisionable space if all volumes are 100% filled (no thin provisioned metadata). 
        self.max_provisioned_space = objectHash["maxProvisionedSpace"]

        # param int max_used_metadata_space: [required] The amount of bytes on volume drives used to store metadata. 
        self.max_used_metadata_space = objectHash["maxUsedMetadataSpace"]

        # param int max_used_space: [required] The total amount of space on all active block drives. 
        self.max_used_space = objectHash["maxUsedSpace"]

        # param int non_zero_blocks: [required] Total number of 4KiB blocks with data after the last garbage collection operation has completed. 
        self.non_zero_blocks = objectHash["nonZeroBlocks"]

        # param int peak_active_sessions: [required] Peak number of iSCSI connections since midnight UTC. 
        self.peak_active_sessions = objectHash["peakActiveSessions"]

        # param int peak_iops: [required] The highest value for currentIOPS since midnight UTC. 
        self.peak_iops = objectHash["peakIOPS"]

        # param int provisioned_space: [required] Total amount of space provisioned in all volumes on the cluster. 
        self.provisioned_space = objectHash["provisionedSpace"]

        # param int snapshot_non_zero_blocks: [required] Total number of 4KiB blocks in snapshots with data. 
        self.snapshot_non_zero_blocks = objectHash["snapshotNonZeroBlocks"]

        # param str timestamp: [required] The date and time this cluster capacity sample was taken. 
        self.timestamp = objectHash["timestamp"]

        # param int total_ops: [required] The total number of I/O operations performed throughout the lifetime of the cluster 
        self.total_ops = objectHash["totalOps"]

        # param int unique_blocks: [required] The total number of blocks stored on the block drives. The value includes replicated blocks. 
        self.unique_blocks = objectHash["uniqueBlocks"]

        # param int unique_blocks_used_space: [required] The total amount of data the uniqueBlocks take up on the block drives. This number is always consistent with the uniqueBlocks value. 
        self.unique_blocks_used_space = objectHash["uniqueBlocksUsedSpace"]

        # param int used_metadata_space: [required] The total amount of bytes on volume drives used to store metadata 
        self.used_metadata_space = objectHash["usedMetadataSpace"]

        # param int used_metadata_space_in_snapshots: [required] The amount of bytes on volume drives used for storing unique data in snapshots. This number provides an estimate of how much metadata space would be regained by deleting all snapshots on the system. 
        self.used_metadata_space_in_snapshots = objectHash["usedMetadataSpaceInSnapshots"]

        # param int used_space: [required] Total amount of space used by all block drives in the system. 
        self.used_space = objectHash["usedSpace"]

        # param int zero_blocks: [required] Total number of 4KiB blocks without data after the last round of garabage collection operation has completed. 
        self.zero_blocks = objectHash["zeroBlocks"]
    end
end

class GetClusterCapacityResult
    attr_accessor :cluster_capacity

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterCapacity cluster_capacity: [required] 
        self.cluster_capacity = objectHash["clusterCapacity"] ? ClusterCapacity.new(objectHash["clusterCapacity"]) : nil
    end
end

class ClusterAdmin
    attr_accessor :access, :cluster_admin_id, :username, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str access: [required] 
        self.access = objectHash["access"]

        # param int cluster_admin_id: [required] 
        self.cluster_admin_id = objectHash["clusterAdminID"]

        # param str username: [required] 
        self.username = objectHash["username"]

        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ListClusterAdminsResult
    attr_accessor :cluster_admins

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterAdmin cluster_admins: [required] Information about the cluster admin. 
        self.cluster_admins = Array.new(objectHash["clusterAdmins"].length){ |i| ClusterAdmin.new(objectHash["clusterAdmins"][i])}
    end
end

class SetSnmpTrapInfoResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class FibreChannelSession
    attr_accessor :initiator_wwpn, :node_id, :service_id, :target_wwpn, :volume_access_group_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # FibreChannelSession contains information about each Fibre Channel session that is visible to the cluster and what target ports it is visible on.
        # param str initiator_wwpn: [required] The WWPN of the initiator which is logged into the target port. 
        self.initiator_wwpn = objectHash["initiatorWWPN"]

        # param int node_id: [required] The node owning the Fibre Channel session. 
        self.node_id = objectHash["nodeID"]

        # param int service_id: [required] The service ID of the FService owning this Fibre Channel session 
        self.service_id = objectHash["serviceID"]

        # param str target_wwpn: [required] The WWPN of the target port involved in this session. 
        self.target_wwpn = objectHash["targetWWPN"]

        # param int volume_access_group_id:  The ID of the volume access group to which the initiatorWWPN belongs. If not in a volume access group, the value will be null. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]
    end
end

class ListFibreChannelSessionsResult
    attr_accessor :sessions

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Used to return information about the Fibre Channel sessions.
        # param FibreChannelSession sessions: [required] A list of FibreChannelSession objects with information about the Fibre Channel session. 
        self.sessions = Array.new(objectHash["sessions"].length){ |i| FibreChannelSession.new(objectHash["sessions"][i])}
    end
end

class GetNodeHardwareInfoResult
    attr_accessor :node_hardware_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param dict node_hardware_info: [required] Hardware information for the specified nodeID. 
        self.node_hardware_info = objectHash["nodeHardwareInfo"]
    end
end

class PrepareVirtualSnapshotRequest
    attr_accessor :virtual_volume_id, :name, :writable_snapshot, :calling_virtual_volume_host_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_id: [required] The ID of the Virtual Volume to clone. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

        # param str name:  The name for the newly-created volume. 
        self.name = objectHash["name"]

        # param bool writable_snapshot:  Will the snapshot be writable? 
        self.writable_snapshot = objectHash["writableSnapshot"]

        # param UUID calling_virtual_volume_host_id:  
        self.calling_virtual_volume_host_id = objectHash["callingVirtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["callingVirtualVolumeHostID"]) : nil
    end
end

class ResetDriveDetails
    attr_accessor :drive, :return_code, :stderr, :stdout

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str drive: [required] Drive name 
        self.drive = objectHash["drive"]

        # param int return_code: [required] 
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
        if(objectHash == nil)
            return
        end
        # param ResetDriveDetails drives: [required] Details of a single drive that is being reset. 
        self.drives = Array.new(objectHash["drives"].length){ |i| ResetDriveDetails.new(objectHash["drives"][i])}
    end
end

class ResetDrivesResult
    attr_accessor :details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ResetDrivesDetails details: [required] Details of drives that are being reset. 
        self.details = objectHash["details"] ? ResetDrivesDetails.new(objectHash["details"]) : nil
    end
end

class GetEfficiencyResult
    attr_accessor :timestamp, :compression, :deduplication, :thin_provisioning, :missing_volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param float compression:  The amount of space being saved by compressing data on a single volume. Stated as a ratio where "1" means data has been stored without being compressed. 
        self.compression = objectHash["compression"]

        # param float deduplication:  The amount of space being saved on a single volume by not duplicating data. Stated as a ratio. 
        self.deduplication = objectHash["deduplication"]

        # param float thin_provisioning:  The ratio of space used to the amount of space allocated for storing data. Stated as a ratio. 
        self.thin_provisioning = objectHash["thinProvisioning"]

        # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC). ISO 8601 data string. 
        self.timestamp = objectHash["timestamp"]

        # param int missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by GC being less than hour old, temporary network loss or restarted services since the GC cycle. 
        self.missing_volumes = objectHash["missingVolumes"]
    end
end

class EnableFeatureResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class AddLdapClusterAdminResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class GetClusterFullThresholdResult
    attr_accessor :block_fullness, :fullness, :max_metadata_over_provision_factor, :metadata_fullness, :slice_reserve_used_threshold_pct, :stage2_aware_threshold, :stage2_block_threshold_bytes, :stage3_block_threshold_bytes, :stage3_block_threshold_percent, :stage3_low_threshold, :stage4_critical_threshold, :stage4_block_threshold_bytes, :stage5_block_threshold_bytes, :sum_total_cluster_bytes, :sum_total_metadata_cluster_bytes, :sum_used_cluster_bytes, :sum_used_metadata_cluster_bytes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str block_fullness: [required] Current computed level of block fullness of the cluster. Possible values: <br/><b>stage1Happy</b>: No alerts or error conditions. <br/><b>stage2Aware</b>: 3 nodes of capacity available. <br/><b>stage3Low</b>: 2 nodes of capacity available. <br/><b>stage4Critical</b>: 1 node of capacity available. No new volumes or clones can be created. <br/><b>stage5CompletelyConsumed</b>: Completely consumed. Cluster is read-only, iSCSI connection is maintained but all writes are suspended. 
        self.block_fullness = objectHash["blockFullness"]

        # param str fullness: [required] Reflects the highest level of fullness between "blockFullness" and "metadataFullness". 
        self.fullness = objectHash["fullness"]

        # param int max_metadata_over_provision_factor: [required] A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created. 
        self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]

        # param str metadata_fullness: [required] Current computed level of metadata fullness of the cluster. 
        self.metadata_fullness = objectHash["metadataFullness"]

        # param int slice_reserve_used_threshold_pct: [required] Error condition; message sent to "Alerts" if the reserved slice utilization is greater than the sliceReserveUsedThresholdPct value returned. 
        self.slice_reserve_used_threshold_pct = objectHash["sliceReserveUsedThresholdPct"]

        # param int stage2_aware_threshold: [required] Awareness condition: Value that is set for "Stage 2" cluster threshold level. 
        self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

        # param int stage2_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage2 condition will exist. 
        self.stage2_block_threshold_bytes = objectHash["stage2BlockThresholdBytes"]

        # param int stage3_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage3 condition will exist. 
        self.stage3_block_threshold_bytes = objectHash["stage3BlockThresholdBytes"]

        # param int stage3_block_threshold_percent: [required] The percent value set for stage3. At this percent full, a warning will be posted in the Alerts log. 
        self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

        # param int stage3_low_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is getting low. 
        self.stage3_low_threshold = objectHash["stage3LowThreshold"]

        # param int stage4_critical_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is critically low. 
        self.stage4_critical_threshold = objectHash["stage4CriticalThreshold"]

        # param int stage4_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage4 condition will exist. 
        self.stage4_block_threshold_bytes = objectHash["stage4BlockThresholdBytes"]

        # param int stage5_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage5 condition will exist. 
        self.stage5_block_threshold_bytes = objectHash["stage5BlockThresholdBytes"]

        # param int sum_total_cluster_bytes: [required] Physical capacity of the cluster measured in bytes. 
        self.sum_total_cluster_bytes = objectHash["sumTotalClusterBytes"]

        # param int sum_total_metadata_cluster_bytes: [required] Total amount of space that can be used to store metadata. 
        self.sum_total_metadata_cluster_bytes = objectHash["sumTotalMetadataClusterBytes"]

        # param int sum_used_cluster_bytes: [required] Number of bytes used on the cluster. 
        self.sum_used_cluster_bytes = objectHash["sumUsedClusterBytes"]

        # param int sum_used_metadata_cluster_bytes: [required] Amount of space used on volume drives to store metadata. 
        self.sum_used_metadata_cluster_bytes = objectHash["sumUsedMetadataClusterBytes"]
    end
end

class Initiator
    attr_accessor :alias, :initiator_id, :initiator_name, :volume_access_groups, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Object containing characteristics of each initiator
        # param str alias: [required] The friendly name assigned to this initiator. (String) 
        self.alias = objectHash["alias"]

        # param int initiator_id: [required] The numeric ID of the initiator that has been created. (Integer) 
        self.initiator_id = objectHash["initiatorID"]

        # param str initiator_name: [required] The name of the initiator that has been created. (String) 
        self.initiator_name = objectHash["initiatorName"]

        # param int volume_access_groups: [required] A list of volumeAccessGroupIDs to which this initiator belongs. (Array of Integers) 
        self.volume_access_groups = objectHash["volumeAccessGroups"]

        # param dict attributes: [required] A set of JSON attributes assigned to this initiator. (JSON Object) 
        self.attributes = objectHash["attributes"]
    end
end

class ListInitiatorsResult
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Initiator initiators: [required] List of the initiator information. 
        self.initiators = Array.new(objectHash["initiators"].length){ |i| Initiator.new(objectHash["initiators"][i])}
    end
end

class PurgeDeletedVolumesResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class StorageContainer
    attr_accessor :name, :storage_container_id, :account_id, :protocol_endpoint_type, :initiator_secret, :target_secret, :status

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str name: [required] 
        self.name = objectHash["name"]

        # param UUID storage_container_id: [required] 
        self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

        # param int account_id: [required] 
        self.account_id = objectHash["accountID"]

        # param str protocol_endpoint_type: [required] 
        self.protocol_endpoint_type = objectHash["protocolEndpointType"]

        # param str initiator_secret: [required] 
        self.initiator_secret = objectHash["initiatorSecret"]

        # param str target_secret: [required] 
        self.target_secret = objectHash["targetSecret"]

        # param str status: [required] 
        self.status = objectHash["status"]
    end
end

class ModifyStorageContainerResult
    attr_accessor :storage_container

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param StorageContainer storage_container: [required] 
        self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil
    end
end

class MetadataHosts
    attr_accessor :dead_secondaries, :live_secondaries, :primary

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The volume services on which the volume metadata resides.
        # param int dead_secondaries: [required] Secondary metadata (slice) services that are in a dead state. 
        self.dead_secondaries = objectHash["deadSecondaries"]

        # param int live_secondaries: [required] Secondary metadata (slice) services that are currently in a "live" state. 
        self.live_secondaries = objectHash["liveSecondaries"]

        # param int primary: [required] The primary metadata (slice) services hosting the volume. 
        self.primary = objectHash["primary"]
    end
end

class VolumeStats
    attr_accessor :account_id, :actual_iops, :async_delay, :average_iopsize, :burst_iopscredit, :client_queue_depth, :desired_metadata_hosts, :latency_usec, :metadata_hosts, :non_zero_blocks, :read_bytes, :read_latency_usec, :read_ops, :throttle, :timestamp, :total_latency_usec, :unaligned_reads, :unaligned_writes, :volume_access_groups, :volume_id, :volume_size, :volume_utilization, :write_bytes, :write_latency_usec, :write_ops, :zero_blocks, :write_bytes_last_sample, :sample_period_msec, :read_bytes_last_sample, :read_ops_last_sample, :write_ops_last_sample, :virtual_volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Contains statistical data for an individual volume.
        # param int account_id: [required] AccountID of the volume owner. 
        self.account_id = objectHash["accountID"]

        # param int actual_iops: [required] Current actual IOPS to the volume in the last 500 milliseconds. 
        self.actual_iops = objectHash["actualIOPS"]

        # param str async_delay:  The length of time since the volume was last synced with the remote cluster. If the volume is not paired, this is null. <br/><br/> <br/><b>Note</b>: A target volume in an active replication state always has an async delay of 0 (zero). <br/>Target volumes are system-aware during replication and assume async delay is accurate at all times. 
        self.async_delay = objectHash["asyncDelay"]

        # param int average_iopsize: [required] Average size in bytes of recent I/O to the volume in the last 500 milliseconds. 
        self.average_iopsize = objectHash["averageIOPSize"]

        # param int burst_iopscredit: [required] The total number of IOP credits available to the user. When users are not using up to the max IOPS, credits are accrued. 
        self.burst_iopscredit = objectHash["burstIOPSCredit"]

        # param int client_queue_depth: [required] The number of outstanding read and write operations to the cluster. 
        self.client_queue_depth = objectHash["clientQueueDepth"]

        # param MetadataHosts desired_metadata_hosts: [required] The volume services being migrated to if the volume metadata is getting migrated between volume services. A "null" value means the volume is not migrating. 
        self.desired_metadata_hosts = objectHash["desiredMetadataHosts"] ? MetadataHosts.new(objectHash["desiredMetadataHosts"]) : nil

        # param int latency_usec: [required] The observed latency time, in microseconds, to complete operations to a volume.<br/> A "0" (zero) value means there is no I/O to the volume. 
        self.latency_usec = objectHash["latencyUSec"]

        # param MetadataHosts metadata_hosts: [required] The volume services on which the volume metadata resides. 
        self.metadata_hosts = objectHash["metadataHosts"] ? MetadataHosts.new(objectHash["metadataHosts"]) : nil

        # param int non_zero_blocks: [required] The number of 4KiB blocks with data after the last garbage collection operation has completed. 
        self.non_zero_blocks = objectHash["nonZeroBlocks"]

        # param int read_bytes: [required] Total bytes read by clients. 
        self.read_bytes = objectHash["readBytes"]

        # param int read_latency_usec: [required] The average time, in microseconds, to complete read operations. 
        self.read_latency_usec = objectHash["readLatencyUSec"]

        # param int read_ops: [required] Total read operations. 
        self.read_ops = objectHash["readOps"]

        # param float throttle: [required] A floating value between 0 and 1 that represents how much the system is throttling clients below their max IOPS because of re-replication of data, transient errors and snapshots taken. 
        self.throttle = objectHash["throttle"]

        # param str timestamp: [required] The current time in UTC. 
        self.timestamp = objectHash["timestamp"]

        # param int total_latency_usec: [required] The average time, in microseconds, to complete read and write operations to a volume. 
        self.total_latency_usec = objectHash["totalLatencyUSec"]

        # param int unaligned_reads: [required] For 512e volumes, the number of read operations that were not on a 4k sector boundary. High numbers of unaligned reads may indicate improper partition alignment. 
        self.unaligned_reads = objectHash["unalignedReads"]

        # param int unaligned_writes: [required] For 512e volumes, the number of write operations that were not on a 4k sector boundary. High numbers of unaligned writes may indicate improper partition alignment. 
        self.unaligned_writes = objectHash["unalignedWrites"]

        # param int volume_access_groups: [required] List of volume access group(s) to which a volume belongs. 
        self.volume_access_groups = objectHash["volumeAccessGroups"]

        # param int volume_id: [required] Volume ID of the volume. 
        self.volume_id = objectHash["volumeID"]

        # param int volume_size: [required] Total provisioned capacity in bytes. 
        self.volume_size = objectHash["volumeSize"]

        # param float volume_utilization: [required] A floating value that describes how much the client is using the volume. <br/><br/> Values:<br/>  0 = Client is not using the volume<br/> 1 = Client is using their max<br/> >1 = Client is using their burst 
        self.volume_utilization = objectHash["volumeUtilization"]

        # param int write_bytes: [required] Total bytes written by clients. 
        self.write_bytes = objectHash["writeBytes"]

        # param int write_latency_usec: [required] The average time, in microseconds, to complete write operations. 
        self.write_latency_usec = objectHash["writeLatencyUSec"]

        # param int write_ops: [required] Total write operations occurring on the volume. 
        self.write_ops = objectHash["writeOps"]

        # param int zero_blocks: [required] Total number of 4KiB blocks without data after the last round of garbage collection operation has completed. 
        self.zero_blocks = objectHash["zeroBlocks"]

        # param int write_bytes_last_sample: [required] The total number of bytes written to the volume during the last sample period. 
        self.write_bytes_last_sample = objectHash["writeBytesLastSample"]

        # param int sample_period_msec: [required] The length of the sample period in milliseconds. 
        self.sample_period_msec = objectHash["samplePeriodMSec"]

        # param int read_bytes_last_sample: [required] The total number of bytes read from the volume during the last sample period. 
        self.read_bytes_last_sample = objectHash["readBytesLastSample"]

        # param int read_ops_last_sample: [required] The total number of read operations durin gth elast sample period. 
        self.read_ops_last_sample = objectHash["readOpsLastSample"]

        # param int write_ops_last_sample: [required] The total number of write operations during the last sample period. 
        self.write_ops_last_sample = objectHash["writeOpsLastSample"]

        # param UUID virtual_volume_id: [required] If the volume of interest is associated with a virtual volume, this is the virtual volume ID. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil
    end
end

class ListVolumeStatsByVolumeAccessGroupResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] List of account activity information. <br/><b>Note</b>: The volumeID member is 0 for each entry, as the values represent the summation of all volumes owned by the account. 
        self.volume_stats = Array.new(objectHash["volumeStats"].length){ |i| VolumeStats.new(objectHash["volumeStats"][i])}
    end
end

class GetStorageContainerEfficiencyRequest
    attr_accessor :storage_container_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID storage_container_id: [required] The ID of the storage container for which to retrieve efficiency information. 
        self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil
    end
end

class ClusterConfig
    attr_accessor :cipi, :cluster, :ensemble, :mipi, :name, :node_id, :pending_node_id, :role, :sipi, :state

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
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

        # param int node_id:  
        self.node_id = objectHash["nodeID"]

        # param int pending_node_id:  
        self.pending_node_id = objectHash["pendingNodeID"]

        # param str role:  Identifies the role of the node 
        self.role = objectHash["role"]

        # param str sipi:  Network interface used for storage. 
        self.sipi = objectHash["sipi"]

        # param str state:  
        self.state = objectHash["state"]
    end
end

class SetClusterConfigResult
    attr_accessor :cluster

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterConfig cluster: [required] Settings for the cluster. All new and current settings are returned. 
        self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
    end
end

class VolumeQOS
    attr_accessor :min_iops, :max_iops, :burst_iops, :burst_time, :curve

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Quality of Service (QoS) Result values are used on SolidFire volumes to provision performance expectations.
        # param int min_iops: [required] Desired minimum 4KB IOPS to guarantee. The allowed IOPS will only drop below this level if all volumes have been capped at their min IOPS value and there is still insufficient performance capacity. 
        self.min_iops = objectHash["minIOPS"]

        # param int max_iops: [required] Desired maximum 4KB IOPS allowed over an extended period of time. 
        self.max_iops = objectHash["maxIOPS"]

        # param int burst_iops: [required] Maximum "peak" 4KB IOPS allowed for short periods of time. Allows for bursts of I/O activity over the normal max IOPS value. 
        self.burst_iops = objectHash["burstIOPS"]

        # param int burst_time: [required] The length of time burst IOPS is allowed. The value returned is represented in time units of seconds. <br/><b>Note</b>: this value is calculated by the system based on IOPS set for QoS. 
        self.burst_time = objectHash["burstTime"]

        # param int curve: [required] The curve is a set of key-value pairs. The keys are I/O sizes in bytes. The values represent the cost performing an IOP at a specific I/O size. The curve is calculated relative to a 4096 byte operation set at 100 IOPS. 
        self.curve = objectHash["curve"]
    end
end

class SnapshotReplication
    attr_accessor :state, :state_details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str state: [required] The state of the snapshot replication. 
        self.state = objectHash["state"]

        # param str state_details: [required] Reserved for future use. 
        self.state_details = objectHash["stateDetails"]
    end
end

class RemoteReplication
    attr_accessor :mode, :pause_limit, :remote_service_id, :resume_details, :snapshot_replication, :state, :state_details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Details on the volume replication.
        # param str mode: [required] Volume replication mode.<br/> Possible values:<br/> <b>Async</b>: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster.<br/> <b>Sync</b>: Source acknowledges write when the data is stored locally and on the remote cluster.<br/> <b>SnapshotsOnly</b>: Only snapshots created on the source cluster will be replicated. Active writes from the source volume will not be replicated.<br/> 
        self.mode = objectHash["mode"]

        # param int pause_limit: [required] The number of occurring write ops before auto-pausing, on a per volume pair level. 
        self.pause_limit = objectHash["pauseLimit"]

        # param int remote_service_id: [required] The remote slice service ID. 
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
        if(objectHash == nil)
            return
        end
        # The Volume Pair Info is an object containing information about a volume that is paired on a remote cluster.
        # If the volume is not paired, this object is null.
        # param int cluster_pair_id: [required] The remote cluster a volume is paired with. 
        self.cluster_pair_id = objectHash["clusterPairID"]

        # param int remote_volume_id: [required] The VolumeID on the remote cluster a volume is paired with. 
        self.remote_volume_id = objectHash["remoteVolumeID"]

        # param int remote_slice_id: [required] The SliceID on the remote cluster a volume is paired with. 
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
        if(objectHash == nil)
            return
        end
        # Volumes Info is an object containing information about a volume.
        # The return objects only include "configured" information about the volume and not runtime or usage information.
        # Information about paired volumes will also be returned.
        # param int volume_id: [required] Unique VolumeID for the volume. 
        self.volume_id = objectHash["volumeID"]

        # param str name: [required] Name of the volume as provided at creation time. 
        self.name = objectHash["name"]

        # param int account_id: [required] Unique AccountID for the account. 
        self.account_id = objectHash["accountID"]

        # param str create_time: [required] UTC formatted time the volume was created. 
        self.create_time = objectHash["createTime"]

        # param str status: [required] Current status of the volume init: A volume that is being initialized and is not ready for connections. active: An active volume ready for connections. 
        self.status = objectHash["status"]

        # param str access: [required] Access allowed for the volume <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Designated as a target volume in a replicated volume pair. 
        self.access = objectHash["access"]

        # param bool enable512e: [required] If "true", the volume provides 512 byte sector emulation. 
        self.enable512e = objectHash["enable512e"]

        # param str iqn: [required] Volume iSCSI Qualified Name. 
        self.iqn = objectHash["iqn"]

        # param str scsi_euidevice_id: [required] Globally unique SCSI device identifier for the volume in EUI-64 based 16-byte format. 
        self.scsi_euidevice_id = objectHash["scsiEUIDeviceID"]

        # param str scsi_naadevice_id: [required] Globally unique SCSI device identifier for the volume in NAA IEEE Registered Extended format. 
        self.scsi_naadevice_id = objectHash["scsiNAADeviceID"]

        # param VolumeQOS qos: [required] Quality of service settings for this volume. 
        self.qos = objectHash["qos"] ? VolumeQOS.new(objectHash["qos"]) : nil

        # param int volume_access_groups: [required] List of volume access groups to which a volume belongs. 
        self.volume_access_groups = objectHash["volumeAccessGroups"]

        # param VolumePair volume_pairs: [required] Information about a paired volume. Available only if a volume is paired. @see VolumePairs for return values. 
        self.volume_pairs = Array.new(objectHash["volumePairs"].length){ |i| VolumePair.new(objectHash["volumePairs"][i])}

        # param str delete_time:  The time this volume was deleted. If this has no value, the volume has not yet been deleted. 
        self.delete_time = objectHash["deleteTime"]

        # param str purge_time:  The time this volume will be purged from the system. If this has no value, the volume has not yet been deleted (and is not scheduled for purging). 
        self.purge_time = objectHash["purgeTime"]

        # param int slice_count: [required] The number of slices backing this volume. In the current software, this value will always be 1. 
        self.slice_count = objectHash["sliceCount"]

        # param int total_size: [required] Total size of this volume in bytes. 
        self.total_size = objectHash["totalSize"]

        # param int block_size: [required] Size of the blocks on the volume. 
        self.block_size = objectHash["blockSize"]

        # param UUID virtual_volume_id: [required] Virtual volume ID this volume backs. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ModifyVolumeResult
    attr_accessor :volume

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volume: [required] Object containing information about the newly modified volume. 
        self.volume = objectHash["volume"] ? Volume.new(objectHash["volume"]) : nil
    end
end

class StartVolumePairingResult
    attr_accessor :volume_pairing_key

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str volume_pairing_key: [required] A string of characters that is used by the "CompleteVolumePairing" API method. 
        self.volume_pairing_key = objectHash["volumePairingKey"]
    end
end

class CreateVolumeAccessGroupRequest
    attr_accessor :name, :initiators, :volumes, :virtual_network_id, :virtual_network_tags, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str name: [required] Name of the volume access group. It is not required to be unique, but recommended. 
        self.name = objectHash["name"]

        # param str initiators:  List of initiators to include in the volume access group. If unspecified, the access group will start out without configured initiators. 
        self.initiators = objectHash["initiators"]

        # param int volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group will start without any volumes. 
        self.volumes = objectHash["volumes"]

        # param int virtual_network_id:  The ID of the SolidFire Virtual Network ID to associate the volume access group with. 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tags:  The ID of the VLAN Virtual Network Tag to associate the volume access group with. 
        self.virtual_network_tags = objectHash["virtualNetworkTags"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ListDriveStatsRequest
    attr_accessor :drives

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drives:  Optional list of DriveIDs for which to return drive statistics. If you omit this parameter, measurements for all drives are returned. 
        self.drives = objectHash["drives"]
    end
end

class ClusterStats
    attr_accessor :cluster_utilization, :client_queue_depth, :read_bytes, :read_ops, :timestamp, :write_bytes, :write_ops

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param float cluster_utilization: [required] The amount of cluster capacity being utilized. 
        self.cluster_utilization = objectHash["clusterUtilization"]

        # param int client_queue_depth: [required] 
        self.client_queue_depth = objectHash["clientQueueDepth"]

        # param int read_bytes: [required] Total bytes read by clients. 
        self.read_bytes = objectHash["readBytes"]

        # param int read_ops: [required] Total read operations. 
        self.read_ops = objectHash["readOps"]

        # param str timestamp: [required] Current time in UTC format. ISO 8601 date string. 
        self.timestamp = objectHash["timestamp"]

        # param int write_bytes: [required] Total bytes written by clients. 
        self.write_bytes = objectHash["writeBytes"]

        # param int write_ops: [required] Total write operations. 
        self.write_ops = objectHash["writeOps"]
    end
end

class GetClusterStatsResult
    attr_accessor :cluster_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterStats cluster_stats: [required] 
        self.cluster_stats = objectHash["clusterStats"] ? ClusterStats.new(objectHash["clusterStats"]) : nil
    end
end

class VirtualVolumeTask
    attr_accessor :virtual_volume_task_id, :virtualvolume_id, :clone_virtual_volume_id, :status, :operation, :virtual_volume_host_id, :parent_metadata, :parent_total_size, :parent_used_size, :cancelled

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
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

        # param int parent_total_size: [required] 
        self.parent_total_size = objectHash["parentTotalSize"]

        # param int parent_used_size: [required] 
        self.parent_used_size = objectHash["parentUsedSize"]

        # param bool cancelled: [required] 
        self.cancelled = objectHash["cancelled"]
    end
end

class VirtualVolumeTaskResult
    attr_accessor :task

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VirtualVolumeTask task: [required] Returns the state of a VVol Async Task. 
        self.task = objectHash["task"] ? VirtualVolumeTask.new(objectHash["task"]) : nil
    end
end

class ListVolumesResult
    attr_accessor :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] List of volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class RemoveVolumesFromVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id, :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to modify. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param int volumes: [required] List of volumes to remove from this volume access group. 
        self.volumes = objectHash["volumes"]
    end
end

class ListVolumeStatsRequest
    attr_accessor :volume_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_ids:  
        self.volume_ids = objectHash["volumeIDs"]
    end
end

class AddAccountResult
    attr_accessor :account_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] AccountID for the newly created Account. 
        self.account_id = objectHash["accountID"]
    end
end

class RemoveClusterPairResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class GetClusterHardwareInfoRequest
    attr_accessor :type

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str type:  Include only a certain type of hardware information in the response. Can be one of the following:drives: List only drive information in the response.nodes: List only node information in the response.all: Include both drive and node information in the response.If this parameter is omitted, a type of "all" is assumed. 
        self.type = objectHash["type"]
    end
end

class CancelGroupCloneRequest
    attr_accessor :group_clone_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int group_clone_id: [required] cloneID for the ongoing clone process. 
        self.group_clone_id = objectHash["groupCloneID"]
    end
end

class NodeStatsInfo
    attr_accessor :c_bytes_in, :c_bytes_out, :cpu, :m_bytes_in, :m_bytes_out, :network_utilization_cluster, :network_utilization_storage, :node_id, :s_bytes_in, :s_bytes_out, :timestamp, :used_memory

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int c_bytes_in: [required] Bytes in on the cluster interface. 
        self.c_bytes_in = objectHash["cBytesIn"]

        # param int c_bytes_out: [required] Bytes out on the cluster interface. 
        self.c_bytes_out = objectHash["cBytesOut"]

        # param int cpu: [required] CPU Usage % 
        self.cpu = objectHash["cpu"]

        # param int m_bytes_in: [required] Bytes in on the management interface. 
        self.m_bytes_in = objectHash["mBytesIn"]

        # param int m_bytes_out: [required] Bytes out on the management interface. 
        self.m_bytes_out = objectHash["mBytesOut"]

        # param int network_utilization_cluster: [required] Network interface utilization (in %) for the cluster network interface. 
        self.network_utilization_cluster = objectHash["networkUtilizationCluster"]

        # param int network_utilization_storage: [required] Network interface utilization (in %) for the storage network interface. 
        self.network_utilization_storage = objectHash["networkUtilizationStorage"]

        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param int s_bytes_in: [required] Bytes in on the storage interface. 
        self.s_bytes_in = objectHash["sBytesIn"]

        # param int s_bytes_out: [required] Bytes out on the storage interface. 
        self.s_bytes_out = objectHash["sBytesOut"]

        # param str timestamp: [required] Current time in UTC format ISO 8691 date string. 
        self.timestamp = objectHash["timestamp"]

        # param int used_memory: [required] Total memory usage in bytes. 
        self.used_memory = objectHash["usedMemory"]
    end
end

class GetNodeStatsResult
    attr_accessor :node_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NodeStatsInfo node_stats: [required] Node activity information. 
        self.node_stats = objectHash["nodeStats"] ? NodeStatsInfo.new(objectHash["nodeStats"]) : nil
    end
end

class ListVirtualVolumesRequest
    attr_accessor :details, :limit, :recursive, :start_virtual_volume_id, :virtual_volume_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool details:  Possible values:true: Include more details about each VVOL in the response.false: Include the standard level of detail about each VVOL in the response. 
        self.details = objectHash["details"]

        # param int limit:  The maximum number of virtual volumes to list. 
        self.limit = objectHash["limit"]

        # param bool recursive:  Possible values:true: Include information about the children of each VVOL in the response.false: Do not include information about the children of each VVOL in the response. 
        self.recursive = objectHash["recursive"]

        # param UUID start_virtual_volume_id:  The ID of the virtual volume at which to begin the list. 
        self.start_virtual_volume_id = objectHash["startVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["startVirtualVolumeID"]) : nil

        # param UUID virtual_volume_ids:  A list of virtual volume  IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
        self.virtual_volume_ids = Array.new(objectHash["virtualVolumeIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["virtualVolumeIDs"][i])}
    end
end

class ListNodeFibreChannelPortInfoRequest
    attr_accessor :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool force:  Specify force=true to call method on all member nodes of the cluster. 
        self.force = objectHash["force"]
    end
end

class ListVirtualVolumeTasksResult
    attr_accessor :tasks

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VirtualVolumeTask tasks: [required] List of VVol Async Tasks. 
        self.tasks = Array.new(objectHash["tasks"].length){ |i| VirtualVolumeTask.new(objectHash["tasks"][i])}
    end
end

class AddedNode
    attr_accessor :node_id, :pending_node_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param int pending_node_id: [required] 
        self.pending_node_id = objectHash["pendingNodeID"]
    end
end

class AddNodesResult
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param AddedNode nodes: [required] An array of objects mapping the previous "pendingNodeID" to the "nodeID". 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| AddedNode.new(objectHash["nodes"][i])}
    end
end

class DriveStats
    attr_accessor :failed_die_count, :active_sessions, :drive_id, :life_remaining_percent, :lifetime_read_bytes, :lifetime_write_bytes, :power_on_hours, :read_bytes, :read_ops, :reallocated_sectors, :reserve_capacity_percent, :timestamp, :total_capacity, :used_capacity, :used_memory, :write_bytes, :write_ops

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int active_sessions:  
        self.active_sessions = objectHash["activeSessions"]

        # param int drive_id:  
        self.drive_id = objectHash["driveID"]

        # param int failed_die_count: [required] 
        self.failed_die_count = objectHash["failedDieCount"]

        # param int life_remaining_percent: [required] 
        self.life_remaining_percent = objectHash["lifeRemainingPercent"]

        # param int lifetime_read_bytes: [required] 
        self.lifetime_read_bytes = objectHash["lifetimeReadBytes"]

        # param int lifetime_write_bytes: [required] 
        self.lifetime_write_bytes = objectHash["lifetimeWriteBytes"]

        # param int power_on_hours: [required] 
        self.power_on_hours = objectHash["powerOnHours"]

        # param int read_bytes: [required] 
        self.read_bytes = objectHash["readBytes"]

        # param int read_ops: [required] 
        self.read_ops = objectHash["readOps"]

        # param int reallocated_sectors: [required] 
        self.reallocated_sectors = objectHash["reallocatedSectors"]

        # param int reserve_capacity_percent: [required] 
        self.reserve_capacity_percent = objectHash["reserveCapacityPercent"]

        # param str timestamp: [required] 
        self.timestamp = objectHash["timestamp"]

        # param int total_capacity: [required] 
        self.total_capacity = objectHash["totalCapacity"]

        # param int used_capacity:  
        self.used_capacity = objectHash["usedCapacity"]

        # param int used_memory: [required] 
        self.used_memory = objectHash["usedMemory"]

        # param int write_bytes: [required] 
        self.write_bytes = objectHash["writeBytes"]

        # param int write_ops: [required] 
        self.write_ops = objectHash["writeOps"]
    end
end

class ListDriveStatsResult
    attr_accessor :drive_stats, :errors

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param DriveStats drive_stats: [required] List of drive activity information for each drive. 
        self.drive_stats = Array.new(objectHash["driveStats"].length){ |i| DriveStats.new(objectHash["driveStats"][i])}

        # param dict errors: [required] If there are errors retrieving information about a drive, this list contains the driveID and associated error message. Always present, and empty if there are no errors. 
        self.errors = objectHash["errors"]
    end
end

class BulkVolumeJob
    attr_accessor :bulk_volume_id, :create_time, :elapsed_time, :format, :key, :percent_complete, :remaining_time, :src_volume_id, :status, :script, :snapshot_id, :type, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int bulk_volume_id: [required] The internal bulk volume job ID. 
        self.bulk_volume_id = objectHash["bulkVolumeID"]

        # param str create_time: [required] Timestamp created for the bulk volume job. 
        self.create_time = objectHash["createTime"]

        # param int elapsed_time: [required] The number of seconds since the job began. 
        self.elapsed_time = objectHash["elapsedTime"]

        # param str format: [required] Format is either "compressed" or "native". 
        self.format = objectHash["format"]

        # param str key: [required] The unique key created by the bulk volume session. 
        self.key = objectHash["key"]

        # param int percent_complete: [required] The completed percentage reported by the operation. 
        self.percent_complete = objectHash["percentComplete"]

        # param int remaining_time: [required] The estimated time remaining in seconds. 
        self.remaining_time = objectHash["remainingTime"]

        # param int src_volume_id: [required] The source volume ID. 
        self.src_volume_id = objectHash["srcVolumeID"]

        # param str status: [required] Can be one of the following: <br/><b>preparing</b> <br/><b>active</b> <br/><b>done</b> <br/><b>failed</b> 
        self.status = objectHash["status"]

        # param str script: [required] The name of the script if one is provided. 
        self.script = objectHash["script"]

        # param int snapshot_id: [required] ID of the snapshot if a snapshot is in the source of the bulk volume job. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str type: [required] Can be one of the following: <br/><b>read</b> <br/><b>write</b> 
        self.type = objectHash["type"]

        # param dict attributes: [required] JSON attributes on the bulk volume job. 
        self.attributes = objectHash["attributes"]
    end
end

class ListBulkVolumeJobsResult
    attr_accessor :bulk_volume_jobs

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param BulkVolumeJob bulk_volume_jobs: [required] An array of information for each bulk volume job. 
        self.bulk_volume_jobs = Array.new(objectHash["bulkVolumeJobs"].length){ |i| BulkVolumeJob.new(objectHash["bulkVolumeJobs"][i])}
    end
end

class DeleteGroupSnapshotResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListActiveVolumesResult
    attr_accessor :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] List of active volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class ListVirtualVolumeBindingsRequest
    attr_accessor :virtual_volume_binding_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_volume_binding_ids:  
        self.virtual_volume_binding_ids = objectHash["virtualVolumeBindingIDs"]
    end
end

class StartBulkVolumeWriteResult
    attr_accessor :async_handle, :key, :url

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_handle: [required] ID of the async process to be checked for completion. 
        self.async_handle = objectHash["asyncHandle"]

        # param str key: [required] Opaque key uniquely identifying the session. 
        self.key = objectHash["key"]

        # param str url: [required] URL to access the node's web server 
        self.url = objectHash["url"]
    end
end

class ListVolumeStatsByVolumeAccessGroupRequest
    attr_accessor :volume_access_groups

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_groups:  An array of VolumeAccessGroupIDs for which volume activity is returned. If no VolumeAccessGroupID is specified, stats for all volume access groups is returned. 
        self.volume_access_groups = objectHash["volumeAccessGroups"]
    end
end

class AddInitiatorsToVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id, :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to modify. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param str initiators: [required] List of initiators to add to the volume access group. 
        self.initiators = objectHash["initiators"]
    end
end

class Platform
    attr_accessor :node_type, :chassis_type, :cpu_model, :node_memory_gb

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str node_type: [required] SolidFire's name for this platform. 
        self.node_type = objectHash["nodeType"]

        # param str chassis_type: [required] Name of the chassis (example: "R620"). 
        self.chassis_type = objectHash["chassisType"]

        # param str cpu_model: [required] The model of CPU used on this platform. 
        self.cpu_model = objectHash["cpuModel"]

        # param int node_memory_gb: [required] The amount of memory on this platform in GiB. 
        self.node_memory_gb = objectHash["nodeMemoryGB"]
    end
end

class Node
    attr_accessor :node_id, :associated_master_service_id, :associated_fservice_id, :fibre_channel_target_port_group, :name, :platform_info, :software_version, :cip, :cipi, :mip, :mipi, :sip, :sipi, :uuid, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # A node refers to an individual machine in a cluster.
        # Each active node hosts a master service, which is responsible for managing the drives and other services on its node.
        # After a node is made active, its drives will become available for addition to the cluster.
        # param int node_id: [required] The unique identifier for this node. 
        self.node_id = objectHash["nodeID"]

        # param int associated_master_service_id: [required] The master service responsible for controlling other services on this node. 
        self.associated_master_service_id = objectHash["associatedMasterServiceID"]

        # param int associated_fservice_id: [required] 
        self.associated_fservice_id = objectHash["associatedFServiceID"]

        # param str fibre_channel_target_port_group: [required] 
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

        # param dict attributes: [required] 
        self.attributes = objectHash["attributes"]
    end
end

class PendingNode
    attr_accessor :pending_node_id, :assigned_node_id, :name, :compatible, :platform_info, :cip, :cipi, :mip, :mipi, :sip, :sipi, :software_version, :uuid

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # A "pending node" is one that has not yet joined the cluster.
        # It can be added to a cluster using the AddNode method.
        # param int pending_node_id: [required] 
        self.pending_node_id = objectHash["pendingNodeID"]

        # param int assigned_node_id: [required] 
        self.assigned_node_id = objectHash["AssignedNodeID"]

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

class ListAllNodesResult
    attr_accessor :nodes, :pending_nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Node nodes: [required] 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| Node.new(objectHash["nodes"][i])}

        # param PendingNode pending_nodes: [required] 
        self.pending_nodes = Array.new(objectHash["pendingNodes"].length){ |i| PendingNode.new(objectHash["pendingNodes"][i])}
    end
end

class EnableLdapAuthenticationRequest
    attr_accessor :server_uris, :auth_type, :group_search_base_dn, :group_search_custom_filter, :group_search_type, :search_bind_dn, :search_bind_password, :user_dntemplate, :user_search_base_dn, :user_search_filter

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str auth_type:  Identifies which user authentcation method will be used. <br/> Must be one of the following:<br/> <b>DirectBind</b><br/> <b>SearchAndBind</b> (default) 
        self.auth_type = objectHash["authType"]

        # param str group_search_base_dn:  The base DN of the tree to start the group search (will do a subtree search from here). 
        self.group_search_base_dn = objectHash["groupSearchBaseDN"]

        # param str group_search_custom_filter:  REQUIRED for CustomFilter<br/> For use with the CustomFilter search type, an LDAP filter to use to return the DNs of a user's groups.<br/> The string can have placeholder text of %USERNAME% and %USERDN% to be replaced with their username and full userDN as needed. 
        self.group_search_custom_filter = objectHash["groupSearchCustomFilter"]

        # param str group_search_type:  Controls the default group search filter used, can be one of the following:<br/> <b>NoGroups</b>: No group support.<br/> <b>ActiveDirectory</b>: (default) Nested membership of all of a user's AD groups.<br/> <b>MemberDN</b>: MemberDN style groups (single-level). 
        self.group_search_type = objectHash["groupSearchType"]

        # param str search_bind_dn:  REQUIRED for SearchAndBind<br/> A fully qualified DN to log in with to perform an LDAP search for the user (needs read access to the LDAP directory). 
        self.search_bind_dn = objectHash["searchBindDN"]

        # param str search_bind_password:  REQUIRED for SearchAndBind<br/> The password for the searchBindDN account used for searching. 
        self.search_bind_password = objectHash["searchBindPassword"]

        # param str server_uris: [required] A list of LDAP server URIs (examples: "ldap://1.2.3.4" and ldaps://1.2.3.4:123") 
        self.server_uris = objectHash["serverURIs"]

        # param str user_dntemplate:  REQUIRED for DirectBind<br/> A string that is used to form a fully qualified user DN.<br/> The string should have the placeholder text "%USERNAME%" which will be replaced with the username of the authenticating user. 
        self.user_dntemplate = objectHash["userDNTemplate"]

        # param str user_search_base_dn:  REQUIRED for SearchAndBind The base DN of the tree used to start the search (will do a subtree search from here). 
        self.user_search_base_dn = objectHash["userSearchBaseDN"]

        # param str user_search_filter:  REQUIRED for SearchAndBind.<br/> The LDAP filter to use.<br/> The string should have the placeholder text "%USERNAME%" which will be replaced with the username of the authenticating user.<br/> Example: (&(objectClass=person) (sAMAccountName=%USERNAME%)) will use the sAMAccountName field in Active Directory to match the nusername entered at cluster login. 
        self.user_search_filter = objectHash["userSearchFilter"]
    end
end

class SnmpNetwork
    attr_accessor :access, :cidr, :community, :network

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The SNMP network object contains information about SNMP configuration for the cluster nodes. SNMP v3 is supported on SolidFire clusters.
        # param str access: [required] <br/><b>ro</b>: read-only access.* <br/><b>rw</b>: for read-write access. <br/><b>rosys</b>: for read-only access to a restricted set of system information *SolidFire recommends that all networks other than the default "localhost" be set to "ro" access, because all SolidFire MIB objects are read-only. 
        self.access = objectHash["access"]

        # param int cidr: [required] A CIDR network mask. This network mask must be an integer greater than or equal to 0, and less than or equal to 32. It must also not be equal to 31. 
        self.cidr = objectHash["cidr"]

        # param str community: [required] SNMP community string. 
        self.community = objectHash["community"]

        # param str network: [required] This parameter along with the cidr variable is used to control which network the access and community string apply to. The special value of "default" is used to specify an entry that applies to all networks. The cidr mask is ignored when network value is either a host name or default. 
        self.network = objectHash["network"]
    end
end

class SnmpV3UsmUser
    attr_accessor :access, :name, :password, :passphrase, :sec_level

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The SNMP v3 usmUser object is used with the API method SetSnmpInfo to configure SNMP on the cluster.
        # param str access: [required] <br/><b>rouser</b>: read-only access.* <br/><b>rwuser</b>: for read-write access. <br/><b>rosys</b>: for read-only access to a restricted set of system information *SolidFire recommends that all USM users be set to "rouser" access, because all SolidFire MIB objects are read-only. 
        self.access = objectHash["access"]

        # param str name: [required] The name of the user. Must contain at least one character, but no more than 32 characters. Blank spaces are not allowed. 
        self.name = objectHash["name"]

        # param str password: [required] The password of the user. Must be between 8 and 255 characters long (inclusive). Blank spaces are not allowed. Required if "secLevel" is "auth" or "priv." 
        self.password = objectHash["password"]

        # param str passphrase: [required] The passphrase of the user. Must be between 8 and 255 characters long (inclusive). Blank spaces are not allowed. Required if "secLevel" is "priv." 
        self.passphrase = objectHash["passphrase"]

        # param str sec_level: [required] <br/><b>noauth</b>: No password or passphrase is required. <br/><b>auth</b>: A password is required for user access. <br/><b>priv</b>: A password and passphrase is required for user access. 
        self.sec_level = objectHash["secLevel"]
    end
end

class GetSnmpInfoResult
    attr_accessor :networks, :enabled, :snmp_v3_enabled, :usm_users

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpNetwork networks: [required] List of networks and access types enabled for SNMP. <br/><br/> <b>Note</b>: "networks" will only be present if SNMP V3 is disabled. 
        self.networks = Array.new(objectHash["networks"].length){ |i| SnmpNetwork.new(objectHash["networks"][i])}

        # param bool enabled: [required] If the nodes in the cluster are configured for SNMP. 
        self.enabled = objectHash["enabled"]

        # param bool snmp_v3_enabled: [required] If the nodes in the cluster are configured for SNMP v3. 
        self.snmp_v3_enabled = objectHash["snmpV3Enabled"]

        # param SnmpV3UsmUser usm_users: [required] If SNMP v3 is enabled, the values returned is a list of user access parameters for SNMP information from the cluster. This will be returned instead of the "networks" parameter. 
        self.usm_users = Array.new(objectHash["usmUsers"].length){ |i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
    end
end

class BackupTarget
    attr_accessor :name, :backup_target_id, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The object containing information about a backup target.
        # param str name: [required] Name for the backup target. 
        self.name = objectHash["name"]

        # param int backup_target_id: [required] Unique identifier assigned to the backup target. 
        self.backup_target_id = objectHash["backupTargetID"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ListBackupTargetsResult
    attr_accessor :backup_targets

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param BackupTarget backup_targets: [required] Objects returned for each backup target. 
        self.backup_targets = Array.new(objectHash["backupTargets"].length){ |i| BackupTarget.new(objectHash["backupTargets"][i])}
    end
end

class AddDrivesResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class TestConnectEnsembleRequest
    attr_accessor :ensemble

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str ensemble:  A comma-separated list of ensemble node CIPs for connectivity testing 
        self.ensemble = objectHash["ensemble"]
    end
end

class UpdateBulkVolumeStatusResult
    attr_accessor :status, :url, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str status: [required] Status of the session requested. Returned status:<br/> <br/><b>preparing</b> <br/><b>active</b> <br/><b>done</b> <br/><b>failed</b> 
        self.status = objectHash["status"]

        # param str url: [required] The URL to access the node's web server provided only if the session is still active. 
        self.url = objectHash["url"]

        # param dict attributes: [required] Returns attributes that were specified in the BulkVolumeStatusUpdate method. Values are returned if they have changed or not. 
        self.attributes = objectHash["attributes"]
    end
end

class QoS
    attr_accessor :min_iops, :max_iops, :burst_iops, :burst_time

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Quality of Service (QoS) values are used on SolidFire volumes to provision performance expectations.
        # Minimum, maximum and burst QoS values can be set within the ranges specified in the QoS table below.
        # <br/><br/>
        # Volumes created without specified QoS values are created with the Default values listed below.
        # Default values can be found by running the GetDefaultQoS method.
        # <br/><br/>
        # <b>minIOPS</b> Min: 100/50 (v7.0/v8.0), Default: 100, Max: 15,000<br/>
        # <b>maxIOPS</b> Min: 100/50 (v7.0/v8.0), Default: 15,000, Max: 100,000<br/>
        # <b>burstIOPS</b> Min: 100/50 (v7.0/v8.0), Default: 15,000, Max: 100,000<br/>
        # param int min_iops:  Desired minimum 4KB IOPS to guarantee. The allowed IOPS will only drop below this level if all volumes have been capped at their minimum IOPS value and there is still insufficient performance capacity. 
        self.min_iops = objectHash["minIOPS"]

        # param int max_iops:  Desired maximum 4KB IOPS allowed over an extended period of time. 
        self.max_iops = objectHash["maxIOPS"]

        # param int burst_iops:  Maximum "peak" 4KB IOPS allowed for short periods of time. Allows for bursts of I/O activity over the normal max IOPS value. 
        self.burst_iops = objectHash["burstIOPS"]

        # param int burst_time:  The length of time burst IOPS is allowed. The value returned is represented in time units of seconds. <br/><b>Note</b>: this value is calculated by the system based on IOPS set for QoS. 
        self.burst_time = objectHash["burstTime"]
    end
end

class ModifyVolumesRequest
    attr_accessor :volume_ids, :account_id, :access, :attributes, :qos, :total_size

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_ids: [required] A list of volumeIDs for the volumes to be modified. 
        self.volume_ids = objectHash["volumeIDs"]

        # param int account_id:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used. 
        self.account_id = objectHash["accountID"]

        # param str access:  Access allowed for the volume. Possible values:readOnly: Only read operations are allowed.readWrite: Reads and writes are allowed.locked: No reads or writes are allowed.If not specified, the access value does not change.replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked.If a value is not specified, the access value does not change.  
        self.access = objectHash["access"]

        # param dict attributes:  
        self.attributes = objectHash["attributes"]

        # param QoS qos:  New quality of service settings for this volume.If not specified, the QoS settings are not changed. 
        self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

        # param int total_size:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB in size. This parameter can only be used to increase the size of a volume. 
        self.total_size = objectHash["totalSize"]
    end
end

class GetAccountByNameRequest
    attr_accessor :username

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str username: [required] Username for the account. 
        self.username = objectHash["username"]
    end
end

class RemoveAccountResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ModifyGroupSnapshotResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListPendingNodesResult
    attr_accessor :pending_nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param PendingNode pending_nodes: [required] 
        self.pending_nodes = Array.new(objectHash["pendingNodes"].length){ |i| PendingNode.new(objectHash["pendingNodes"][i])}
    end
end

class SetSnmpACLResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class SetDefaultQoSResult
    attr_accessor :min_iops, :max_iops, :burst_iops

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int min_iops: [required] The minimum number of sustained IOPS that are provided by the cluster to a volume.  
        self.min_iops = objectHash["minIOPS"]

        # param int max_iops: [required] The maximum number of sustained IOPS that are provided by the cluster to a volume. 
        self.max_iops = objectHash["maxIOPS"]

        # param int burst_iops: [required] The maximum number of IOPS allowed in a short burst scenario. 
        self.burst_iops = objectHash["burstIOPS"]
    end
end

class ScheduleInfo
    attr_accessor :volume_ids, :snapshot_name, :enable_remote_replication, :retention

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_ids:  A list of volume IDs to be included in the group snapshot. 
        self.volume_ids = objectHash["volumeIDs"]

        # param str snapshot_name:  The snapshot name to be used.  
        self.snapshot_name = objectHash["snapshotName"]

        # param bool enable_remote_replication:  Indicates if the snapshot should be included in remote replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]

        # param str retention:  The amount of time the snapshot will be retained in HH:mm:ss. 
        self.retention = objectHash["retention"]
    end
end

class Schedule
    attr_accessor :frequency, :has_error, :last_run_status, :last_run_time_start, :paused, :recurring, :run_next_interval, :schedule_id, :schedule_info, :name, :starting_date, :to_be_deleted

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Schedule is an object containing information about each schedule created to autonomously make a snapshot of a volume. The return object includes information for all schedules. If scheduleID is used to identify a specific schedule then only information for that scheduleID is returned. Schedules information is returned with the API method, see ListSchedules on the SolidFire API guide page 245.
        # param Frequency frequency: [required] Indicates the frequency of the schedule occurrence. Set this to a type that inherits from Frequency.<br/> Valid types are:<br/> DayOfWeekFrequency<br/> DayOfMonthFrequency<br/> TimeIntervalFrequency 
        self.frequency = objectHash["frequency"] ? Frequency.new(objectHash["frequency"]) : nil

        # param bool has_error:  Indicates whether or not the schedule has errors. 
        self.has_error = objectHash["hasError"]

        # param str last_run_status: [required] Indicates the status of the last scheduled snapshot.<br/> Valid values are:<br/> Success<br/> Failed 
        self.last_run_status = objectHash["lastRunStatus"]

        # param str last_run_time_start: [required] Indicates the last time the schedule started n ISO 8601 date string. Valid values are:<br/> Success<br/> Failed 
        self.last_run_time_start = objectHash["lastRunTimeStart"]

        # param bool paused:  Indicates whether or not the schedule is paused. 
        self.paused = objectHash["paused"]

        # param bool recurring:  Indicates whether or not the schedule is recurring. 
        self.recurring = objectHash["recurring"]

        # param bool run_next_interval:  Indicates whether or not the schedule will run the next time the scheduler is active. When set to "true", the schedule will run the next time the scheduler is active and then reset back to "false". 
        self.run_next_interval = objectHash["runNextInterval"]

        # param int schedule_id:  Unique ID of the schedule 
        self.schedule_id = objectHash["scheduleID"]

        # param ScheduleInfo schedule_info: [required] Includes the unique name given to the schedule, the retention period for the snapshot that was created, and the volume ID of the volume from which the snapshot was created. 
        self.schedule_info = objectHash["scheduleInfo"] ? ScheduleInfo.new(objectHash["scheduleInfo"]) : nil

        # param str name: [required] Unique name assigned to the schedule. 
        self.name = objectHash["name"]

        # param str starting_date: [required] Indicates the date the first time the schedule began of will begin. Formatted in UTC time. 
        self.starting_date = objectHash["startingDate"]

        # param bool to_be_deleted:  Indicates if the schedule is marked for deletion. 
        self.to_be_deleted = objectHash["toBeDeleted"]
    end
end

class ModifyScheduleRequest
    attr_accessor :schedule

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Schedule schedule: [required] The "Schedule" object will be used to modify an existing schedule.<br/> The ScheduleID property is required.<br/> Frequency property must be of type that inherits from Frequency. Valid types are:<br/> DaysOfMonthFrequency<br/> DaysOrWeekFrequency<br/> TimeIntervalFrequency 
        self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
    end
end

class ListProtocolEndpointsRequest
    attr_accessor :protocol_endpoint_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID protocol_endpoint_ids:  
        self.protocol_endpoint_ids = Array.new(objectHash["protocolEndpointIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["protocolEndpointIDs"][i])}
    end
end

class EnableFeatureRequest
    attr_accessor :feature

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str feature: [required] Valid values: vvols: Enable the Virtual Volumes (VVOLs) cluster feature. 
        self.feature = objectHash["feature"]
    end
end

class SecureEraseDrivesRequest
    attr_accessor :drives

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drives: [required] List of driveIDs to secure erase. 
        self.drives = objectHash["drives"]
    end
end

class SnmpTrapRecipient
    attr_accessor :host, :community, :port

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Host that is to receive the traps generated by the cluster.
        # param str host: [required] The IP address or host name of the target network management station. 
        self.host = objectHash["host"]

        # param str community: [required] SNMP community string. 
        self.community = objectHash["community"]

        # param int port: [required] The UDP port number on the host where the trap is to be sent. Valid range is 1 - 65535. 0 (zero) is not a valid port number. Default is 162. 
        self.port = objectHash["port"]
    end
end

class ModifyAccountRequest
    attr_accessor :account_id, :username, :status, :initiator_secret, :target_secret, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] AccountID for the account to modify. 
        self.account_id = objectHash["accountID"]

        # param str username:  Change the username of the account to this value. 
        self.username = objectHash["username"]

        # param str status:  Status of the account. 
        self.status = objectHash["status"]

        # param CHAPSecret initiator_secret:  CHAP secret to use for the initiator. Should be 12-16 characters long and impenetrable. 
        self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

        # param CHAPSecret target_secret:  CHAP secret to use for the target (mutual CHAP authentication). Should be 12-16 characters long and impenetrable. 
        self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class GetClusterConfigResult
    attr_accessor :cluster

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterConfig cluster: [required] Cluster configuration information the node uses to communicate with the cluster. 
        self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
    end
end

class CreateStorageContainerResult
    attr_accessor :storage_container

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param StorageContainer storage_container: [required] 
        self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil
    end
end

class VolumeAccessGroup
    attr_accessor :attributes, :deleted_volumes, :volume_access_group_id, :name, :initiator_ids, :initiators, :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # A volume access group is a useful way of grouping volumes and initiators together for ease of management.
        # <br/><br/>
        # Volume Access Group Limits:
        # <br/><br/>
        # - A volume access group can contain up to sixty-four initiator IQNs.
        # - An initiator can only belong to only one volume access group.
        # - A volume access group can contain up to two thousand volumes.
        # - Each volume access group can belong to a maximum of four other volume access groups.
        # param dict attributes: [required] List of name/value pairs 
        self.attributes = objectHash["attributes"]

        # param int deleted_volumes: [required] A list of deleted volumes that have yet to be purged from the VAG. 
        self.deleted_volumes = objectHash["deletedVolumes"]

        # param int volume_access_group_id: [required] Unique ID for this volume access group. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param str name: [required] Name of the volume access group. 
        self.name = objectHash["name"]

        # param int initiator_ids: [required] A list of IDs of initiators that are mapped to the VAG. 
        self.initiator_ids = objectHash["initiatorIDs"]

        # param str initiators: [required] List of unique initiator names belonging to the volume access group. 
        self.initiators = objectHash["initiators"]

        # param int volumes: [required] List of volumes belonging to the volume access group. 
        self.volumes = objectHash["volumes"]
    end
end

class ModifyVolumeAccessGroupResult
    attr_accessor :volume_access_group

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeAccessGroup volume_access_group: [required] An object containing information about the newly modified volume access group. 
        self.volume_access_group = objectHash["volumeAccessGroup"] ? VolumeAccessGroup.new(objectHash["volumeAccessGroup"]) : nil
    end
end

class PurgeDeletedVolumeRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] The ID of the volume to purge. 
        self.volume_id = objectHash["volumeID"]
    end
end

class AddLdapClusterAdminRequest
    attr_accessor :username, :access, :accept_eula, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str username: [required] The distinguished user name for the new LDAP cluster admin. 
        self.username = objectHash["username"]

        # param str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see the Access Control appendix in the SolidFire API Reference. 
        self.access = objectHash["access"]

        # param bool accept_eula:  Indicate your acceptance of the End User License Agreement when creating this cluster admin. To accept the EULA, set this parameter to true. 
        self.accept_eula = objectHash["acceptEula"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class DeleteVolumesRequest
    attr_accessor :account_ids, :volume_access_group_ids, :volume_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_ids:  A list of account IDs. All volumes from these accounts are deleted from the system.  
        self.account_ids = objectHash["accountIDs"]

        # param int volume_access_group_ids:  A list of volume access group IDs. All of the volumes from all of the volume access groups you specify in this list are deleted from the system. 
        self.volume_access_group_ids = objectHash["volumeAccessGroupIDs"]

        # param int volume_ids:  The list of IDs of the volumes to delete from the system. 
        self.volume_ids = objectHash["volumeIDs"]
    end
end

class GetScheduleResult
    attr_accessor :schedule

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Schedule schedule: [required] The schedule attributes. 
        self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
    end
end

class GroupCloneVolumeMember
    attr_accessor :volume_id, :src_volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Represents the relationship between the source Volume and cloned Volume IDs.
        # param int volume_id: [required] The VolumeID of the cloned volume. 
        self.volume_id = objectHash["volumeID"]

        # param int src_volume_id: [required] The VolumeID of the source volume. 
        self.src_volume_id = objectHash["srcVolumeID"]
    end
end

class CloneMultipleVolumesResult
    attr_accessor :async_handle, :group_clone_id, :members

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_handle: [required] A value returned from an asynchronous method call. 
        self.async_handle = objectHash["asyncHandle"]

        # param int group_clone_id: [required] Unique ID of the new group clone. 
        self.group_clone_id = objectHash["groupCloneID"]

        # param GroupCloneVolumeMember members: [required] List of volumeIDs for the source and destination volume pairs. 
        self.members = Array.new(objectHash["members"].length){ |i| GroupCloneVolumeMember.new(objectHash["members"][i])}
    end
end

class ProtocolEndpoint
    attr_accessor :protocol_endpoint_id, :protocol_endpoint_state, :provider_type, :primary_provider_id, :secondary_provider_id, :scsi_naadevice_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID protocol_endpoint_id: [required] 
        self.protocol_endpoint_id = objectHash["protocolEndpointID"] ? UUIDTools::UUID.parse(objectHash["protocolEndpointID"]) : nil

        # param str protocol_endpoint_state: [required] 
        self.protocol_endpoint_state = objectHash["protocolEndpointState"]

        # param str provider_type: [required] 
        self.provider_type = objectHash["providerType"]

        # param int primary_provider_id: [required] 
        self.primary_provider_id = objectHash["primaryProviderID"]

        # param int secondary_provider_id: [required] 
        self.secondary_provider_id = objectHash["secondaryProviderID"]

        # param str scsi_naadevice_id: [required] 
        self.scsi_naadevice_id = objectHash["scsiNAADeviceID"]
    end
end

class ListProtocolEndpointsResult
    attr_accessor :protocol_endpoints

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ProtocolEndpoint protocol_endpoints: [required] 
        self.protocol_endpoints = Array.new(objectHash["protocolEndpoints"].length){ |i| ProtocolEndpoint.new(objectHash["protocolEndpoints"][i])}
    end
end

class GetAPIResult
    attr_accessor :current_version, :supported_versions

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param float current_version: [required] 
        self.current_version = objectHash["currentVersion"]

        # param float supported_versions: [required] 
        self.supported_versions = objectHash["supportedVersions"]
    end
end

class RemoveDrivesRequest
    attr_accessor :drives

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drives: [required] List of driveIDs to remove from the cluster. 
        self.drives = objectHash["drives"]
    end
end

class RollbackToGroupSnapshotRequest
    attr_accessor :group_snapshot_id, :save_current_state, :name, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int group_snapshot_id: [required] Unique ID of the group snapshot. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param bool save_current_state: [required] <br/><b>true</b>: The previous active volume image is kept. <br/><b>false</b>: (default) The previous active volume image is deleted. 
        self.save_current_state = objectHash["saveCurrentState"]

        # param str name:  Name for the snapshot. If no name is given, then the name of the snapshot being rolled back to is used with  "-copy" appended to the end of the name. 
        self.name = objectHash["name"]

        # param dict attributes:  List of Name/Value pairs in JSON object format 
        self.attributes = objectHash["attributes"]
    end
end

class ModifySnapshotResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListVolumeAccessGroupsResult
    attr_accessor :volume_access_groups, :volume_access_groups_not_found

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeAccessGroup volume_access_groups: [required] A list of objects describing each volume access group. 
        self.volume_access_groups = Array.new(objectHash["volumeAccessGroups"].length){ |i| VolumeAccessGroup.new(objectHash["volumeAccessGroups"][i])}

        # param int volume_access_groups_not_found: [required] A list of volume access groups not found by the system. Present if you used the "volumeAccessGroups" parameter and the system was unable to find one or more volume access groups that you specified. 
        self.volume_access_groups_not_found = objectHash["volumeAccessGroupsNotFound"]
    end
end

class ClusterVersionInfo
    attr_accessor :node_id, :node_version, :node_internal_revision

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Version information for a node in the cluster.
        # param int node_id: [required] 
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
        if(objectHash == nil)
            return
        end
        # param str current_version: [required] 
        self.current_version = objectHash["currentVersion"]

        # param int node_id: [required] 
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
        if(objectHash == nil)
            return
        end
        # param str cluster_apiversion: [required] 
        self.cluster_apiversion = objectHash["clusterAPIVersion"]

        # param str cluster_version: [required] 
        self.cluster_version = objectHash["clusterVersion"]

        # param ClusterVersionInfo cluster_version_info: [required] 
        self.cluster_version_info = Array.new(objectHash["clusterVersionInfo"].length){ |i| ClusterVersionInfo.new(objectHash["clusterVersionInfo"][i])}

        # param SoftwareVersionInfo software_version_info: [required] 
        self.software_version_info = objectHash["softwareVersionInfo"] ? SoftwareVersionInfo.new(objectHash["softwareVersionInfo"]) : nil
    end
end

class DriveHardware
    attr_accessor :canonical_name, :connected, :dev, :dev_path, :drive_type, :life_remaining_percent, :lifetime_read_bytes, :lifetime_write_bytes, :name, :path, :path_link, :power_on_hours, :product, :reallocated_sectors, :reserve_capacity_percent, :scsi_compat_id, :scsi_state, :security_at_maximum, :security_enabled, :security_frozen, :security_locked, :security_supported, :serial, :size, :slot, :smart_ssd_write_capable, :uuid, :vendor, :version

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str canonical_name: [required] 
        self.canonical_name = objectHash["canonicalName"]

        # param bool connected: [required] 
        self.connected = objectHash["connected"]

        # param int dev: [required] 
        self.dev = objectHash["dev"]

        # param str dev_path: [required] 
        self.dev_path = objectHash["devPath"]

        # param str drive_type: [required] 
        self.drive_type = objectHash["driveType"]

        # param int life_remaining_percent: [required] 
        self.life_remaining_percent = objectHash["lifeRemainingPercent"]

        # param int lifetime_read_bytes: [required] 
        self.lifetime_read_bytes = objectHash["lifetimeReadBytes"]

        # param int lifetime_write_bytes: [required] 
        self.lifetime_write_bytes = objectHash["lifetimeWriteBytes"]

        # param str name: [required] 
        self.name = objectHash["name"]

        # param str path: [required] 
        self.path = objectHash["path"]

        # param str path_link: [required] 
        self.path_link = objectHash["pathLink"]

        # param int power_on_hours: [required] 
        self.power_on_hours = objectHash["powerOnHours"]

        # param str product: [required] 
        self.product = objectHash["product"]

        # param int reallocated_sectors: [required] 
        self.reallocated_sectors = objectHash["reallocatedSectors"]

        # param int reserve_capacity_percent: [required] 
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

        # param int size: [required] 
        self.size = objectHash["size"]

        # param int slot: [required] 
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
        if(objectHash == nil)
            return
        end
        # param DriveHardware drive_hardware: [required] 
        self.drive_hardware = Array.new(objectHash["driveHardware"].length){ |i| DriveHardware.new(objectHash["driveHardware"][i])}
    end
end

class NodeDriveHardware
    attr_accessor :node_id, :result

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param DrivesHardware result: [required] 
        self.result = objectHash["result"] ? DrivesHardware.new(objectHash["result"]) : nil
    end
end

class ListDriveHardwareResult
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NodeDriveHardware nodes: [required] 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| NodeDriveHardware.new(objectHash["nodes"][i])}
    end
end

class PhysicalAdapter
    attr_accessor :address, :mac_address, :mac_address_permanent, :mtu, :netmask, :network, :up_and_running

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
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

class NetworkConfig
    attr_accessor :bond_master, :_default, :virtual_network_tag, :address, :auto, :bond_downdelay, :bond_fail_over_mac, :bond_primary_reselect, :bond_lacp_rate, :bond_miimon, :bond_mode, :bond_slaves, :bond_updelay, :broadcast, :dns_nameservers, :dns_search, :family, :gateway, :mac_address, :mac_address_permanent, :method, :mtu, :netmask, :network, :physical, :routes, :status, :symmetric_route_rules, :up_and_running

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool _default:  
        self._default = objectHash["#default"]

        # param str bond_master: [required] 
        self.bond_master = objectHash["bond-master"]

        # param str virtual_network_tag: [required] 
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

        # param str broadcast:  
        self.broadcast = objectHash["broadcast"]

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

        # param str routes:  
        self.routes = objectHash["routes"]

        # param str status:  
        self.status = objectHash["status"]

        # param str symmetric_route_rules:  
        self.symmetric_route_rules = objectHash["symmetricRouteRules"]

        # param bool up_and_running:  
        self.up_and_running = objectHash["upAndRunning"]
    end
end

class Network
    attr_accessor :bond10_g, :bond1_g, :eth0, :eth1, :eth2, :eth3, :lo

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
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

class Config
    attr_accessor :cluster, :network

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterConfig cluster: [required] 
        self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil

        # param Network network: [required] 
        self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
    end
end

class SetConfigRequest
    attr_accessor :config

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Config config: [required] Objects that you want changed for the cluster interface settings. 
        self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
    end
end

class CompleteVolumePairingRequest
    attr_accessor :volume_pairing_key, :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str volume_pairing_key: [required] The key returned from the "StartVolumePairing" API method. 
        self.volume_pairing_key = objectHash["volumePairingKey"]

        # param int volume_id: [required] The ID of volume on which to complete the pairing process. 
        self.volume_id = objectHash["volumeID"]
    end
end

class AddDrivesRequest
    attr_accessor :drives

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NewDrive drives: [required] List of drives to add to the cluster. 
        self.drives = Array.new(objectHash["drives"].length){ |i| NewDrive.new(objectHash["drives"][i])}
    end
end

class CopyVolumeResult
    attr_accessor :clone_id, :async_handle

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int clone_id: [required] 
        self.clone_id = objectHash["cloneID"]

        # param int async_handle: [required] Handle value used to track the progress of the volume copy. 
        self.async_handle = objectHash["asyncHandle"]
    end
end

class ListVolumeStatsByVirtualVolumeResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] 
        self.volume_stats = Array.new(objectHash["volumeStats"].length){ |i| VolumeStats.new(objectHash["volumeStats"][i])}
    end
end

class ModifyVolumePairResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class GetNodeStatsRequest
    attr_accessor :node_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int node_id: [required] Specifies the node for which statistics are gathered. 
        self.node_id = objectHash["nodeID"]
    end
end

class ModifyVolumesResult
    attr_accessor :qos, :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param QoS qos: [required] 
        self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

        # param Volume volumes: [required] 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class GetHardwareInfoResult
    attr_accessor :hardware_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param dict hardware_info: [required] Hardware information for this node.  
        self.hardware_info = objectHash["hardwareInfo"]
    end
end

class GetCurrentClusterAdminResult
    attr_accessor :cluster_admin

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterAdmin cluster_admin: [required] Information about all cluster and LDAP administrators that exist for a cluster. 
        self.cluster_admin = objectHash["clusterAdmin"] ? ClusterAdmin.new(objectHash["clusterAdmin"]) : nil
    end
end

class TestDrivesResult
    attr_accessor :details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str details: [required] 
        self.details = objectHash["details"]
    end
end

class ClusterFaultInfo
    attr_accessor :severity, :type, :code, :details, :node_hardware_fault_id, :node_id, :service_id, :drive_id, :resolved, :cluster_fault_id, :date, :resolved_date, :data

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str severity: [required] 
        self.severity = objectHash["severity"]

        # param str type: [required] 
        self.type = objectHash["type"]

        # param str code: [required] 
        self.code = objectHash["code"]

        # param str details: [required] 
        self.details = objectHash["details"]

        # param int node_hardware_fault_id: [required] 
        self.node_hardware_fault_id = objectHash["nodeHardwareFaultID"]

        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param int service_id: [required] 
        self.service_id = objectHash["serviceID"]

        # param int drive_id: [required] 
        self.drive_id = objectHash["driveID"]

        # param bool resolved: [required] 
        self.resolved = objectHash["resolved"]

        # param int cluster_fault_id: [required] 
        self.cluster_fault_id = objectHash["clusterFaultID"]

        # param str date: [required] 
        self.date = objectHash["date"]

        # param str resolved_date: [required] 
        self.resolved_date = objectHash["resolvedDate"]

        # param str data: [required] 
        self.data = objectHash["data"]
    end
end

class ListClusterFaultsResult
    attr_accessor :faults

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterFaultInfo faults: [required] The list of Cluster Fault objects. 
        self.faults = Array.new(objectHash["faults"].length){ |i| ClusterFaultInfo.new(objectHash["faults"][i])}
    end
end

class AsyncResult
    attr_accessor :message

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The wrapped object returned by the "GetAsyncResult" API Service call.
        # <br/>
        # <b>Note</b>: The return value of GetAsyncResult is essentially a nested version of the standard JSON response with an additional status field.
        # param str message: [required] The return value for the original method call if the call was completed successfully. 
        self.message = objectHash["message"]
    end
end

class GetAsyncResultResult
    attr_accessor :result, :status

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The object returned by the "GetAsyncResult" API Service call.
        # <br/>
        # <b>Note</b>: The return value of GetAsyncResult is essentially a nested version of the standard JSON response with an additional status field.
        # param AsyncResult result: [required] The resulting message for the original method call if the call was completed successfully. 
        self.result = objectHash["result"] ? AsyncResult.new(objectHash["result"]) : nil

        # param str status: [required] Status of the asynchronous method call <br/><b>running</b>: The method is still running. <br/><b>complete</b>: The method is complete and the result or error is available. 
        self.status = objectHash["status"]
    end
end

class GetClusterStateRequest
    attr_accessor :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool force:  
        self.force = objectHash["force"]
    end
end

class RemoveVirtualNetworkResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class CreateStorageContainerRequest
    attr_accessor :name, :initiator_secret, :target_secret

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str name: [required] Name of the storage container. 
        self.name = objectHash["name"]

        # param str initiator_secret:  The secret for CHAP authentication for the initiator 
        self.initiator_secret = objectHash["initiatorSecret"]

        # param str target_secret:  The secret for CHAP authentication for the target 
        self.target_secret = objectHash["targetSecret"]
    end
end

class GetScheduleRequest
    attr_accessor :schedule_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int schedule_id: [required] Unique ID of the schedule or multiple schedules to display 
        self.schedule_id = objectHash["scheduleID"]
    end
end

class PairedCluster
    attr_accessor :cluster_name, :cluster_pair_id, :cluster_pair_uuid, :latency, :mvip, :status, :version

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str cluster_name: [required] Name of the other cluster in the pair 
        self.cluster_name = objectHash["clusterName"]

        # param int cluster_pair_id: [required] Unique ID given to each cluster in the pair. 
        self.cluster_pair_id = objectHash["clusterPairID"]

        # param UUID cluster_pair_uuid: [required] Universally unique identifier. 
        self.cluster_pair_uuid = objectHash["clusterPairUUID"] ? UUIDTools::UUID.parse(objectHash["clusterPairUUID"]) : nil

        # param int latency: [required] Number, in milliseconds, of latency between clusters. 
        self.latency = objectHash["latency"]

        # param str mvip: [required] IP of the management connection for paired clusters. 
        self.mvip = objectHash["mvip"]

        # param str status: [required] Can be one of the following: <br/><b>Connected</b> <br/><b>Misconfigured</b> <br/><b>Disconnected</b> 
        self.status = objectHash["status"]

        # param str version: [required] The Element OS version of the other cluster in the pair. 
        self.version = objectHash["version"]
    end
end

class ListClusterPairsResult
    attr_accessor :cluster_pairs

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param PairedCluster cluster_pairs: [required] Information about each paired cluster. 
        self.cluster_pairs = Array.new(objectHash["clusterPairs"].length){ |i| PairedCluster.new(objectHash["clusterPairs"][i])}
    end
end

class GetVolumeEfficiencyRequest
    attr_accessor :volume_id, :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] Specifies the volume for which capacity is computed. 
        self.volume_id = objectHash["volumeID"]

        # param bool force:  
        self.force = objectHash["force"]
    end
end

class Account
    attr_accessor :account_id, :username, :status, :volumes, :initiator_secret, :target_secret, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # The object containing information about an account.
        # This object only includes "configured" information about the account, not any runtime or usage information.
        # param int account_id: [required] Unique AccountID for the account. 
        self.account_id = objectHash["accountID"]

        # param str username: [required] User name for the account. 
        self.username = objectHash["username"]

        # param str status: [required] Current status of the account. 
        self.status = objectHash["status"]

        # param int volumes: [required] List of VolumeIDs for Volumes owned by this account. 
        self.volumes = objectHash["volumes"]

        # param CHAPSecret initiator_secret:  CHAP secret to use for the initiator. 
        self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

        # param CHAPSecret target_secret:  CHAP secret to use for the target (mutual CHAP authentication). 
        self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class GetAccountResult
    attr_accessor :account

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Account account: [required] Account details. 
        self.account = objectHash["account"] ? Account.new(objectHash["account"]) : nil
    end
end

class AddVolumesToVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id, :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to modify. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param int volumes: [required] List of volumes to add to this volume access group. 
        self.volumes = objectHash["volumes"]
    end
end

class ListVolumeStatsResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] List of volume activity information. 
        self.volume_stats = Array.new(objectHash["volumeStats"].length){ |i| VolumeStats.new(objectHash["volumeStats"][i])}
    end
end

class CreateInitiatorsResult
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Initiator initiators: [required] List of objects containing details about the newly created initiators 
        self.initiators = Array.new(objectHash["initiators"].length){ |i| Initiator.new(objectHash["initiators"][i])}
    end
end

class PrepareVirtualSnapshotResult
    attr_accessor :virtual_volume_task_id, :volume_id, :snapshot_id, :virtual_volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_task_id: [required] The ID of the clone task. 
        self.virtual_volume_task_id = objectHash["virtualVolumeTaskID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeTaskID"]) : nil

        # param int volume_id: [required] The volume ID of the newly-created clone. 
        self.volume_id = objectHash["volumeID"]

        # param int snapshot_id: [required] snapshotID for the prepared VVol snapshot. 
        self.snapshot_id = objectHash["snapshotID"]

        # param UUID virtual_volume_id: [required] virtualVolumeID for the newly created clone. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil
    end
end

class CreateSnapshotRequest
    attr_accessor :volume_id, :snapshot_id, :name, :enable_remote_replication, :retention, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] ID of the volume image from which to copy. 
        self.volume_id = objectHash["volumeID"]

        # param int snapshot_id:  Unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume. If a SnapshotID is not provided, a snapshot is created from the volume's active branch. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str name:  A name for the snapshot. If no name is provided, the date and time the snapshot was taken is used. 
        self.name = objectHash["name"]

        # param bool enable_remote_replication:  Identifies if snapshot is enabled for remote replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]

        # param str retention:  The amount of time the snapshot will be retained. Enter in HH:mm:ss 
        self.retention = objectHash["retention"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class CloneVolumeRequest
    attr_accessor :volume_id, :name, :new_account_id, :new_size, :access, :snapshot_id, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] The ID of the volume to clone. 
        self.volume_id = objectHash["volumeID"]

        # param str name: [required] The name for the newly-created volume. 
        self.name = objectHash["name"]

        # param int new_account_id:  AccountID for the owner of the new volume. If unspecified, the AccountID of the owner of the volume being cloned is used. 
        self.new_account_id = objectHash["newAccountID"]

        # param int new_size:  New size of the volume, in bytes. May be greater or less than the size of the volume being cloned. If unspecified, the clone's volume size will be the same as the source volume. Size is rounded up to the nearest 1 MiB. 
        self.new_size = objectHash["newSize"]

        # param str access:  Access settings for the new volume. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
        self.access = objectHash["access"]

        # param int snapshot_id:  ID of the snapshot to use as the source of the clone. If unspecified, the clone will be created with a snapshot of the active volume. 
        self.snapshot_id = objectHash["snapshotID"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class EnableSnmpResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class TestPingRequest
    attr_accessor :attempts, :hosts, :total_timeout_sec, :packet_size, :ping_timeout_msec

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int attempts:  Specifies the number of times the system should repeat the test ping. Default is 5. 
        self.attempts = objectHash["attempts"]

        # param str hosts:  Specify address or hostnames of devices to ping. 
        self.hosts = objectHash["hosts"]

        # param int total_timeout_sec:  Specifies the length of time the ping should wait for a system response before issuing the next ping attempt or ending the process. 
        self.total_timeout_sec = objectHash["totalTimeoutSec"]

        # param int packet_size:  Specify the number of bytes to send in the ICMP packet sent to each IP. Number be less than the maximum MTU specified in the network configuration. 
        self.packet_size = objectHash["packetSize"]

        # param int ping_timeout_msec:  Specify the number of milliseconds to wait for each individual ping response. Default is 500ms. 
        self.ping_timeout_msec = objectHash["pingTimeoutMsec"]
    end
end

class SetClusterConfigRequest
    attr_accessor :cluster

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterConfig cluster: [required] Objects that are changed for the cluster interface settings. Only the fields you want changed need to be added to this method as objects in the "cluster" parameter. 
        self.cluster = objectHash["cluster"] ? ClusterConfig.new(objectHash["cluster"]) : nil
    end
end

class GetStorageContainerEfficiencyResult
    attr_accessor :compression, :deduplication, :missing_volumes, :thin_provisioning, :timestamp

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param float compression: [required] 
        self.compression = objectHash["compression"]

        # param float deduplication: [required] 
        self.deduplication = objectHash["deduplication"]

        # param int missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by the Garbage Collection (GC) cycle being less than an hour old, temporary loss of network connectivity, or restarted services since the GC cycle. 
        self.missing_volumes = objectHash["missingVolumes"]

        # param float thin_provisioning: [required] 
        self.thin_provisioning = objectHash["thinProvisioning"]

        # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC). 
        self.timestamp = objectHash["timestamp"]
    end
end

class CreateBackupTargetResult
    attr_accessor :backup_target_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int backup_target_id: [required] Unique identifier assigned to the backup target. 
        self.backup_target_id = objectHash["backupTargetID"]
    end
end

class RemoveVirtualNetworkRequest
    attr_accessor :virtual_network_id, :virtual_network_tag

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_id:  Network ID that identifies the virtual network to remove. 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tag:  Network Tag that identifies the virtual network to remove. 
        self.virtual_network_tag = objectHash["virtualNetworkTag"]
    end
end

class ListVolumesForAccountRequest
    attr_accessor :account_id, :start_volume_id, :limit

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] The ID of the account to list the volumes for. 
        self.account_id = objectHash["accountID"]

        # param int start_volume_id:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
        self.start_volume_id = objectHash["startVolumeID"]

        # param int limit:  The maximum number of volumes to return from the API. 
        self.limit = objectHash["limit"]
    end
end

class CancelCloneResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListStorageContainersRequest
    attr_accessor :storage_container_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID storage_container_ids:  List of storage containers to get 
        self.storage_container_ids = Array.new(objectHash["storageContainerIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["storageContainerIDs"][i])}
    end
end

class ListActiveNodesResult
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Node nodes: [required] 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| Node.new(objectHash["nodes"][i])}
    end
end

class GetAsyncResultRequest
    attr_accessor :async_handle

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_handle: [required] A value that was returned from the original asynchronous method call. 
        self.async_handle = objectHash["asyncHandle"]
    end
end

class AddressBlock
    attr_accessor :start, :size

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Unique Range of IP addresses to include in the virtual network.
        # param str start: [required] Start of the IP address range. 
        self.start = objectHash["start"]

        # param int size: [required] Number of IP addresses to include in the block. 
        self.size = objectHash["size"]
    end
end

class AddVirtualNetworkRequest
    attr_accessor :virtual_network_tag, :name, :address_blocks, :netmask, :svip, :gateway, :namespace, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_tag: [required] A unique virtual network (VLAN) tag. Supported values are 1 to 4095 (the number zero (0) is not supported). 
        self.virtual_network_tag = objectHash["virtualNetworkTag"]

        # param str name: [required] User defined name for the new virtual network. 
        self.name = objectHash["name"]

        # param AddressBlock address_blocks: [required] Unique Range of IP addresses to include in the virtual network. Attributes for this parameter are: <br/><b>start:</b> start of the IP address range. (String) <br/><b>size:</b> numbre of IP addresses to include in the block. (Integer) 
        self.address_blocks = Array.new(objectHash["addressBlocks"].length){ |i| AddressBlock.new(objectHash["addressBlocks"][i])}

        # param str netmask: [required] Unique netmask for the virtual network being created. 
        self.netmask = objectHash["netmask"]

        # param str svip: [required] Unique storage IP address for the virtual network being created. 
        self.svip = objectHash["svip"]

        # param str gateway:   
        self.gateway = objectHash["gateway"]

        # param bool namespace:   
        self.namespace = objectHash["namespace"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class AddClusterAdminRequest
    attr_accessor :username, :password, :access, :accept_eula, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str username: [required] Unique username for this Cluster Admin. 
        self.username = objectHash["username"]

        # param str password: [required] Password used to authenticate this Cluster Admin. 
        self.password = objectHash["password"]

        # param str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see "Access Control" in the Element API Guide. 
        self.access = objectHash["access"]

        # param bool accept_eula:  Indicate your acceptance of the End User License Agreement when creating this cluster admin. To accept the EULA, set this parameter to true. 
        self.accept_eula = objectHash["acceptEula"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class DeleteInitiatorsRequest
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int initiators: [required] An array of IDs of initiators to delete. 
        self.initiators = objectHash["initiators"]
    end
end

class GetNtpInfoResult
    attr_accessor :broadcastclient, :servers

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool broadcastclient: [required] Indicates whether or not the nodes in the cluster are listening for broadcast NTP messages. Possible values: true false 
        self.broadcastclient = objectHash["broadcastclient"]

        # param str servers: [required] List of NTP servers. 
        self.servers = objectHash["servers"]
    end
end

class ModifyInitiator
    attr_accessor :initiator_id, :alias, :volume_access_group_id, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Object containing characteristics of each initiator to modify
        # param int initiator_id: [required] (Required) The numeric ID of the initiator to modify. (Integer) 
        self.initiator_id = objectHash["initiatorID"]

        # param str alias:  (Optional) A new friendly name to assign to the initiator. (String) 
        self.alias = objectHash["alias"]

        # param int volume_access_group_id:  (Optional) The ID of the volume access group into to which the newly created initiator should be added. If the initiator was previously in a different volume access group, it is removed from the old volume access group. If this key is present but null, the initiator is removed from its current volume access group, but not placed in any new volume access group. (Integer) 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param dict attributes:  (Optional) A new set of JSON attributes assigned to this initiator. (JSON Object) 
        self.attributes = objectHash["attributes"]
    end
end

class ModifyInitiatorsRequest
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ModifyInitiator initiators: [required] A list of Initiator objects containing characteristics of each initiator to modify. 
        self.initiators = Array.new(objectHash["initiators"].length){ |i| ModifyInitiator.new(objectHash["initiators"][i])}
    end
end

class LunAssignment
    attr_accessor :volume_id, :lun

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # VolumeID and Lun assignment.
        # param int volume_id: [required] The volume ID assigned to the Lun. 
        self.volume_id = objectHash["volumeID"]

        # param int lun: [required] Correct LUN values are 0 - 16383. An exception will be seen if an incorrect LUN value is passed. 
        self.lun = objectHash["lun"]
    end
end

class ModifyVolumeAccessGroupLunAssignmentsRequest
    attr_accessor :volume_access_group_id, :lun_assignments

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] Unique volume access group ID for which the LUN assignments will be modified. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param LunAssignment lun_assignments: [required] The volume IDs with new assigned LUN values. 
        self.lun_assignments = Array.new(objectHash["lunAssignments"].length){ |i| LunAssignment.new(objectHash["lunAssignments"][i])}
    end
end

class SetNetworkConfigResult
    attr_accessor :network

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Network network: [required] 
        self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
    end
end

class ModifyVolumeAccessGroupLunAssignmentsResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListSnapshotsRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id:  The volume to list snapshots for. If not provided, all snapshots for all volumes are returned. 
        self.volume_id = objectHash["volumeID"]
    end
end

class CreateInitiator
    attr_accessor :name, :alias, :volume_access_group_id, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Object containing characteristics of each new initiator.
        # param str name: [required] (Required) The name of the initiator (IQN or WWPN) to create. (String) 
        self.name = objectHash["name"]

        # param str alias:  (Optional) The friendly name to assign to this initiator. (String) 
        self.alias = objectHash["alias"]

        # param int volume_access_group_id:  (Optional) The ID of the volume access group into to which this newly created initiator will be added. (Integer) 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param dict attributes:  (Optional) A set of JSON attributes assigned to this initiator. (JSON Object) 
        self.attributes = objectHash["attributes"]
    end
end

class CreateInitiatorsRequest
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param CreateInitiator initiators: [required] A list of Initiator objects containing characteristics of each new initiator 
        self.initiators = Array.new(objectHash["initiators"].length){ |i| CreateInitiator.new(objectHash["initiators"][i])}
    end
end

class SetNetworkConfigRequest
    attr_accessor :network

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Network network: [required] Objects that will be changed for the node network settings. 
        self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
    end
end

class TestConnectMvipDetails
    attr_accessor :ping_bytes, :mvip, :connected

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str ping_bytes: [required] Details of the ping tests with 56 Bytes and 1500 Bytes. 
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
        if(objectHash == nil)
            return
        end
        # param TestConnectMvipDetails details: [required] Information about the test operation 
        self.details = objectHash["details"] ? TestConnectMvipDetails.new(objectHash["details"]) : nil

        # param str duration: [required] The length of time required to run the test. 
        self.duration = objectHash["duration"]

        # param str result: [required] The results of the entire test 
        self.result = objectHash["result"]
    end
end

class CreateGroupSnapshotRequest
    attr_accessor :volumes, :name, :enable_remote_replication, :retention, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volumes: [required] Unique ID of the volume image from which to copy. 
        self.volumes = objectHash["volumes"]

        # param str name:  A name for the snapshot. If no name is provided, the date and time the snapshot was taken is used. 
        self.name = objectHash["name"]

        # param bool enable_remote_replication:  Identifies if snapshot is enabled for remote replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]

        # param str retention:  The amount of time the snapshot will be retained. Enter in HH:mm:ss 
        self.retention = objectHash["retention"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ISCSISession
    attr_accessor :account_id, :initiator, :account_name, :drive_id, :initiator_ip, :initiator_port_name, :target_port_name, :initiator_name, :node_id, :service_id, :session_id, :target_name, :target_ip, :virtual_network_id, :volume_id, :create_time, :volume_instance, :initiator_session_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] 
        self.account_id = objectHash["accountID"]

        # param Initiator initiator: [required] 
        self.initiator = objectHash["initiator"] ? Initiator.new(objectHash["initiator"]) : nil

        # param str account_name: [required] 
        self.account_name = objectHash["accountName"]

        # param int drive_id: [required] 
        self.drive_id = objectHash["driveID"]

        # param str initiator_ip: [required] 
        self.initiator_ip = objectHash["initiatorIP"]

        # param str initiator_port_name: [required] 
        self.initiator_port_name = objectHash["initiatorPortName"]

        # param str target_port_name: [required] 
        self.target_port_name = objectHash["targetPortName"]

        # param str initiator_name: [required] 
        self.initiator_name = objectHash["initiatorName"]

        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param int service_id: [required] 
        self.service_id = objectHash["serviceID"]

        # param int session_id: [required] 
        self.session_id = objectHash["sessionID"]

        # param str target_name: [required] 
        self.target_name = objectHash["targetName"]

        # param str target_ip: [required] 
        self.target_ip = objectHash["targetIP"]

        # param int virtual_network_id: [required] 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int volume_id: [required] 
        self.volume_id = objectHash["volumeID"]

        # param str create_time: [required] 
        self.create_time = objectHash["createTime"]

        # param int volume_instance: [required] 
        self.volume_instance = objectHash["volumeInstance"]

        # param int initiator_session_id: [required] 
        self.initiator_session_id = objectHash["initiatorSessionID"]
    end
end

class ListISCSISessionsResult
    attr_accessor :sessions

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ISCSISession sessions: [required] 
        self.sessions = Array.new(objectHash["sessions"].length){ |i| ISCSISession.new(objectHash["sessions"][i])}
    end
end

class ModifyClusterFullThresholdResult
    attr_accessor :block_fullness, :fullness, :max_metadata_over_provision_factor, :metadata_fullness, :slice_reserve_used_threshold_pct, :stage2_aware_threshold, :stage2_block_threshold_bytes, :stage3_block_threshold_bytes, :stage3_block_threshold_percent, :stage3_low_threshold, :stage4_critical_threshold, :stage4_block_threshold_bytes, :stage5_block_threshold_bytes, :sum_total_cluster_bytes, :sum_total_metadata_cluster_bytes, :sum_used_cluster_bytes, :sum_used_metadata_cluster_bytes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str block_fullness: [required] Current computed level of block fullness of the cluster. Possible values: <br/><b>stage1Happy</b>: No alerts or error conditions. <br/><b>stage2Aware</b>: 3 nodes of capacity available. <br/><b>stage3Low</b>: 2 nodes of capacity available. <br/><b>stage4Critical</b>: 1 node of capacity available. No new volumes or clones can be created. <br/><b>stage5CompletelyConsumed</b>: Completely consumed. Cluster is read-only, iSCSI connection is maintained but all writes are suspended. 
        self.block_fullness = objectHash["blockFullness"]

        # param str fullness: [required] Reflects the highest level of fullness between "blockFullness" and "metadataFullness". 
        self.fullness = objectHash["fullness"]

        # param int max_metadata_over_provision_factor: [required] A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created. 
        self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]

        # param str metadata_fullness: [required] Current computed level of metadata fullness of the cluster. 
        self.metadata_fullness = objectHash["metadataFullness"]

        # param int slice_reserve_used_threshold_pct: [required] Error condition; message sent to "Alerts" if the reserved slice utilization is greater than the sliceReserveUsedThresholdPct value returned. 
        self.slice_reserve_used_threshold_pct = objectHash["sliceReserveUsedThresholdPct"]

        # param int stage2_aware_threshold: [required] Awareness condition: Value that is set for "Stage 2" cluster threshold level. 
        self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

        # param int stage2_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage2 condition will exist. 
        self.stage2_block_threshold_bytes = objectHash["stage2BlockThresholdBytes"]

        # param int stage3_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage3 condition will exist. 
        self.stage3_block_threshold_bytes = objectHash["stage3BlockThresholdBytes"]

        # param int stage3_block_threshold_percent: [required] The percent value set for stage3. At this percent full, a warning will be posted in the Alerts log. 
        self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

        # param int stage3_low_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is getting low. 
        self.stage3_low_threshold = objectHash["stage3LowThreshold"]

        # param int stage4_critical_threshold: [required] Error condition; message sent to "Alerts" that capacity on a cluster is critically low. 
        self.stage4_critical_threshold = objectHash["stage4CriticalThreshold"]

        # param int stage4_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage4 condition will exist. 
        self.stage4_block_threshold_bytes = objectHash["stage4BlockThresholdBytes"]

        # param int stage5_block_threshold_bytes: [required] Number of bytes being used by the cluster at which a stage5 condition will exist. 
        self.stage5_block_threshold_bytes = objectHash["stage5BlockThresholdBytes"]

        # param int sum_total_cluster_bytes: [required] Physical capacity of the cluster measured in bytes. 
        self.sum_total_cluster_bytes = objectHash["sumTotalClusterBytes"]

        # param int sum_total_metadata_cluster_bytes: [required] Total amount of space that can be used to store metadata. 
        self.sum_total_metadata_cluster_bytes = objectHash["sumTotalMetadataClusterBytes"]

        # param int sum_used_cluster_bytes: [required] Number of bytes used on the cluster. 
        self.sum_used_cluster_bytes = objectHash["sumUsedClusterBytes"]

        # param int sum_used_metadata_cluster_bytes: [required] Amount of space used on volume drives to store metadata. 
        self.sum_used_metadata_cluster_bytes = objectHash["sumUsedMetadataClusterBytes"]
    end
end

class GetSnmpACLResult
    attr_accessor :networks, :usm_users

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpNetwork networks: [required] List of networks and what type of access they have to the SNMP servers running on the cluster nodes. Present if SNMP v3 is disabled. 
        self.networks = Array.new(objectHash["networks"].length){ |i| SnmpNetwork.new(objectHash["networks"][i])}

        # param SnmpV3UsmUser usm_users: [required] List of users and the type of access they have to the SNMP servers running on the cluster nodes. Present if SNMP v3 is enabled. 
        self.usm_users = Array.new(objectHash["usmUsers"].length){ |i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
    end
end

class GetBackupTargetRequest
    attr_accessor :backup_target_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int backup_target_id: [required] Unique identifier assigned to the backup target. 
        self.backup_target_id = objectHash["backupTargetID"]
    end
end

class RemoveAccountRequest
    attr_accessor :account_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] AccountID for the account to remove. 
        self.account_id = objectHash["accountID"]
    end
end

class DriveHardwareInfo
    attr_accessor :description, :dev, :devpath, :drive_security_at_maximum, :drive_security_frozen, :drive_security_locked, :logicalname, :product, :scsi_compat_id, :security_feature_enabled, :security_feature_supported, :serial, :size, :uuid, :version

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
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

        # param int size: [required] 
        self.size = objectHash["size"]

        # param UUID uuid: [required] 
        self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil

        # param str version: [required] 
        self.version = objectHash["version"]
    end
end

class ClusterHardwareInfo
    attr_accessor :drives, :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param DriveHardwareInfo drives: [required] 
        self.drives = Hash[*objectHash["drives"].map{|k,obj| [k,DriveHardwareInfo.new(obj)]}.flatten]

        # param dict nodes: [required] 
        self.nodes = objectHash["nodes"]
    end
end

class GetClusterHardwareInfoResult
    attr_accessor :cluster_hardware_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterHardwareInfo cluster_hardware_info: [required] Hardware information for all nodes and drives in the cluster. Each object in this output is labeled with the nodeID of the given node. 
        self.cluster_hardware_info = objectHash["clusterHardwareInfo"] ? ClusterHardwareInfo.new(objectHash["clusterHardwareInfo"]) : nil
    end
end

class ListVirtualVolumeTasksRequest
    attr_accessor :virtual_volume_task_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_task_ids:  
        self.virtual_volume_task_ids = Array.new(objectHash["virtualVolumeTaskIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["virtualVolumeTaskIDs"][i])}
    end
end

class FibreChannelPortInfo
    attr_accessor :firmware, :hba_port, :model, :n_port_id, :pci_slot, :serial, :speed, :state, :switch_wwn, :wwnn, :wwpn

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Fibre Channel Node Port Info object returns information about all Fibre Channel ports on a node, or for one node in the cluster. The same information is returned for all ports or port information for one node. This information is returned with the API method ListNodeFibreChannelPortInfo (in the SolidFire API Guide).
        # param str firmware: [required] The version of the firmware installed on the Fibre Channel port. 
        self.firmware = objectHash["firmware"]

        # param int hba_port: [required] The ID of the individual HBA port. 
        self.hba_port = objectHash["hbaPort"]

        # param str model: [required] Model of the HBA on the port. 
        self.model = objectHash["model"]

        # param str n_port_id: [required] Unique SolidFire port node ID. 
        self.n_port_id = objectHash["nPortID"]

        # param int pci_slot: [required] Slot in which the pci card resides on the Fibre Channel node hardware. 
        self.pci_slot = objectHash["pciSlot"]

        # param str serial: [required] Serial number on the Fibre Channel port. 
        self.serial = objectHash["serial"]

        # param str speed: [required] Speed of the HBA on the port. 
        self.speed = objectHash["speed"]

        # param str state: [required] Possible values: <br/><br/> <strong>Unknown<br/>NotPresent<br/>Online<br/>Offline<br/>Blocked<br/>Bypassed<br/>Diagnostics<br/>Linkdown<br/>Error<br/>Loopback<br/>Deleted</strong> 
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
        if(objectHash == nil)
            return
        end
        # List of all Fibre Channel ports.
        # param FibreChannelPortInfo fibre_channel_ports: [required] List of all physical Fibre Channel ports. 
        self.fibre_channel_ports = Array.new(objectHash["fibreChannelPorts"].length){ |i| FibreChannelPortInfo.new(objectHash["fibreChannelPorts"][i])}
    end
end

class NodeFibreChannelPortInfoResult
    attr_accessor :node_id, :result

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Fibre channel port info results for a node.
        # param int node_id: [required] The ID of the Fibre Channel node. 
        self.node_id = objectHash["nodeID"]

        # param FibreChannelPortList result: [required] Contains a list of information about the Fibre Channel ports. 
        self.result = objectHash["result"] ? FibreChannelPortList.new(objectHash["result"]) : nil
    end
end

class ListNodeFibreChannelPortInfoResult
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # List of fibre channel port info results grouped by node.
        # param NodeFibreChannelPortInfoResult nodes: [required] List of fibre channel port info results grouped by node. 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| NodeFibreChannelPortInfoResult.new(objectHash["nodes"][i])}
    end
end

class EnableEncryptionAtRestResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RemoveVolumePairResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class DeleteGroupSnapshotRequest
    attr_accessor :group_snapshot_id, :save_members

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int group_snapshot_id: [required] Unique ID of the group snapshot. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param bool save_members: [required] <br/><b>true</b>: Snapshots are kept, but group association is removed. <br/><b>false</b>: The group and snapshots are deleted. 
        self.save_members = objectHash["saveMembers"]
    end
end

class StartVolumePairingRequest
    attr_accessor :volume_id, :mode

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] The ID of the volume on which to start the pairing process. 
        self.volume_id = objectHash["volumeID"]

        # param str mode:  The mode of the volume on which to start the pairing process. The mode can only be set if the volume is the source volume.<br/> Possible values:<br/> <b>Async</b>: (default if no mode parameter specified) Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster.<br/> <b>Sync</b>: Source acknowledges write when the data is stored locally and on the remote cluster.<br/> <b>SnapshotsOnly</b>: Only snapshots created on the source cluster will be replicated. Active writes from the source volume will not be replicated.<br/> 
        self.mode = objectHash["mode"]
    end
end

class GetConfigResult
    attr_accessor :config

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Config config: [required] The details of the cluster. Values returned in "config": cluster- Cluster information that identifies how the node communicates with the cluster it is associated with. (Object) network - Network information for bonding and Ethernet connections. (Object) 
        self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
    end
end

class CompleteClusterPairingResult
    attr_accessor :cluster_pair_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int cluster_pair_id: [required] Unique identifier for the cluster pair. 
        self.cluster_pair_id = objectHash["clusterPairID"]
    end
end

class ListVirtualVolumeHostsRequest
    attr_accessor :virtual_volume_host_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_host_ids:  
        self.virtual_volume_host_ids = Array.new(objectHash["virtualVolumeHostIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["virtualVolumeHostIDs"][i])}
    end
end

class ModifyBackupTargetRequest
    attr_accessor :backup_target_id, :name, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int backup_target_id: [required] Unique identifier assigned to the backup target. 
        self.backup_target_id = objectHash["backupTargetID"]

        # param str name:  Name for the backup target. 
        self.name = objectHash["name"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class GetDriveStatsRequest
    attr_accessor :drive_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drive_id: [required] Specifies the drive for which statistics are gathered. 
        self.drive_id = objectHash["driveID"]
    end
end

class AddNodesRequest
    attr_accessor :pending_nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int pending_nodes: [required] List of PendingNodeIDs for the Nodes to be added. You can obtain the list of Pending Nodes via the ListPendingNodes method. 
        self.pending_nodes = objectHash["pendingNodes"]
    end
end

class GetVolumeStatsRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] Specifies the volume for which statistics is gathered. 
        self.volume_id = objectHash["volumeID"]
    end
end

class RestoreDeletedVolumeResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RemoveNodesRequest
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int nodes: [required] List of NodeIDs for the nodes to be removed. 
        self.nodes = objectHash["nodes"]
    end
end

class ListAsyncResultsRequest
    attr_accessor :async_result_types

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str async_result_types:  An optional list of types of results. You can use this list to restrict the results to only these types of operations. Possible values:BulkVolume: Copy operations between volumes, such as backups or restores.Clone: Volume cloning operations.DriveRemoval: Operations involving the system copying data from a drive in preparation to remove it from the cluster.RtfiPendingNode: Operations involving the system installing compatible software on a node before adding it to the cluster. 
        self.async_result_types = objectHash["asyncResultTypes"]
    end
end

class ModifyGroupSnapshotRequest
    attr_accessor :group_snapshot_id, :expiration_time, :enable_remote_replication

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int group_snapshot_id: [required] ID of the snapshot. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param str expiration_time:  Use to set the time when the snapshot should be removed. 
        self.expiration_time = objectHash["expirationTime"]

        # param bool enable_remote_replication:  Use to enable the snapshot created to be replicated to a remote SolidFire cluster. Possible values: <br/><b>true</b>: the snapshot will be replicated to remote storage. <br/><b>false</b>: Default. No replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]
    end
end

class LdapConfiguration
    attr_accessor :auth_type, :enabled, :group_search_base_dn, :group_search_custom_filter, :group_search_type, :search_bind_dn, :server_uris, :user_dntemplate, :user_search_base_dn, :user_search_filter

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # LDAP Configuration object returns information about the LDAP configuration on SolidFire storage. LDAP information is returned with the API method GetLdapConfiguration.
        # param str auth_type: [required] Identifies which user authentcation method will be used. <br/> Valid values:<br/> <b>DirectBind</b><br/> <b>SearchAndBind</b> 
        self.auth_type = objectHash["authType"]

        # param bool enabled: [required] Identifies whether or not the system is enabled for LDAP. <br/> Valid values:<br/> <b>true</b><br/> <b>false</b> 
        self.enabled = objectHash["enabled"]

        # param str group_search_base_dn: [required] The base DN of the tree to start the group search (will do a subtree search from here). 
        self.group_search_base_dn = objectHash["groupSearchBaseDN"]

        # param str group_search_custom_filter: [required] The custom search filter used. 
        self.group_search_custom_filter = objectHash["groupSearchCustomFilter"]

        # param str group_search_type: [required] Controls the default group search filter used, can be one of the following:<br/> <b>NoGroups</b>: No group support.<br/> <b>ActiveDirectory</b>: Nested membership of all of a user's AD groups.<br/> <b>MemberDN</b>: MemberDN style groups (single-level). 
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

class GetLdapConfigurationResult
    attr_accessor :ldap_configuration

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param LdapConfiguration ldap_configuration: [required] List of the current LDAP configuration settings. This API call will not return the plain text of the search account password. <br/><br/> <b>Note</b>: If LDAP authentication is currently disabled, all the returned settings will be empty with the exception of "authType", and "groupSearchType" which are set to "SearchAndBind" and "ActiveDirectory" respectively. 
        self.ldap_configuration = objectHash["ldapConfiguration"] ? LdapConfiguration.new(objectHash["ldapConfiguration"]) : nil
    end
end

class ModifyClusterFullThresholdRequest
    attr_accessor :stage2_aware_threshold, :stage3_block_threshold_percent, :max_metadata_over_provision_factor

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int stage2_aware_threshold:  Number of nodes worth of capacity remaining on the cluster that triggers a notification. 
        self.stage2_aware_threshold = objectHash["stage2AwareThreshold"]

        # param int stage3_block_threshold_percent:  Percent below "Error" state to raise a cluster "Warning" alert. 
        self.stage3_block_threshold_percent = objectHash["stage3BlockThresholdPercent"]

        # param int max_metadata_over_provision_factor:  A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created. 
        self.max_metadata_over_provision_factor = objectHash["maxMetadataOverProvisionFactor"]
    end
end

class SetSnmpInfoResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListActivePairedVolumesResult
    attr_accessor :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] Volume information for the paired volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class AddAccountRequest
    attr_accessor :username, :initiator_secret, :target_secret, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str username: [required] Unique username for this account. (May be 1 to 64 characters in length). 
        self.username = objectHash["username"]

        # param CHAPSecret initiator_secret:  CHAP secret to use for the initiator. Should be 12-16 characters long and impenetrable. The CHAP initiator secrets must be unique and cannot be the same as the target CHAP secret. <br/><br/> If not specified, a random secret is created. 
        self.initiator_secret = objectHash["initiatorSecret"] ? CHAPSecret.new(objectHash["initiatorSecret"]) : nil

        # param CHAPSecret target_secret:  CHAP secret to use for the target (mutual CHAP authentication). Should be 12-16 characters long and impenetrable. The CHAP target secrets must be unique and cannot be the same as the initiator CHAP secret. <br/><br/> If not specified, a random secret is created. 
        self.target_secret = objectHash["targetSecret"] ? CHAPSecret.new(objectHash["targetSecret"]) : nil

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class PurgeDeletedVolumesRequest
    attr_accessor :volume_ids, :account_ids, :volume_access_group_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_ids:  A list of volumeIDs of volumes to be purged from the system. 
        self.volume_ids = objectHash["volumeIDs"]

        # param int account_ids:  A list of accountIDs. All of the volumes from all of the specified accounts are purged from the system. 
        self.account_ids = objectHash["accountIDs"]

        # param int volume_access_group_ids:  A list of volumeAccessGroupIDs. All of the volumes from all of the specified Volume Access Groups are purged from the system. 
        self.volume_access_group_ids = objectHash["volumeAccessGroupIDs"]
    end
end

class GetSnmpTrapInfoResult
    attr_accessor :trap_recipients, :cluster_fault_traps_enabled, :cluster_fault_resolved_traps_enabled, :cluster_event_traps_enabled

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpTrapRecipient trap_recipients: [required] List of hosts that are to receive the traps generated by the cluster. 
        self.trap_recipients = Array.new(objectHash["trapRecipients"].length){ |i| SnmpTrapRecipient.new(objectHash["trapRecipients"][i])}

        # param bool cluster_fault_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients. 
        self.cluster_fault_traps_enabled = objectHash["clusterFaultTrapsEnabled"]

        # param bool cluster_fault_resolved_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients. 
        self.cluster_fault_resolved_traps_enabled = objectHash["clusterFaultResolvedTrapsEnabled"]

        # param bool cluster_event_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients. 
        self.cluster_event_traps_enabled = objectHash["clusterEventTrapsEnabled"]
    end
end

class ListGroupSnapshotsRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id:  An array of unique volume IDs to query. If this parameter is not specified, all group snapshots on the cluster will be included. 
        self.volume_id = objectHash["volumeID"]
    end
end

class ClearClusterFaultsResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class TestConnectSvipDetails
    attr_accessor :ping_bytes, :svip, :connected

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str ping_bytes: [required] Details of the ping tests with 56 Bytes and 1500 Bytes. 
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
        if(objectHash == nil)
            return
        end
        # param TestConnectSvipDetails details: [required] Information about the test operation 
        self.details = objectHash["details"] ? TestConnectSvipDetails.new(objectHash["details"]) : nil

        # param str duration: [required] The length of time required to run the test. 
        self.duration = objectHash["duration"]

        # param str result: [required] The results of the entire test 
        self.result = objectHash["result"]
    end
end

class DriveInfo
    attr_accessor :capacity, :drive_id, :node_id, :serial, :slot, :status, :type, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int capacity: [required] Total capacity of the drive, in bytes. 
        self.capacity = objectHash["capacity"]

        # param int drive_id: [required] DriveID for this drive. 
        self.drive_id = objectHash["driveID"]

        # param int node_id: [required] NodeID where this drive is located. 
        self.node_id = objectHash["nodeID"]

        # param str serial: [required] Drive serial number. 
        self.serial = objectHash["serial"]

        # param int slot: [required] Slot number in the server chassis where this drive is located, or -1 if SATADimm used for internal metadata drive. 
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
        if(objectHash == nil)
            return
        end
        # param DriveInfo drives: [required] Information for the drives that are connected to the cluster. 
        self.drives = Array.new(objectHash["drives"].length){ |i| DriveInfo.new(objectHash["drives"][i])}
    end
end

class GetVirtualVolumeUnsharedChunksRequest
    attr_accessor :virtual_volume_id, :base_virtual_volume_id, :segment_start, :segment_length, :chunk_size, :calling_virtual_volume_host_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_id: [required] The ID of the Virtual Volume. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

        # param UUID base_virtual_volume_id: [required] The ID of the Virtual Volume to compare against. 
        self.base_virtual_volume_id = objectHash["baseVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["baseVirtualVolumeID"]) : nil

        # param int segment_start: [required] Start Byte offset. 
        self.segment_start = objectHash["segmentStart"]

        # param int segment_length: [required] Length of the scan segment in bytes. 
        self.segment_length = objectHash["segmentLength"]

        # param int chunk_size: [required] Number of bytes represented by one bit in the bitmap. 
        self.chunk_size = objectHash["chunkSize"]

        # param UUID calling_virtual_volume_host_id:  
        self.calling_virtual_volume_host_id = objectHash["callingVirtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["callingVirtualVolumeHostID"]) : nil
    end
end

class ListVolumesForAccountResult
    attr_accessor :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] List of volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class TestLdapAuthenticationResult
    attr_accessor :groups, :user_dn

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str groups: [required] List of LDAP groups that the tested user is a member of. 
        self.groups = objectHash["groups"]

        # param str user_dn: [required] The tested user's full LDAP distinguished name. 
        self.user_dn = objectHash["userDN"]
    end
end

class ModifyStorageContainerRequest
    attr_accessor :storage_container_id, :initiator_secret, :target_secret

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID storage_container_id: [required] 
        self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

        # param str initiator_secret:  
        self.initiator_secret = objectHash["initiatorSecret"]

        # param str target_secret:  
        self.target_secret = objectHash["targetSecret"]
    end
end

class GroupSnapshotMembers
    attr_accessor :volume_id, :snapshot_id, :snapshot_uuid, :checksum

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # List of checksum, volumeIDs and snapshotIDs for each member of the group.
        # param int volume_id: [required] The source volume ID for the snapshot. 
        self.volume_id = objectHash["volumeID"]

        # param int snapshot_id: [required] Unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str snapshot_uuid: [required] Universal Unique ID of an existing snapshot. 
        self.snapshot_uuid = objectHash["snapshotUUID"]

        # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data. 
        self.checksum = objectHash["checksum"]
    end
end

class CreateGroupSnapshotResult
    attr_accessor :group_snapshot_id, :members

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int group_snapshot_id: [required] Unique ID of the new group snapshot. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param GroupSnapshotMembers members: [required] List of checksum, volumeIDs and snapshotIDs for each member of the group. 
        self.members = Array.new(objectHash["members"].length){ |i| GroupSnapshotMembers.new(objectHash["members"][i])}
    end
end

class CloneMultipleVolumeParams
    attr_accessor :volume_id, :access, :name, :new_account_id, :new_size, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] Required parameter for "volumes" array: volumeID. 
        self.volume_id = objectHash["volumeID"]

        # param str access:  Access settings for the new volume. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
        self.access = objectHash["access"]

        # param str name:  New name for the clone. 
        self.name = objectHash["name"]

        # param int new_account_id:  Account ID for the new volume. 
        self.new_account_id = objectHash["newAccountID"]

        # param int new_size:  New size Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size. 
        self.new_size = objectHash["newSize"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class CloneMultipleVolumesRequest
    attr_accessor :volumes, :access, :group_snapshot_id, :new_account_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param CloneMultipleVolumeParams volumes: [required] Array of Unique ID for each volume to include in the clone with optional parameters. If optional parameters are not specified, the values will be inherited from the source volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| CloneMultipleVolumeParams.new(objectHash["volumes"][i])}

        # param str access:  New default access method for the new volumes if not overridden by information passed in the volumes array. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
        self.access = objectHash["access"]

        # param int group_snapshot_id:  ID of the group snapshot to use as a basis for the clone. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param int new_account_id:  New account ID for the volumes if not overridden by information passed in the volumes array. 
        self.new_account_id = objectHash["newAccountID"]
    end
end

class FibreChannelPortInfoResult
    attr_accessor :result

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Used to return information about the Fibre Channel ports.
        # param FibreChannelPortList result: [required] Used to return information about the Fibre Channel ports. 
        self.result = objectHash["result"] ? FibreChannelPortList.new(objectHash["result"]) : nil
    end
end

class ListFibreChannelPortInfoResult
    attr_accessor :fibre_channel_port_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # ListFibreChannelPortInfoResult is used to return information about the Fibre Channel ports.
        # param FibreChannelPortInfoResult fibre_channel_port_info: [required] Used to return information about the Fibre Channel ports. 
        self.fibre_channel_port_info = Hash[*objectHash["fibreChannelPortInfo"].map{|k,obj| [k,FibreChannelPortInfoResult.new(obj)]}.flatten]
    end
end

class ModifyBackupTargetResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class NodeStateInfo
    attr_accessor :cluster, :state

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str cluster: [required] Name of the cluster. 
        self.cluster = objectHash["cluster"]

        # param str state: [required] <strong>Available:</strong> Node has not been configured with a cluster name.<br><strong>Pending:</strong> Node is pending for a specific named cluster and can be added.<br><strong>Active:</strong> Node is active and a member of a cluster and may not be added to another cluster. 
        self.state = objectHash["state"]
    end
end

class NodeStateResult
    attr_accessor :node_id, :result

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int node_id: [required] ID of the node. 
        self.node_id = objectHash["nodeID"]

        # param NodeStateInfo result: [required] NodeStateInfo object. 
        self.result = objectHash["result"] ? NodeStateInfo.new(objectHash["result"]) : nil
    end
end

class GetClusterStateResult
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NodeStateResult nodes: [required] Array of NodeStateResult objects for each node in the cluster. 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| NodeStateResult.new(objectHash["nodes"][i])}
    end
end

class RemoveBackupTargetRequest
    attr_accessor :backup_target_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int backup_target_id: [required] Unique target ID of the target to remove. 
        self.backup_target_id = objectHash["backupTargetID"]
    end
end

class RemoveBackupTargetResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ClearClusterFaultsRequest
    attr_accessor :fault_types

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str fault_types:  Determines the types of faults cleared:<br/> <b>current</b>: Faults that are currently detected and have not been resolved.<br/> <b>resolved</b>: Faults that were previously detected and resolved.<br/> <b>all</b>: Both current and resolved faults are cleared. The fault status can be determined by the "resolved" field of the fault object. 
        self.fault_types = objectHash["faultTypes"]
    end
end

class CreateVolumeAccessGroupResult
    attr_accessor :volume_access_group_id, :volume_access_group

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID for the newly-created volume access group. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param VolumeAccessGroup volume_access_group: [required] 
        self.volume_access_group = objectHash["volumeAccessGroup"] ? VolumeAccessGroup.new(objectHash["volumeAccessGroup"]) : nil
    end
end

class ListTestsResult
    attr_accessor :tests

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str tests: [required] List of tests that can be performed on the node. 
        self.tests = objectHash["tests"]
    end
end

class CreateScheduleResult
    attr_accessor :schedule_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int schedule_id: [required] 
        self.schedule_id = objectHash["scheduleID"]
    end
end

class PurgeDeletedVolumeResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ModifyVolumeRequest
    attr_accessor :volume_id, :account_id, :access, :qos, :total_size, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] VolumeID for the volume to be modified. 
        self.volume_id = objectHash["volumeID"]

        # param int account_id:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used. 
        self.account_id = objectHash["accountID"]

        # param str access:  Access allowed for the volume. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
        self.access = objectHash["access"]

        # param QoS qos:  New quality of service settings for this volume. 
        self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

        # param int total_size:  New size of the volume in bytes. Size is rounded up to the nearest 1MiB size. This parameter can only be used to *increase* the size of a volume. 
        self.total_size = objectHash["totalSize"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class DeleteSnapshotRequest
    attr_accessor :snapshot_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int snapshot_id: [required] The ID of the snapshot to delete. 
        self.snapshot_id = objectHash["snapshotID"]
    end
end

class CompleteVolumePairingResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class SetSnmpTrapInfoRequest
    attr_accessor :trap_recipients, :cluster_fault_traps_enabled, :cluster_fault_resolved_traps_enabled, :cluster_event_traps_enabled

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpTrapRecipient trap_recipients: [required] List of hosts that are to receive the traps generated by the Cluster Master. At least one object is required if any one of the trap types is enabled. 
        self.trap_recipients = Array.new(objectHash["trapRecipients"].length){ |i| SnmpTrapRecipient.new(objectHash["trapRecipients"][i])}

        # param bool cluster_fault_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients. 
        self.cluster_fault_traps_enabled = objectHash["clusterFaultTrapsEnabled"]

        # param bool cluster_fault_resolved_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients. 
        self.cluster_fault_resolved_traps_enabled = objectHash["clusterFaultResolvedTrapsEnabled"]

        # param bool cluster_event_traps_enabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients. 
        self.cluster_event_traps_enabled = objectHash["clusterEventTrapsEnabled"]
    end
end

class AsyncHandle
    attr_accessor :async_result_id, :completed, :create_time, :data, :last_update_time, :result_type, :success

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_result_id: [required] The ID of the result. 
        self.async_result_id = objectHash["asyncResultID"]

        # param bool completed: [required] Returns true if it is completed and false if it isn't. 
        self.completed = objectHash["completed"]

        # param str create_time: [required] The time at which the asyncronous result was created 
        self.create_time = objectHash["createTime"]

        # param dict data: [required] Attributes related to the result 
        self.data = objectHash["data"]

        # param str last_update_time: [required] Time at which the result was last updated 
        self.last_update_time = objectHash["lastUpdateTime"]

        # param str result_type: [required] The type of result. Could be Clone, DriveAdd, etc. 
        self.result_type = objectHash["resultType"]

        # param bool success: [required] Returns whether the result was a success or failure. 
        self.success = objectHash["success"]
    end
end

class ListAsyncResultsResult
    attr_accessor :async_handles

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param AsyncHandle async_handles: [required] An array of serialized asynchronous method results. 
        self.async_handles = Array.new(objectHash["asyncHandles"].length){ |i| AsyncHandle.new(objectHash["asyncHandles"][i])}
    end
end

class ModifyInitiatorsResult
    attr_accessor :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Initiator initiators: [required] List of objects containing details about the modified initiators 
        self.initiators = Array.new(objectHash["initiators"].length){ |i| Initiator.new(objectHash["initiators"][i])}
    end
end

class DeleteSnapshotResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class AsyncHandleResult
    attr_accessor :async_handle

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_handle: [required] 
        self.async_handle = objectHash["asyncHandle"]
    end
end

class TestDrivesRequest
    attr_accessor :force, :minutes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int minutes:  The number of minutes to run the test can be specified. 
        self.minutes = objectHash["minutes"]

        # param bool force: [required] The "force" parameter must be included on this method to successfully test the drives on the node. 
        self.force = objectHash["force"]
    end
end

class ListUtilitiesResult
    attr_accessor :utilities

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str utilities: [required] List of utilities currently available to run on the node. 
        self.utilities = objectHash["utilities"]
    end
end

class ListInitiatorsRequest
    attr_accessor :start_initiator_id, :limit, :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int start_initiator_id:  The initiator ID at which to begin the listing. You can supply this parameter or the "initiators" parameter, but not both. 
        self.start_initiator_id = objectHash["startInitiatorID"]

        # param int limit:  The maximum number of initiator objects to return. 
        self.limit = objectHash["limit"]

        # param int initiators:  A list of initiator IDs to retrieve. You can supply this parameter or the "startInitiatorID" parameter, but not both. 
        self.initiators = objectHash["initiators"]
    end
end

class ModifyVolumePairRequest
    attr_accessor :volume_id, :paused_manual, :mode

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] Identification number of the volume to be modified. 
        self.volume_id = objectHash["volumeID"]

        # param bool paused_manual:  Valid values that can be entered:<br/> <b>true</b>: to pause volume replication.<br/> <b>false</b>: to restart volume replication.<br/> If no value is specified, no change in replication is performed. 
        self.paused_manual = objectHash["pausedManual"]

        # param str mode:  Volume replication mode.<br/> Possible values:<br/> <b>Async</b>: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster.<br/> <b>Sync</b>: The source acknowledges the write when the data is stored locally and on the remote cluster.<br/> <b>SnapshotsOnly</b>: Only snapshots created on the source cluster will be replicated. Active writes from the source volume are not replicated.<br/> 
        self.mode = objectHash["mode"]
    end
end

class GetNetworkConfigResult
    attr_accessor :network

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Network network: [required] 
        self.network = objectHash["network"] ? Network.new(objectHash["network"]) : nil
    end
end

class StartClusterPairingResult
    attr_accessor :cluster_pairing_key, :cluster_pair_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str cluster_pairing_key: [required] A string of characters that is used by the "CompleteClusterPairing" API method. 
        self.cluster_pairing_key = objectHash["clusterPairingKey"]

        # param int cluster_pair_id: [required] Unique identifier for the cluster pair. 
        self.cluster_pair_id = objectHash["clusterPairID"]
    end
end

class ListAccountsRequest
    attr_accessor :start_account_id, :limit

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int start_account_id:  Starting AccountID to return. If no Account exists with this AccountID, the next Account by AccountID order is used as the start of the list. To page through the list, pass the AccountID of the last Account in the previous response + 1 
        self.start_account_id = objectHash["startAccountID"]

        # param int limit:  Maximum number of AccountInfo objects to return. 
        self.limit = objectHash["limit"]
    end
end

class GetFeatureStatusRequest
    attr_accessor :feature

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str feature:  Valid values: vvols: Find the status of the Virtual Volumes (VVOLs) cluster feature. 
        self.feature = objectHash["feature"]
    end
end

class GetVolumeAccessGroupEfficiencyRequest
    attr_accessor :volume_access_group_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] Specifies the volume access group for which capacity is computed. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]
    end
end

class GetBackupTargetResult
    attr_accessor :backup_target

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param BackupTarget backup_target: [required] Object returned for backup target. 
        self.backup_target = objectHash["backupTarget"] ? BackupTarget.new(objectHash["backupTarget"]) : nil
    end
end

class VirtualNetwork
    attr_accessor :virtual_network_id, :virtual_network_tag, :address_blocks, :name, :netmask, :svip, :gateway, :namespace, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_id: [required] SolidFire unique identifier for a virtual network. 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tag: [required] VLAN Tag identifier. 
        self.virtual_network_tag = objectHash["virtualNetworkTag"]

        # param AddressBlock address_blocks: [required] Range of address blocks currently assigned to the virtual network. <br/><b>available:</b> Binary string in "1"s and "0"s. 1 equals the IP is available and 0 equals the IP is not available. The string is read from right to left with the digit to the far right being the first IP address in the list of addressBlocks. <br/><b>size:</b> the size of this block of addresses. <br/><b>start:</b> first IP address in the block. 
        self.address_blocks = Array.new(objectHash["addressBlocks"].length){ |i| AddressBlock.new(objectHash["addressBlocks"][i])}

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

        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ListVirtualNetworksResult
    attr_accessor :virtual_networks

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VirtualNetwork virtual_networks: [required] Object containing virtual network IP addresses. 
        self.virtual_networks = Array.new(objectHash["virtualNetworks"].length){ |i| VirtualNetwork.new(objectHash["virtualNetworks"][i])}
    end
end

class GetDriveStatsResult
    attr_accessor :drive_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param DriveStats drive_stats: [required] 
        self.drive_stats = objectHash["driveStats"] ? DriveStats.new(objectHash["driveStats"]) : nil
    end
end

class SnmpSendTestTrapsResult
    attr_accessor :status

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str status: [required] 
        self.status = objectHash["status"]
    end
end

class EventInfo
    attr_accessor :event_id, :severity, :event_info_type, :message, :service_id, :node_id, :drive_id, :time_of_report, :time_of_publish, :details

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int event_id: [required] 
        self.event_id = objectHash["eventID"]

        # param int severity: [required] 
        self.severity = objectHash["severity"]

        # param str event_info_type: [required] 
        self.event_info_type = objectHash["eventInfoType"]

        # param str message: [required] 
        self.message = objectHash["message"]

        # param int service_id: [required] 
        self.service_id = objectHash["serviceID"]

        # param int node_id: [required] 
        self.node_id = objectHash["nodeID"]

        # param int drive_id: [required] 
        self.drive_id = objectHash["driveID"]

        # param str time_of_report: [required] 
        self.time_of_report = objectHash["timeOfReport"]

        # param str time_of_publish: [required] 
        self.time_of_publish = objectHash["timeOfPublish"]

        # param str details: [required] 
        self.details = objectHash["details"]
    end
end

class ListEventsResult
    attr_accessor :event_queue_type, :events

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str event_queue_type: [required] 
        self.event_queue_type = objectHash["eventQueueType"]

        # param EventInfo events: [required] 
        self.events = Array.new(objectHash["events"].length){ |i| EventInfo.new(objectHash["events"][i])}
    end
end

class NodeStatsNodes
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NodeStatsInfo nodes: [required] Node activity information for a single node. 
        self.nodes = Array.new(objectHash["nodes"].length){ |i| NodeStatsInfo.new(objectHash["nodes"][i])}
    end
end

class ListNodeStatsResult
    attr_accessor :node_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param NodeStatsNodes node_stats: [required] Node activity information for all nodes. 
        self.node_stats = objectHash["nodeStats"] ? NodeStatsNodes.new(objectHash["nodeStats"]) : nil
    end
end

class SnapshotRemoteStatus
    attr_accessor :remote_status, :volume_pair_uuid

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str remote_status: [required] 
        self.remote_status = objectHash["remoteStatus"]

        # param UUID volume_pair_uuid: [required] The snapshot is done and is writable (the active branch of the slice). 
        self.volume_pair_uuid = objectHash["volumePairUUID"] ? UUIDTools::UUID.parse(objectHash["volumePairUUID"]) : nil
    end
end

class Snapshot
    attr_accessor :snapshot_id, :volume_id, :name, :checksum, :enable_remote_replication, :expiration_reason, :expiration_time, :remote_statuses, :status, :snapshot_uuid, :total_size, :group_id, :group_snapshot_uuid, :create_time, :attributes, :virtual_volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Snapshots is an object containing information about each snapshot made for a volume.
        # The return object includes information for the active snapshot as well as each snapshot created for the volume.
        # param int snapshot_id: [required] Unique ID for this snapshot. 
        self.snapshot_id = objectHash["snapshotID"]

        # param int volume_id: [required] The volume this snapshot was taken of. 
        self.volume_id = objectHash["volumeID"]

        # param str name: [required] A name for this snapshot. It is not necessarily unique. 
        self.name = objectHash["name"]

        # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data. 
        self.checksum = objectHash["checksum"]

        # param bool enable_remote_replication: [required] Identifies if snapshot is enabled for remote replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]

        # param str expiration_reason: [required] Indicates how the snapshot expiration was set. Possible values: <br/><b>api</b>: expiration time was set by using the API. <br/><b>none</b>: there is no expiration time set. <br/><b>test</b>: expiration time was set for testing. 
        self.expiration_reason = objectHash["expirationReason"]

        # param str expiration_time: [required] The time at which this snapshot will expire and be purged from the cluster. 
        self.expiration_time = objectHash["expirationTime"]

        # param SnapshotRemoteStatus remote_statuses: [required] Current remote status of the snapshot remoteStatus: Possible values: <br/><b>Present</b>: Snapshot exists on a remote cluster <br/><b>Not Present</b>: Snapshot does not exist on remote cluster <br/><b>Syncing</b>: This is a target cluster and it is currently replicating the snapshot <br/><b>Deleted</b>: This is a target cluster, the snapshot has been deleted, and it still exists on the source. <br/><b>volumePairUUID</b>: universal identifier of the volume pair 
        self.remote_statuses = Array.new(objectHash["remoteStatuses"].length){ |i| SnapshotRemoteStatus.new(objectHash["remoteStatuses"][i])}

        # param str status: [required] Current status of the snapshot <br/><b>Preparing</b>: A snapshot that is being prepared for use and is not yet writable. <br/><b>Done</b>: A snapshot that has finished being prepared and is now usable. <br/><b>Active</b>: This snapshot is the active branch. 
        self.status = objectHash["status"]

        # param UUID snapshot_uuid: [required] Universal Unique ID of an existing snapshot. 
        self.snapshot_uuid = objectHash["snapshotUUID"] ? UUIDTools::UUID.parse(objectHash["snapshotUUID"]) : nil

        # param int total_size: [required] Total size of this snapshot in bytes. It is equivalent to totalSize of the volume when this snapshot was taken. 
        self.total_size = objectHash["totalSize"]

        # param int group_id:  If present, the ID of the group this snapshot is a part of. If not present, this snapshot is not part of a group. 
        self.group_id = objectHash["groupID"]

        # param UUID group_snapshot_uuid: [required] The current "members" results contains information about each snapshot in the group. Each of these members will have a "uuid" parameter for the snapshot's UUID. 
        self.group_snapshot_uuid = objectHash["groupSnapshotUUID"] ? UUIDTools::UUID.parse(objectHash["groupSnapshotUUID"]) : nil

        # param str create_time: [required] The time this snapshot was taken. 
        self.create_time = objectHash["createTime"]

        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]

        # param UUID virtual_volume_id: [required] The ID of the virtual volume with which the snapshot is associated. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil
    end
end

class ListSnapshotsResult
    attr_accessor :snapshots

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Snapshot snapshots: [required] Information about each snapshot for each volume. If volumeID is not provided, all snapshots for all volumes is returned. Snapshots that are in a group will be returned with a "groupID". Snapshots that are enabled for replication. 
        self.snapshots = Array.new(objectHash["snapshots"].length){ |i| Snapshot.new(objectHash["snapshots"][i])}
    end
end

class ListVolumeStatsByVolumeResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] List of account activity information. 
        self.volume_stats = Array.new(objectHash["volumeStats"].length){ |i| VolumeStats.new(objectHash["volumeStats"][i])}
    end
end

class RemoveVolumePairRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] ID of the volume on which to stop the replication process. 
        self.volume_id = objectHash["volumeID"]
    end
end

class InvokeSFApiRequest
    attr_accessor :method, :parameters

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str method: [required] The name of the method to invoke. This is case sensitive. 
        self.method = objectHash["method"]

        # param dict parameters:  An object, normally a dictionary or hashtable of the key/value pairs, to be passed as the params for the method being invoked. 
        self.parameters = objectHash["parameters"]
    end
end

class DeleteStorageContainersRequest
    attr_accessor :storage_container_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID storage_container_ids: [required] list of storageContainerID of the storage container to delete. 
        self.storage_container_ids = Array.new(objectHash["storageContainerIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["storageContainerIDs"][i])}
    end
end

class VirtualVolumeHost
    attr_accessor :virtual_volume_host_id, :cluster_id, :visible_protocol_endpoint_ids, :bindings, :initiator_names, :host_address

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_host_id: [required] 
        self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

        # param UUID cluster_id: [required] 
        self.cluster_id = objectHash["clusterID"] ? UUIDTools::UUID.parse(objectHash["clusterID"]) : nil

        # param UUID visible_protocol_endpoint_ids: [required] 
        self.visible_protocol_endpoint_ids = Array.new(objectHash["visibleProtocolEndpointIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["visibleProtocolEndpointIDs"][i])}

        # param int bindings: [required] 
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
        if(objectHash == nil)
            return
        end
        # param VirtualVolumeHost hosts: [required] List of known ESX hosts. 
        self.hosts = Array.new(objectHash["hosts"].length){ |i| VirtualVolumeHost.new(objectHash["hosts"][i])}
    end
end

class CompleteClusterPairingRequest
    attr_accessor :cluster_pairing_key

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str cluster_pairing_key: [required] A string of characters that is returned from the "StartClusterPairing" API method. 
        self.cluster_pairing_key = objectHash["clusterPairingKey"]
    end
end

class GetVolumeAccessGroupLunAssignmentsRequest
    attr_accessor :volume_access_group_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] Unique volume access group ID used to return information. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]
    end
end

class ListVolumesRequest
    attr_accessor :start_volume_id, :limit, :volume_status, :accounts, :is_paired, :volume_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int start_volume_id:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
        self.start_volume_id = objectHash["startVolumeID"]

        # param int limit:  The maximum number of volumes to return from the API. 
        self.limit = objectHash["limit"]

        # param str volume_status:  If specified, filter to only volumes with the provided status. By default, list all volumes. 
        self.volume_status = objectHash["volumeStatus"]

        # param int accounts:  If specified, only fetch volumes which belong to the provided accounts. By default, list volumes for all accounts. 
        self.accounts = objectHash["accounts"]

        # param bool is_paired:  If specified, only fetch volumes which are paired (if true) or non-paired (if false). By default, list all volumes regardless of their pairing status. 
        self.is_paired = objectHash["isPaired"]

        # param int volume_ids:  If specified, only fetch volumes specified in this list. This option cannot be specified if startVolumeID, limit, or accounts option is specified. 
        self.volume_ids = objectHash["volumeIDs"]
    end
end

class GetNodeHardwareInfoRequest
    attr_accessor :node_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int node_id: [required] The ID of the node for which hardware information is being requested.  Information about a  node is returned if a   node is specified. 
        self.node_id = objectHash["nodeID"]
    end
end

class DeleteVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to delete. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]
    end
end

class StartBulkVolumeReadResult
    attr_accessor :async_handle, :key, :url

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int async_handle: [required] ID of the async process to be checked for completion. 
        self.async_handle = objectHash["asyncHandle"]

        # param str key: [required] Opaque key uniquely identifying the session. 
        self.key = objectHash["key"]

        # param str url: [required] URL to access the node's web server 
        self.url = objectHash["url"]
    end
end

class GetSnmpStateResult
    attr_accessor :enabled, :snmp_v3_enabled

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool enabled: [required] If the nodes in the cluster are configured for SNMP. 
        self.enabled = objectHash["enabled"]

        # param bool snmp_v3_enabled: [required] If the node in the cluster is configured for SNMP v3. 
        self.snmp_v3_enabled = objectHash["snmpV3Enabled"]
    end
end

class DeleteVolumesResult
    attr_accessor :volumes, :curve

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] Information about the newly deleted volume. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}

        # param VolumeQOS curve: [required] 
        self.curve = objectHash["curve"] ? VolumeQOS.new(objectHash["curve"]) : nil
    end
end

class ListSchedulesResult
    attr_accessor :schedules

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Schedule schedules: [required] The list of schedules currently on the cluster. 
        self.schedules = Array.new(objectHash["schedules"].length){ |i| Schedule.new(objectHash["schedules"][i])}
    end
end

class VolumeAccessGroupLunAssignments
    attr_accessor :volume_access_group_id, :lun_assignments, :deleted_lun_assignments

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # VolumeAccessGroup ID and Lun to be assigned to all volumes within it.
        # param int volume_access_group_id: [required] Unique volume access group ID for which the LUN assignments will be modified. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param LunAssignment lun_assignments: [required] The volume IDs with assigned LUN values. 
        self.lun_assignments = Array.new(objectHash["lunAssignments"].length){ |i| LunAssignment.new(objectHash["lunAssignments"][i])}

        # param LunAssignment deleted_lun_assignments: [required] The volume IDs with deleted LUN values. 
        self.deleted_lun_assignments = Array.new(objectHash["deletedLunAssignments"].length){ |i| LunAssignment.new(objectHash["deletedLunAssignments"][i])}
    end
end

class GetVolumeAccessGroupLunAssignmentsResult
    attr_accessor :volume_access_group_lun_assignments

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeAccessGroupLunAssignments volume_access_group_lun_assignments: [required] List of all physical Fibre Channel ports, or a port for a single node. 
        self.volume_access_group_lun_assignments = objectHash["volumeAccessGroupLunAssignments"] ? VolumeAccessGroupLunAssignments.new(objectHash["volumeAccessGroupLunAssignments"]) : nil
    end
end

class ListAccountsResult
    attr_accessor :accounts

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Account accounts: [required] List of accounts. 
        self.accounts = Array.new(objectHash["accounts"].length){ |i| Account.new(objectHash["accounts"][i])}
    end
end

class ModifyScheduleResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class TestConnectSvipRequest
    attr_accessor :svip

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str svip:  Optionally, use to test the storage connection of a different SVIP. This is not needed to test the connection to the target cluster. 
        self.svip = objectHash["svip"]
    end
end

class GroupSnapshot
    attr_accessor :group_snapshot_id, :group_snapshot_uuid, :members, :name, :create_time, :status, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Group Snapshot object represents a point-in-time copy of a group of volumes.
        # param int group_snapshot_id: [required] Unique ID of the new group snapshot. 
        self.group_snapshot_id = objectHash["groupSnapshotID"]

        # param UUID group_snapshot_uuid: [required] UUID of the group snapshot. 
        self.group_snapshot_uuid = objectHash["groupSnapshotUUID"] ? UUIDTools::UUID.parse(objectHash["groupSnapshotUUID"]) : nil

        # param GroupSnapshotMembers members: [required] List of volumeIDs and snapshotIDs for each member of the group. 
        self.members = Array.new(objectHash["members"].length){ |i| GroupSnapshotMembers.new(objectHash["members"][i])}

        # param str name: [required] Name of the group snapshot, or, if none was given, the UTC formatted day and time on which the snapshot was created. 
        self.name = objectHash["name"]

        # param str create_time: [required] The UTC formatted day and time on which the snapshot was created. 
        self.create_time = objectHash["createTime"]

        # param str status: [required] Status of the snapshot. Possible values: <br/><b>Preparing</b>: A snapshot that is being prepared for use and is not yet writable. <br/><b>Done</b>: A snapshot that has finished being prepared and is now usable 
        self.status = objectHash["status"]

        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ListGroupSnapshotsResult
    attr_accessor :group_snapshots

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param GroupSnapshot group_snapshots: [required] List of Group Snapshots. 
        self.group_snapshots = Array.new(objectHash["groupSnapshots"].length){ |i| GroupSnapshot.new(objectHash["groupSnapshots"][i])}
    end
end

class ResetDrivesRequest
    attr_accessor :drives, :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str drives: [required] List of device names (not driveIDs) to reset. 
        self.drives = objectHash["drives"]

        # param bool force: [required] The "force" parameter must be included on this method to successfully reset a drive. 
        self.force = objectHash["force"]
    end
end

class RemoveClusterAdminResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class SetDefaultQoSRequest
    attr_accessor :min_iops, :max_iops, :burst_iops

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int min_iops:  The minimum number of sustained IOPS that are provided by the cluster to a volume. 
        self.min_iops = objectHash["minIOPS"]

        # param int max_iops:  The maximum number of sustained IOPS that are provided by the cluster to a volume. 
        self.max_iops = objectHash["maxIOPS"]

        # param int burst_iops:  The maximum number of IOPS allowed in a short burst scenario. 
        self.burst_iops = objectHash["burstIOPS"]
    end
end

class GetDriveHardwareInfoResult
    attr_accessor :drive_hardware_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param DriveHardwareInfo drive_hardware_info: [required] 
        self.drive_hardware_info = objectHash["driveHardwareInfo"] ? DriveHardwareInfo.new(objectHash["driveHardwareInfo"]) : nil
    end
end

class ListClusterFaultsRequest
    attr_accessor :exceptions, :best_practices, :update, :fault_types

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool exceptions:  
        self.exceptions = objectHash["exceptions"]

        # param bool best_practices:  Include faults triggered by sub-optimal system configuration. Possible values: true, false 
        self.best_practices = objectHash["bestPractices"]

        # param bool update:  
        self.update = objectHash["update"]

        # param str fault_types:  Determines the types of faults returned: current: List active, unresolved faults. <b>resolved</b>: List faults that were previously detected and resolved. <b>all</b>: (Default) List both current and resolved faults. You can see the fault status in the 'resolved' field of the Cluster Fault object. 
        self.fault_types = objectHash["faultTypes"]
    end
end

class DeleteVolumeRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] The ID of the volume to delete. 
        self.volume_id = objectHash["volumeID"]
    end
end

class GetNvramInfoResult
    attr_accessor :nvram_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param dict nvram_info: [required] Arrays of events and errors detected on the NVRAM card. 
        self.nvram_info = objectHash["nvramInfo"]
    end
end

class RemoveClusterAdminRequest
    attr_accessor :cluster_admin_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int cluster_admin_id: [required] ClusterAdminID for the Cluster Admin to remove. 
        self.cluster_admin_id = objectHash["clusterAdminID"]
    end
end

class GetVirtualVolumeCountResult
    attr_accessor :count

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int count: [required] The number of virtual volumes currently in the system. 
        self.count = objectHash["count"]
    end
end

class FeatureObject
    attr_accessor :enabled, :feature

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool enabled: [required] True if the feature is enabled, otherwise false. 
        self.enabled = objectHash["enabled"]

        # param str feature: [required] The name of the feature. 
        self.feature = objectHash["feature"]
    end
end

class GetFeatureStatusResult
    attr_accessor :features

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param FeatureObject features: [required] An array of feature objects indicating the feature name and its status. 
        self.features = Array.new(objectHash["features"].length){ |i| FeatureObject.new(objectHash["features"][i])}
    end
end

class CancelGroupCloneResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListStorageContainersResult
    attr_accessor :storage_containers

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param StorageContainer storage_containers: [required] 
        self.storage_containers = Array.new(objectHash["storageContainers"].length){ |i| StorageContainer.new(objectHash["storageContainers"][i])}
    end
end

class CreateScheduleRequest
    attr_accessor :schedule

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Schedule schedule: [required] The "Schedule" object will be used to create a new schedule.<br/> Do not set ScheduleID property, it will be ignored.<br/> Frequency property must be of type that inherits from Frequency. Valid types are:<br/> DaysOfMonthFrequency<br/> DaysOrWeekFrequency<br/> TimeIntervalFrequency 
        self.schedule = objectHash["schedule"] ? Schedule.new(objectHash["schedule"]) : nil
    end
end

class DeleteVolumeResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class GetLimitsResult
    attr_accessor :account_count_max, :account_name_length_max, :account_name_length_min, :bulk_volume_jobs_per_node_max, :bulk_volume_jobs_per_volume_max, :clone_jobs_per_volume_max, :cluster_pairs_count_max, :initiator_name_length_max, :initiator_count_max, :initiators_per_volume_access_group_count_max, :iscsi_sessions_from_fibre_channel_nodes_max, :secret_length_max, :secret_length_min, :snapshot_name_length_max, :snapshots_per_volume_max, :volume_access_group_count_max, :volume_access_group_lun_max, :volume_access_group_name_length_max, :volume_access_group_name_length_min, :volume_access_groups_per_initiator_count_max, :volume_access_groups_per_volume_count_max, :initiator_alias_length_max, :volume_burst_iopsmax, :volume_burst_iopsmin, :volume_count_max, :volume_max_iopsmax, :volume_max_iopsmin, :volume_min_iopsmax, :volume_min_iopsmin, :volume_name_length_max, :volume_name_length_min, :volume_size_max, :volume_size_min, :volumes_per_account_count_max, :volumes_per_group_snapshot_max, :volumes_per_volume_access_group_count_max

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Limits for the cluster
        # param int account_count_max: [required] 
        self.account_count_max = objectHash["accountCountMax"]

        # param int account_name_length_max: [required] 
        self.account_name_length_max = objectHash["accountNameLengthMax"]

        # param int account_name_length_min: [required] 
        self.account_name_length_min = objectHash["accountNameLengthMin"]

        # param int bulk_volume_jobs_per_node_max: [required] 
        self.bulk_volume_jobs_per_node_max = objectHash["bulkVolumeJobsPerNodeMax"]

        # param int bulk_volume_jobs_per_volume_max: [required] 
        self.bulk_volume_jobs_per_volume_max = objectHash["bulkVolumeJobsPerVolumeMax"]

        # param int clone_jobs_per_volume_max: [required] 
        self.clone_jobs_per_volume_max = objectHash["cloneJobsPerVolumeMax"]

        # param int cluster_pairs_count_max: [required] 
        self.cluster_pairs_count_max = objectHash["clusterPairsCountMax"]

        # param int initiator_name_length_max: [required] 
        self.initiator_name_length_max = objectHash["initiatorNameLengthMax"]

        # param int initiator_count_max: [required] 
        self.initiator_count_max = objectHash["initiatorCountMax"]

        # param int initiators_per_volume_access_group_count_max: [required] 
        self.initiators_per_volume_access_group_count_max = objectHash["initiatorsPerVolumeAccessGroupCountMax"]

        # param int iscsi_sessions_from_fibre_channel_nodes_max: [required] 
        self.iscsi_sessions_from_fibre_channel_nodes_max = objectHash["iscsiSessionsFromFibreChannelNodesMax"]

        # param int secret_length_max: [required] 
        self.secret_length_max = objectHash["secretLengthMax"]

        # param int secret_length_min: [required] 
        self.secret_length_min = objectHash["secretLengthMin"]

        # param int snapshot_name_length_max: [required] 
        self.snapshot_name_length_max = objectHash["snapshotNameLengthMax"]

        # param int snapshots_per_volume_max: [required] 
        self.snapshots_per_volume_max = objectHash["snapshotsPerVolumeMax"]

        # param int volume_access_group_count_max: [required] 
        self.volume_access_group_count_max = objectHash["volumeAccessGroupCountMax"]

        # param int volume_access_group_lun_max: [required] 
        self.volume_access_group_lun_max = objectHash["volumeAccessGroupLunMax"]

        # param int volume_access_group_name_length_max: [required] 
        self.volume_access_group_name_length_max = objectHash["volumeAccessGroupNameLengthMax"]

        # param int volume_access_group_name_length_min: [required] 
        self.volume_access_group_name_length_min = objectHash["volumeAccessGroupNameLengthMin"]

        # param int volume_access_groups_per_initiator_count_max: [required] 
        self.volume_access_groups_per_initiator_count_max = objectHash["volumeAccessGroupsPerInitiatorCountMax"]

        # param int volume_access_groups_per_volume_count_max: [required] 
        self.volume_access_groups_per_volume_count_max = objectHash["volumeAccessGroupsPerVolumeCountMax"]

        # param int initiator_alias_length_max: [required] 
        self.initiator_alias_length_max = objectHash["initiatorAliasLengthMax"]

        # param int volume_burst_iopsmax: [required] 
        self.volume_burst_iopsmax = objectHash["volumeBurstIOPSMax"]

        # param int volume_burst_iopsmin: [required] 
        self.volume_burst_iopsmin = objectHash["volumeBurstIOPSMin"]

        # param int volume_count_max: [required] 
        self.volume_count_max = objectHash["volumeCountMax"]

        # param int volume_max_iopsmax: [required] 
        self.volume_max_iopsmax = objectHash["volumeMaxIOPSMax"]

        # param int volume_max_iopsmin: [required] 
        self.volume_max_iopsmin = objectHash["volumeMaxIOPSMin"]

        # param int volume_min_iopsmax: [required] 
        self.volume_min_iopsmax = objectHash["volumeMinIOPSMax"]

        # param int volume_min_iopsmin: [required] 
        self.volume_min_iopsmin = objectHash["volumeMinIOPSMin"]

        # param int volume_name_length_max: [required] 
        self.volume_name_length_max = objectHash["volumeNameLengthMax"]

        # param int volume_name_length_min: [required] 
        self.volume_name_length_min = objectHash["volumeNameLengthMin"]

        # param int volume_size_max: [required] 
        self.volume_size_max = objectHash["volumeSizeMax"]

        # param int volume_size_min: [required] 
        self.volume_size_min = objectHash["volumeSizeMin"]

        # param int volumes_per_account_count_max: [required] 
        self.volumes_per_account_count_max = objectHash["volumesPerAccountCountMax"]

        # param int volumes_per_group_snapshot_max: [required] 
        self.volumes_per_group_snapshot_max = objectHash["volumesPerGroupSnapshotMax"]

        # param int volumes_per_volume_access_group_count_max: [required] 
        self.volumes_per_volume_access_group_count_max = objectHash["volumesPerVolumeAccessGroupCountMax"]
    end
end

class ListActiveVolumesRequest
    attr_accessor :start_volume_id, :limit

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int start_volume_id:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
        self.start_volume_id = objectHash["startVolumeID"]

        # param int limit:  The maximum number of volumes to return from the API. 
        self.limit = objectHash["limit"]
    end
end

class KernelCrashDump
    attr_accessor :kernel_crash_dump_min_free_gb, :kernel_crash_dump_directory, :kernel_crash_dump_kernel_options, :kernel_crash_dump_makedumpfile_level, :kernel_crash_dump_default_state

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int kernel_crash_dump_min_free_gb: [required] 
        self.kernel_crash_dump_min_free_gb = objectHash["kernelCrashDumpMinFreeGb"]

        # param str kernel_crash_dump_directory: [required] 
        self.kernel_crash_dump_directory = objectHash["kernelCrashDumpDirectory"]

        # param str kernel_crash_dump_kernel_options: [required] 
        self.kernel_crash_dump_kernel_options = objectHash["kernelCrashDumpKernelOptions"]

        # param int kernel_crash_dump_makedumpfile_level: [required] 
        self.kernel_crash_dump_makedumpfile_level = objectHash["kernelCrashDumpMakedumpfileLevel"]

        # param str kernel_crash_dump_default_state: [required] 
        self.kernel_crash_dump_default_state = objectHash["kernelCrashDumpDefaultState"]
    end
end

class SolidfireDefaults
    attr_accessor :slice_file_log_file_capacity, :post_callback_thread_count, :cpu_dma_latency, :buffer_cache_gb, :max_incoming_slice_syncs, :configured_iops, :s_cache_file_capacity, :max_drive_write_throughput_mbper_sec, :drive_write_throughput_mbper_sleep

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int slice_file_log_file_capacity: [required] 
        self.slice_file_log_file_capacity = objectHash["sliceFileLogFileCapacity"]

        # param int post_callback_thread_count: [required] 
        self.post_callback_thread_count = objectHash["postCallbackThreadCount"]

        # param int cpu_dma_latency: [required] 
        self.cpu_dma_latency = objectHash["cpuDmaLatency"]

        # param int buffer_cache_gb: [required] 
        self.buffer_cache_gb = objectHash["bufferCacheGB"]

        # param int max_incoming_slice_syncs: [required] 
        self.max_incoming_slice_syncs = objectHash["maxIncomingSliceSyncs"]

        # param int configured_iops: [required] 
        self.configured_iops = objectHash["configuredIops"]

        # param int s_cache_file_capacity: [required] 
        self.s_cache_file_capacity = objectHash["sCacheFileCapacity"]

        # param int max_drive_write_throughput_mbper_sec: [required] 
        self.max_drive_write_throughput_mbper_sec = objectHash["maxDriveWriteThroughputMBPerSec"]

        # param int drive_write_throughput_mbper_sleep: [required] 
        self.drive_write_throughput_mbper_sleep = objectHash["driveWriteThroughputMBPerSleep"]
    end
end

class HardwareConfig
    attr_accessor :scsi_bus_internal_driver, :network_driver, :bios_revision, :slot_offset, :num_cpu, :slice_drives, :num_drives, :kernel_crash_dump, :block_drive_size_bytes, :cpu_model, :bmc_firmware_revision, :cpu_cores_enabled, :fibre_channel_model, :chassis_type, :bmc_ipmi_version, :node_type, :solidfire_defaults, :idrac_version, :block_drives, :bios_vendor, :fibre_channel_firmware_revision, :scsi_bus_external_driver, :num_drives_internal, :slice_drive_size_bytes, :bios_version, :memory_mhz, :cpu_cores, :root_drive, :drive_size_bytes_internal, :lifecycle_version, :memory_gb, :cpu_threads

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str scsi_bus_internal_driver: [required] 
        self.scsi_bus_internal_driver = objectHash["scsiBusInternalDriver"]

        # param str network_driver: [required] 
        self.network_driver = objectHash["networkDriver"]

        # param str bios_revision: [required] 
        self.bios_revision = objectHash["biosRevision"]

        # param int slot_offset: [required] 
        self.slot_offset = objectHash["slotOffset"]

        # param int num_cpu: [required] 
        self.num_cpu = objectHash["numCpu"]

        # param str slice_drives: [required] 
        self.slice_drives = objectHash["sliceDrives"]

        # param int num_drives: [required] 
        self.num_drives = objectHash["numDrives"]

        # param KernelCrashDump kernel_crash_dump: [required] 
        self.kernel_crash_dump = objectHash["kernelCrashDump"] ? KernelCrashDump.new(objectHash["kernelCrashDump"]) : nil

        # param int block_drive_size_bytes: [required] 
        self.block_drive_size_bytes = objectHash["blockDriveSizeBytes"]

        # param str cpu_model: [required] 
        self.cpu_model = objectHash["cpuModel"]

        # param str bmc_firmware_revision: [required] 
        self.bmc_firmware_revision = objectHash["bmcFirmwareRevision"]

        # param int cpu_cores_enabled: [required] 
        self.cpu_cores_enabled = objectHash["cpuCoresEnabled"]

        # param str fibre_channel_model: [required] 
        self.fibre_channel_model = objectHash["fibreChannelModel"]

        # param str chassis_type: [required] 
        self.chassis_type = objectHash["chassisType"]

        # param str bmc_ipmi_version: [required] 
        self.bmc_ipmi_version = objectHash["bmcIpmiVersion"]

        # param str node_type: [required] 
        self.node_type = objectHash["nodeType"]

        # param SolidfireDefaults solidfire_defaults: [required] 
        self.solidfire_defaults = objectHash["solidfireDefaults"] ? SolidfireDefaults.new(objectHash["solidfireDefaults"]) : nil

        # param str idrac_version: [required] 
        self.idrac_version = objectHash["idracVersion"]

        # param str block_drives: [required] 
        self.block_drives = objectHash["blockDrives"]

        # param str bios_vendor: [required] 
        self.bios_vendor = objectHash["biosVendor"]

        # param str fibre_channel_firmware_revision: [required] 
        self.fibre_channel_firmware_revision = objectHash["fibreChannelFirmwareRevision"]

        # param str scsi_bus_external_driver: [required] 
        self.scsi_bus_external_driver = objectHash["scsiBusExternalDriver"]

        # param int num_drives_internal: [required] 
        self.num_drives_internal = objectHash["numDrivesInternal"]

        # param int slice_drive_size_bytes: [required] 
        self.slice_drive_size_bytes = objectHash["sliceDriveSizeBytes"]

        # param str bios_version: [required] 
        self.bios_version = objectHash["biosVersion"]

        # param int memory_mhz: [required] 
        self.memory_mhz = objectHash["memoryMhz"]

        # param int cpu_cores: [required] 
        self.cpu_cores = objectHash["cpuCores"]

        # param str root_drive: [required] 
        self.root_drive = objectHash["rootDrive"]

        # param int drive_size_bytes_internal: [required] 
        self.drive_size_bytes_internal = objectHash["driveSizeBytesInternal"]

        # param str lifecycle_version: [required] 
        self.lifecycle_version = objectHash["lifecycleVersion"]

        # param int memory_gb: [required] 
        self.memory_gb = objectHash["memoryGB"]

        # param int cpu_threads: [required] 
        self.cpu_threads = objectHash["cpuThreads"]
    end
end

class GetHardwareConfigResult
    attr_accessor :hardware_config

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param HardwareConfig hardware_config: [required] List of hardware information and current settings. 
        self.hardware_config = objectHash["hardwareConfig"] ? HardwareConfig.new(objectHash["hardwareConfig"]) : nil
    end
end

class CreateBackupTargetRequest
    attr_accessor :name, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str name: [required] Name for the backup target. 
        self.name = objectHash["name"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ModifyClusterAdminResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class GetVolumeStatsResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] Volume activity information. 
        self.volume_stats = objectHash["volumeStats"] ? VolumeStats.new(objectHash["volumeStats"]) : nil
    end
end

class CloneVolumeResult
    attr_accessor :clone_id, :volume_id, :async_handle

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int clone_id: [required] The ID of the newly-created clone. 
        self.clone_id = objectHash["cloneID"]

        # param int volume_id: [required] The volume ID of the newly-created clone. 
        self.volume_id = objectHash["volumeID"]

        # param int async_handle: [required] Handle value used to track the progress of the clone. 
        self.async_handle = objectHash["asyncHandle"]
    end
end

class VirtualVolumeNullResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RemoveInitiatorsFromVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id, :initiators

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to modify. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param str initiators: [required] List of initiators to remove from the volume access group. 
        self.initiators = objectHash["initiators"]
    end
end

class UpdateBulkVolumeStatusRequest
    attr_accessor :key, :status, :percent_complete, :message, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str key: [required] The key assigned during initialization of a "StartBulkVolumeRead" or "StartBulkVolumeWrite" session. 
        self.key = objectHash["key"]

        # param str status: [required] The SolidFire system sets the status of the given bulk volume job.<br/> Possible values:<br/> <br/><b>running</b>: jobs that are still active. <br/><b>complete</b>: jobs that are done. failed - jobs that have failed. <br/><b>failed</b>: jobs that have failed. 
        self.status = objectHash["status"]

        # param str percent_complete:  The completed progress of the bulk volume job as a percentage. 
        self.percent_complete = objectHash["percentComplete"]

        # param str message:  Returns the status of the bulk volume job when the job has completed. 
        self.message = objectHash["message"]

        # param dict attributes:  JSON attributes  updates what is on the bulk volume job. 
        self.attributes = objectHash["attributes"]
    end
end

class ListVolumeAccessGroupsRequest
    attr_accessor :start_volume_access_group_id, :limit

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int start_volume_access_group_id:  The lowest VolumeAccessGroupID to return. This can be useful for paging. If unspecified, there is no lower limit (implicitly 0). 
        self.start_volume_access_group_id = objectHash["startVolumeAccessGroupID"]

        # param int limit:  The maximum number of results to return. This can be useful for paging. 
        self.limit = objectHash["limit"]
    end
end

class DisableEncryptionAtRestResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RollbackToSnapshotRequest
    attr_accessor :volume_id, :snapshot_id, :save_current_state, :name, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] VolumeID for the volume. 
        self.volume_id = objectHash["volumeID"]

        # param int snapshot_id: [required] ID of a previously created snapshot on the given volume. 
        self.snapshot_id = objectHash["snapshotID"]

        # param bool save_current_state: [required] <br/><b>true</b>: The previous active volume image is kept. <br/><b>false</b>: (default) The previous active volume image is deleted. 
        self.save_current_state = objectHash["saveCurrentState"]

        # param str name:  Name for the snapshot. If no name is given, then the name of the snapshot being rolled back to is used with  "-copy" appended to the end of the name. 
        self.name = objectHash["name"]

        # param dict attributes:  List of Name/Value pairs in JSON object format 
        self.attributes = objectHash["attributes"]
    end
end

class ClusterInfo
    attr_accessor :attributes, :encryption_at_rest_state, :ensemble, :mvip, :mvip_node_id, :name, :rep_count, :state, :svip, :svip_node_id, :unique_id, :uuid

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # Cluster Info object returns information the node uses to communicate with the cluster.
        # param dict attributes: [required] List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]

        # param str encryption_at_rest_state: [required] Encryption at rest state. 
        self.encryption_at_rest_state = objectHash["encryptionAtRestState"]

        # param str ensemble: [required] Array of Node IP addresses that are participating in the cluster. 
        self.ensemble = objectHash["ensemble"]

        # param str mvip: [required] Management network interface. 
        self.mvip = objectHash["mvip"]

        # param int mvip_node_id: [required] Node holding the master MVIP address 
        self.mvip_node_id = objectHash["mvipNodeID"]

        # param str name: [required] Unique cluster name. 
        self.name = objectHash["name"]

        # param int rep_count: [required] Number of replicas of each piece of data to store in the cluster. Valid value is 2 
        self.rep_count = objectHash["repCount"]

        # param str state: [required] 
        self.state = objectHash["state"]

        # param str svip: [required] Storage virtual IP 
        self.svip = objectHash["svip"]

        # param int svip_node_id: [required] Node holding the master SVIP address. 
        self.svip_node_id = objectHash["svipNodeID"]

        # param str unique_id: [required] Unique ID for the cluster. 
        self.unique_id = objectHash["uniqueID"]

        # param UUID uuid: [required] 
        self.uuid = objectHash["uuid"] ? UUIDTools::UUID.parse(objectHash["uuid"]) : nil
    end
end

class GetClusterInfoResult
    attr_accessor :cluster_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param ClusterInfo cluster_info: [required] 
        self.cluster_info = objectHash["clusterInfo"] ? ClusterInfo.new(objectHash["clusterInfo"]) : nil
    end
end

class GetDriveHardwareInfoRequest
    attr_accessor :drive_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int drive_id: [required] DriveID for the drive information requested. DriveIDs can be obtained via the "ListDrives" method. 
        self.drive_id = objectHash["driveID"]
    end
end

class DeleteInitiatorsResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RestoreDeletedVolumeRequest
    attr_accessor :volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] VolumeID for the deleted volume to restore. 
        self.volume_id = objectHash["volumeID"]
    end
end

class DisableSnmpResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class ListVolumeStatsByVirtualVolumeRequest
    attr_accessor :virtual_volume_ids

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_ids:  A list of virtual volume  IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
        self.virtual_volume_ids = Array.new(objectHash["virtualVolumeIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["virtualVolumeIDs"][i])}
    end
end

class ListEventsRequest
    attr_accessor :max_events, :start_event_id, :end_event_id, :event_queue_type

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int max_events:  Specifies the maximum number of events to return. 
        self.max_events = objectHash["maxEvents"]

        # param int start_event_id:  Identifies the beginning of a range of events to return. 
        self.start_event_id = objectHash["startEventID"]

        # param int end_event_id:  Identifies the end of a range of events to return. 
        self.end_event_id = objectHash["endEventID"]

        # param str event_queue_type:  
        self.event_queue_type = objectHash["eventQueueType"]
    end
end

class DeleteStorageContainerResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class RemoveClusterPairRequest
    attr_accessor :cluster_pair_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int cluster_pair_id: [required] Unique identifier used to pair two clusters. 
        self.cluster_pair_id = objectHash["clusterPairID"]
    end
end

class TestConnectMvipRequest
    attr_accessor :mvip

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str mvip:  Optionally, use to test the management connection of a different MVIP. This is not needed to test the connection to the target cluster. 
        self.mvip = objectHash["mvip"]
    end
end

class ModifyAccountResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class EnableSnmpRequest
    attr_accessor :snmp_v3_enabled

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool snmp_v3_enabled: [required] If set to "true", then SNMP v3 is enabled on each node in the cluster. If set to "false", then SNMP v2 is enabled. 
        self.snmp_v3_enabled = objectHash["snmpV3Enabled"]
    end
end

class TestConnectEnsembleDetails
    attr_accessor :nodes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str nodes: [required] A list of each ensemble node in the test and the results of the tests. 
        self.nodes = objectHash["nodes"]
    end
end

class TestConnectEnsembleResult
    attr_accessor :details, :duration, :result

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param TestConnectEnsembleDetails details: [required] 
        self.details = objectHash["details"] ? TestConnectEnsembleDetails.new(objectHash["details"]) : nil

        # param str duration: [required] The length of time required to run the test. 
        self.duration = objectHash["duration"]

        # param str result: [required] The results of the entire test 
        self.result = objectHash["result"]
    end
end

class RemoveNodesResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class DisableLdapAuthenticationResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class SetSnmpACLRequest
    attr_accessor :networks, :usm_users

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpNetwork networks: [required] List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. REQUIRED if SNMP v# is disabled. 
        self.networks = Array.new(objectHash["networks"].length){ |i| SnmpNetwork.new(objectHash["networks"][i])}

        # param SnmpV3UsmUser usm_users: [required] List of users and the type of access they have to the SNMP servers running on the cluster nodes. REQUIRED if SNMP v3 is enabled. 
        self.usm_users = Array.new(objectHash["usmUsers"].length){ |i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
    end
end

class VirtualVolumeInfo
    attr_accessor :virtual_volume_id, :parent_virtual_volume_id, :storage_container_id, :storage_container, :volume_id, :snapshot_id, :virtual_volume_type, :status, :bindings, :children, :metadata, :snapshot_info, :volume_info

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_id: [required] 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

        # param UUID parent_virtual_volume_id: [required] 
        self.parent_virtual_volume_id = objectHash["parentVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["parentVirtualVolumeID"]) : nil

        # param UUID storage_container_id: [required] 
        self.storage_container_id = objectHash["storageContainerID"] ? UUIDTools::UUID.parse(objectHash["storageContainerID"]) : nil

        # param StorageContainer storage_container: [required] 
        self.storage_container = objectHash["storageContainer"] ? StorageContainer.new(objectHash["storageContainer"]) : nil

        # param int volume_id: [required] 
        self.volume_id = objectHash["volumeID"]

        # param int snapshot_id: [required] 
        self.snapshot_id = objectHash["snapshotID"]

        # param str virtual_volume_type: [required] 
        self.virtual_volume_type = objectHash["virtualVolumeType"]

        # param str status: [required] 
        self.status = objectHash["status"]

        # param int bindings: [required] 
        self.bindings = objectHash["bindings"]

        # param UUID children: [required] 
        self.children = Array.new(objectHash["children"].length){ |i| UUIDTools::UUID.parse(objectHash["children"][i])}

        # param dict metadata: [required] 
        self.metadata = objectHash["metadata"]

        # param Snapshot snapshot_info: [required] 
        self.snapshot_info = objectHash["snapshotInfo"] ? Snapshot.new(objectHash["snapshotInfo"]) : nil

        # param Volume volume_info: [required] 
        self.volume_info = objectHash["volumeInfo"] ? Volume.new(objectHash["volumeInfo"]) : nil
    end
end

class ListVirtualVolumesResult
    attr_accessor :virtual_volumes, :next_virtual_volume_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VirtualVolumeInfo virtual_volumes: [required] 
        self.virtual_volumes = Array.new(objectHash["virtualVolumes"].length){ |i| VirtualVolumeInfo.new(objectHash["virtualVolumes"][i])}

        # param UUID next_virtual_volume_id: [required] 
        self.next_virtual_volume_id = objectHash["nextVirtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["nextVirtualVolumeID"]) : nil
    end
end

class GetAccountByIDRequest
    attr_accessor :account_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] Specifies the account for which details are gathered. 
        self.account_id = objectHash["accountID"]
    end
end

class VirtualVolumeBinding
    attr_accessor :protocol_endpoint_id, :protocol_endpoint_in_band_id, :protocol_endpoint_type, :virtual_volume_binding_id, :virtual_volume_host_id, :virtual_volume_id, :virtual_volume_secondary_id, :virtual_volume, :protocol_endpoint, :virtual_volume_host

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID protocol_endpoint_id: [required] The unique ID of the protocol endpoint. 
        self.protocol_endpoint_id = objectHash["protocolEndpointID"] ? UUIDTools::UUID.parse(objectHash["protocolEndpointID"]) : nil

        # param str protocol_endpoint_in_band_id: [required] The scsiNAADeviceID of the protocol endpoint. For more information, see protocolEndpoint. 
        self.protocol_endpoint_in_band_id = objectHash["protocolEndpointInBandID"]

        # param str protocol_endpoint_type: [required] The type of protocol endpoint. SCSI is the only value returned for the protocol endpoint type. 
        self.protocol_endpoint_type = objectHash["protocolEndpointType"]

        # param int virtual_volume_binding_id: [required] The unique ID of the virtual volume binding object. 
        self.virtual_volume_binding_id = objectHash["virtualVolumeBindingID"]

        # param UUID virtual_volume_host_id: [required] The unique ID of the virtual volume host. 
        self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

        # param UUID virtual_volume_id: [required] The unique ID of the virtual volume. 
        self.virtual_volume_id = objectHash["virtualVolumeID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeID"]) : nil

        # param str virtual_volume_secondary_id: [required] The secondary ID of the virtual volume. 
        self.virtual_volume_secondary_id = objectHash["virtualVolumeSecondaryID"]

        # param VirtualVolumeInfo virtual_volume: [required] An object describing the bound volume or snapshot. 
        self.virtual_volume = objectHash["virtualVolume"] ? VirtualVolumeInfo.new(objectHash["virtualVolume"]) : nil

        # param UUID protocol_endpoint: [required] An object describing the protocol endpoint to which the virtual volume is bound. 
        self.protocol_endpoint = objectHash["protocolEndpoint"] ? UUIDTools::UUID.parse(objectHash["protocolEndpoint"]) : nil

        # param VirtualVolumeHost virtual_volume_host: [required] An object describing the host to which this binding corresponds. 
        self.virtual_volume_host = objectHash["virtualVolumeHost"] ? VirtualVolumeHost.new(objectHash["virtualVolumeHost"]) : nil
    end
end

class ListVirtualVolumeBindingsResult
    attr_accessor :bindings

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VirtualVolumeBinding bindings: [required] Describes the VVol <-> Host binding. 
        self.bindings = Array.new(objectHash["bindings"].length){ |i| VirtualVolumeBinding.new(objectHash["bindings"][i])}
    end
end

class ModifyVolumeAccessGroupRequest
    attr_accessor :volume_access_group_id, :virtual_network_id, :virtual_network_tags, :name, :initiators, :volumes, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_access_group_id: [required] The ID of the volume access group to modify. 
        self.volume_access_group_id = objectHash["volumeAccessGroupID"]

        # param int virtual_network_id:  The ID of the SolidFire Virtual Network ID to associate the volume access group with. 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tags:  The ID of the VLAN Virtual Network Tag to associate the volume access group with. 
        self.virtual_network_tags = objectHash["virtualNetworkTags"]

        # param str name:  Name of the volume access group. It is not required to be unique, but recommended. 
        self.name = objectHash["name"]

        # param str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators will not be modified. 
        self.initiators = objectHash["initiators"]

        # param int volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes will not be modified. 
        self.volumes = objectHash["volumes"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class VirtualVolumeUnsharedChunkResult
    attr_accessor :chunks, :scanned_chunks, :chunk_size

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int chunks: [required] Number of allocated/unshared chunks. 
        self.chunks = objectHash["chunks"]

        # param int scanned_chunks: [required] Number of chunks scanned. 
        self.scanned_chunks = objectHash["scannedChunks"]

        # param int chunk_size: [required] Size of each chunk. 
        self.chunk_size = objectHash["chunkSize"]
    end
end

class CreateSnapshotResult
    attr_accessor :snapshot_id, :checksum

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int snapshot_id: [required] ID of the newly-created snapshot. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str checksum: [required] A string that represents the correct digits in the stored snapshot. This checksum can be used later to compare other snapshots to detect errors in the data. 
        self.checksum = objectHash["checksum"]
    end
end

class SetConfigResult
    attr_accessor :config

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Config config: [required] The new and current configuration for the node. 
        self.config = objectHash["config"] ? Config.new(objectHash["config"]) : nil
    end
end

class ModifySnapshotRequest
    attr_accessor :snapshot_id, :expiration_time, :enable_remote_replication

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int snapshot_id: [required] ID of the snapshot. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str expiration_time:  Use to set the time when the snapshot should be removed. 
        self.expiration_time = objectHash["expirationTime"]

        # param bool enable_remote_replication:  Use to enable the snapshot created to be replicated to a remote SolidFire cluster. Possible values: <br/><b>true</b>: the snapshot will be replicated to remote storage. <br/><b>false</b>: Default. No replication. 
        self.enable_remote_replication = objectHash["enableRemoteReplication"]
    end
end

class ModifyVirtualNetworkRequest
    attr_accessor :virtual_network_id, :virtual_network_tag, :name, :address_blocks, :netmask, :svip, :gateway, :namespace, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_id:  Unique identifier of the virtual network to modify. This is the virtual network ID assigned by the SolidFire cluster. 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tag:  Network Tag that identifies the virtual network to modify. 
        self.virtual_network_tag = objectHash["virtualNetworkTag"]

        # param str name:  New name for the virtual network. 
        self.name = objectHash["name"]

        # param AddressBlock address_blocks:  New addressBlock to set for this Virtual Network object. This may contain new address blocks to add to the existing object or it may omit unused address blocks that need to be removed. Alternatively, existing address blocks may be extended or reduced in size. The size of the starting addressBlocks for a Virtual Network object can only be increased, and can never be decreased. Attributes for this parameter are: <br/><b>start:</b> start of the IP address range. (String) <br/><b>size:</b> numbre of IP addresses to include in the block. (Integer) 
        self.address_blocks = Array.new(objectHash["addressBlocks"].length){ |i| AddressBlock.new(objectHash["addressBlocks"][i])}

        # param str netmask:  New netmask for this virtual network. 
        self.netmask = objectHash["netmask"]

        # param str svip:  The storage virtual IP address for this virtual network. The svip for Virtual Network cannot be changed. A new Virtual Network must be created in order to use a different svip address. 
        self.svip = objectHash["svip"]

        # param str gateway:   
        self.gateway = objectHash["gateway"]

        # param bool namespace:   
        self.namespace = objectHash["namespace"]

        # param dict attributes:  A new list of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class ModifyClusterAdminRequest
    attr_accessor :cluster_admin_id, :password, :access, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int cluster_admin_id: [required] ClusterAdminID for the Cluster Admin or LDAP Cluster Admin to modify. 
        self.cluster_admin_id = objectHash["clusterAdminID"]

        # param str password:  Password used to authenticate this Cluster Admin. 
        self.password = objectHash["password"]

        # param str access:  Controls which methods this Cluster Admin can use. For more details on the levels of access, see "Access Control" in the Element API Guide. 
        self.access = objectHash["access"]

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class StartBulkVolumeReadRequest
    attr_accessor :volume_id, :format, :snapshot_id, :script, :script_parameters, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] ID of the volume to be read. 
        self.volume_id = objectHash["volumeID"]

        # param str format: [required] The format of the volume data. Can be either: <br/><b>uncompressed</b>: every byte of the volume is returned without any compression. <br/><b>native</b>: opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write. 
        self.format = objectHash["format"]

        # param int snapshot_id:  ID of a previously created snapshot used for bulk volume reads. If no ID is entered, a snapshot of the current active volume image is made. 
        self.snapshot_id = objectHash["snapshotID"]

        # param str script:  Executable name of a script. If no script name is given then the key and URL is necessary to access SolidFire nodes. The script is run on the primary node and the key and URL is returned to the script so the local web server can be contacted. 
        self.script = objectHash["script"]

        # param str script_parameters:  JSON parameters to pass to the script. 
        self.script_parameters = objectHash["scriptParameters"]

        # param dict attributes:  JSON attributes for the bulk volume job. 
        self.attributes = objectHash["attributes"]
    end
end

class ListDeletedVolumesResult
    attr_accessor :volumes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param Volume volumes: [required] List of deleted volumes. 
        self.volumes = Array.new(objectHash["volumes"].length){ |i| Volume.new(objectHash["volumes"][i])}
    end
end

class ListVirtualNetworksRequest
    attr_accessor :virtual_network_id, :virtual_network_tag, :virtual_network_ids, :virtual_network_tags

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_id:  Network ID to filter the list for a single virtual network 
        self.virtual_network_id = objectHash["virtualNetworkID"]

        # param int virtual_network_tag:  Network Tag to filter the list for a single virtual network 
        self.virtual_network_tag = objectHash["virtualNetworkTag"]

        # param int virtual_network_ids:  NetworkIDs to include in the list. 
        self.virtual_network_ids = objectHash["virtualNetworkIDs"]

        # param int virtual_network_tags:  Network Tags to include in the list. 
        self.virtual_network_tags = objectHash["virtualNetworkTags"]
    end
end

class AddVirtualNetworkResult
    attr_accessor :virtual_network_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int virtual_network_id: [required] The virtual network ID of the new virtual network. 
        self.virtual_network_id = objectHash["virtualNetworkID"]
    end
end

class DeleteVolumeAccessGroupResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class CreateVolumeRequest
    attr_accessor :name, :account_id, :total_size, :enable512e, :qos, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str name: [required] Name of the volume. Not required to be unique, but it is recommended. May be 1 to 64 characters in length. 
        self.name = objectHash["name"]

        # param int account_id: [required] AccountID for the owner of this volume. 
        self.account_id = objectHash["accountID"]

        # param int total_size: [required] Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size. 
        self.total_size = objectHash["totalSize"]

        # param bool enable512e: [required] Should the volume provides 512-byte sector emulation? 
        self.enable512e = objectHash["enable512e"]

        # param QoS qos:  Initial quality of service settings for this volume. <br/><br/> Volumes created without specified QoS values are created with the default values for QoS. Default values for a volume can be found by running the GetDefaultQoS method. 
        self.qos = objectHash["qos"] ? QoS.new(objectHash["qos"]) : nil

        # param dict attributes:  List of Name/Value pairs in JSON object format. 
        self.attributes = objectHash["attributes"]
    end
end

class SetSnmpInfoRequest
    attr_accessor :networks, :enabled, :snmp_v3_enabled, :usm_users

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param SnmpNetwork networks:  List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. SNMP v2 only. 
        self.networks = Array.new(objectHash["networks"].length){ |i| SnmpNetwork.new(objectHash["networks"][i])}

        # param bool enabled:  If set to "true", then SNMP is enabled on each node in the cluster. 
        self.enabled = objectHash["enabled"]

        # param bool snmp_v3_enabled:  If set to "true", then SNMP v3 is enabled on each node in the cluster. 
        self.snmp_v3_enabled = objectHash["snmpV3Enabled"]

        # param SnmpV3UsmUser usm_users:  If SNMP v3 is enabled, this value must be passed in place of the "networks" parameter. SNMP v3 only. 
        self.usm_users = Array.new(objectHash["usmUsers"].length){ |i| SnmpV3UsmUser.new(objectHash["usmUsers"][i])}
    end
end

class GetVirtualVolumeTaskUpdateRequest
    attr_accessor :virtual_volume_task_id, :calling_virtual_volume_host_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_task_id: [required] The UUID of the VVol Task. 
        self.virtual_volume_task_id = objectHash["virtualVolumeTaskID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeTaskID"]) : nil

        # param UUID calling_virtual_volume_host_id:  
        self.calling_virtual_volume_host_id = objectHash["callingVirtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["callingVirtualVolumeHostID"]) : nil
    end
end

class CopyVolumeRequest
    attr_accessor :volume_id, :dst_volume_id, :snapshot_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] Source volume to copy. 
        self.volume_id = objectHash["volumeID"]

        # param int dst_volume_id: [required] Destination volume for the copy. 
        self.dst_volume_id = objectHash["dstVolumeID"]

        # param int snapshot_id:  Snapshot ID of the source volume to create the copy from. 
        self.snapshot_id = objectHash["snapshotID"]
    end
end

class CreateVirtualVolumeHostRequest
    attr_accessor :virtual_volume_host_id, :cluster_id, :initiator_names, :visible_protocol_endpoint_ids, :host_address, :calling_virtual_volume_host_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param UUID virtual_volume_host_id: [required] The GUID of the ESX host. 
        self.virtual_volume_host_id = objectHash["virtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["virtualVolumeHostID"]) : nil

        # param UUID cluster_id: [required] The GUID of the ESX Cluster. 
        self.cluster_id = objectHash["clusterID"] ? UUIDTools::UUID.parse(objectHash["clusterID"]) : nil

        # param str initiator_names:  
        self.initiator_names = objectHash["initiatorNames"]

        # param UUID visible_protocol_endpoint_ids:  A list of PEs the host is aware of. 
        self.visible_protocol_endpoint_ids = Array.new(objectHash["visibleProtocolEndpointIDs"].length){ |i| UUIDTools::UUID.parse(objectHash["visibleProtocolEndpointIDs"][i])}

        # param str host_address:  IP or DNS name for the host. 
        self.host_address = objectHash["hostAddress"]

        # param UUID calling_virtual_volume_host_id:  
        self.calling_virtual_volume_host_id = objectHash["callingVirtualVolumeHostID"] ? UUIDTools::UUID.parse(objectHash["callingVirtualVolumeHostID"]) : nil
    end
end

class ListVolumeStatsByAccountResult
    attr_accessor :volume_stats

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param VolumeStats volume_stats: [required] List of account activity information. <br/><b>Note</b>: The volumeID member is 0 for each entry, as the values represent the summation of all volumes owned by the account. 
        self.volume_stats = Array.new(objectHash["volumeStats"].length){ |i| VolumeStats.new(objectHash["volumeStats"][i])}
    end
end

class StartBulkVolumeWriteRequest
    attr_accessor :volume_id, :format, :script, :script_parameters, :attributes

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] ID of the volume to be written to. 
        self.volume_id = objectHash["volumeID"]

        # param str format: [required] The format of the volume data. Can be either: <br/><b>uncompressed</b>: every byte of the volume is returned without any compression. <br/><b>native</b>: opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write 
        self.format = objectHash["format"]

        # param str script:  Executable name of a script. If no script name is given then the key and URL are necessary to access SolidFire nodes. The script runs on the primary node and the key and URL is returned to the script so the local web server can be contacted. 
        self.script = objectHash["script"]

        # param str script_parameters:  JSON parameters to pass to the script. 
        self.script_parameters = objectHash["scriptParameters"]

        # param dict attributes:  JSON attributes for the bulk volume job. 
        self.attributes = objectHash["attributes"]
    end
end

class CreateVolumeResult
    attr_accessor :volume_id, :curve

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int volume_id: [required] VolumeID for the newly created volume. 
        self.volume_id = objectHash["volumeID"]

        # param int curve: [required] The curve is a set of key-value pairs. The keys are I/O sizes in bytes. The values represent the cost performing an IOP at a specific I/O size. The curve is calculated relative to a 4096 byte operation set at 100 IOPS. 
        self.curve = objectHash["curve"]
    end
end

class EnableLdapAuthenticationResult
    attr_accessor 

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end    end
end

class AddClusterAdminResult
    attr_accessor :cluster_admin_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int cluster_admin_id: [required] ClusterAdminID for the newly created Cluster Admin. 
        self.cluster_admin_id = objectHash["clusterAdminID"]
    end
end

class GetAccountEfficiencyRequest
    attr_accessor :account_id, :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int account_id: [required] Specifies the volume account for which capacity is computed. 
        self.account_id = objectHash["accountID"]

        # param bool force:  
        self.force = objectHash["force"]
    end
end

class ListDriveHardwareRequest
    attr_accessor :force

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param bool force: [required] This must be set to true in order to retrieve the drive hardware stats from the cluster. 
        self.force = objectHash["force"]
    end
end

class TestLdapAuthenticationRequest
    attr_accessor :username, :password, :ldap_configuration

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param str username: [required] The username to be tested. 
        self.username = objectHash["username"]

        # param str password: [required] The password for the username to be tester. 
        self.password = objectHash["password"]

        # param LdapConfiguration ldap_configuration:  An ldapConfiguration object to be tested. If this parameter is provided, the API call will test the provided configuration even if LDAP authentication is currently disabled. 
        self.ldap_configuration = objectHash["ldapConfiguration"] ? LdapConfiguration.new(objectHash["ldapConfiguration"]) : nil
    end
end

class GetVolumeEfficiencyResult
    attr_accessor :compression, :deduplication, :missing_volumes, :thin_provisioning, :timestamp

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param float compression: [required] The amount of space being saved by compressing data on a single volume. Stated as a ratio where "1" means data has been stored without being compressed. 
        self.compression = objectHash["compression"]

        # param float deduplication: [required] The amount of space being saved on a single volume by not duplicating data. Stated as a ratio. 
        self.deduplication = objectHash["deduplication"]

        # param int missing_volumes: [required] The volumes that could not be queried for efficiency data. Missing volumes can be caused by GC being less than hour old, temporary network loss or restarted services since the GC cycle. 
        self.missing_volumes = objectHash["missingVolumes"]

        # param float thin_provisioning: [required] The ratio of space used to the amount of space allocated for storing data. Stated as a ratio. 
        self.thin_provisioning = objectHash["thinProvisioning"]

        # param str timestamp: [required] The last time efficiency data was collected after Garbage Collection (GC). 
        self.timestamp = objectHash["timestamp"]
    end
end

class CancelCloneRequest
    attr_accessor :clone_id

    def initialize(objectHash = nil)
        if(objectHash == nil)
            return
        end
        # param int clone_id: [required] 
        self.clone_id = objectHash["cloneID"]
    end
end
