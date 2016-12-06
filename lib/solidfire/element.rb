require 'net/http'
require 'net/https'
require 'uri'
require 'rubygems'
require 'json'

class Element
  def initialize(host, port, username, password, connection_version, verify_ssl)
    @user = username
    @pass = password
    @host = host
    @port = port
    @connection_version = connection_version.to_f
    if verify_ssl
      @verify_mode = OpenSSL::SSL::VERIFY_PEER
    else
      @verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    @post_ws = "/json-rpc/" + connection_version
    @url = "https://"+@host+":"+@port.to_s+"/json-rpc/"+@connection_version.to_s
  end

  def send_request(payload)
    uri = URI.parse(@url)
    uri.query = URI.encode_www_form(payload)
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.verify_mode = @verify_mode
    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth @user, @pass
    res = https.request(req)
    puts(res)
    puts(res.body)
    output = JSON.parse(res.body)
    return output["result"]
  end


  def check_connection(version, type)
    if @connection_version < version
      raise "The connection version is too low. You need a connection of at least version "+version+" to run this command."
    end
    if(type == "Cluster" && @port == "442")
      raise "This command can only be run on a Cluster connection. You tried to run it on a Node connection."
    end
    if(type == "Node" && @port == "443")
      raise "This command can only be run on a Node connection. You tried to run it on a Cluster connection."
    end
  end

  def add_account(username,initiator_secret = nil,target_secret = nil,attributes = nil)
    ######
    # Used to add a new account to the system.
    # New volumes can be created under the new account.
    # The CHAP settings specified for the account applies to all volumes owned by the account.
    # param: str username: [required] Unique username for this account. (May be 1 to 64 characters in length). 
    
    # param: CHAPSecret initiatorSecret:  CHAP secret to use for the initiator. Should be 12-16 characters long and impenetrable. The CHAP initiator secrets must be unique and cannot be the same as the target CHAP secret. <br/><br/> If not specified, a random secret is created. 
    
    # param: CHAPSecret targetSecret:  CHAP secret to use for the target (mutual CHAP authentication). Should be 12-16 characters long and impenetrable. The CHAP target secrets must be unique and cannot be the same as the initiator CHAP secret. <br/><br/> If not specified, a random secret is created. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "username" => username,
      "method" => "AddAccount"
    }
    
    if initiator_secret != nil
      raise "initiator_secret should be of type CHAPSecret." unless initiator_secret.class.name == "CHAPSecret"
      payload["initiatorSecret"] = initiator_secret.secret
    end
    if target_secret != nil
      raise "target_secret should be of type CHAPSecret." unless target_secret.class.name == "CHAPSecret"
      payload["targetSecret"] = target_secret.secret
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddAccountResult.new(raw_response) : nil
  end

  def get_account_by_id(account_id)
    ######
    # Returns details about an account, given its AccountID.
    # param: int accountID: [required] Specifies the account for which details are gathered. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "accountID" => account_id,
      "method" => "GetAccountByID"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAccountResult.new(raw_response) : nil
  end

  def get_account_by_name(username)
    ######
    # Returns details about an account, given its Username.
    # param: str username: [required] Username for the account. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "username" => username,
      "method" => "GetAccountByName"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAccountResult.new(raw_response) : nil
  end

  def list_accounts(start_account_id = nil,limit = nil)
    ######
    # Returns the entire list of accounts, with optional paging support.
    # param: int startAccountID:  Starting AccountID to return. If no Account exists with this AccountID, the next Account by AccountID order is used as the start of the list. To page through the list, pass the AccountID of the last Account in the previous response + 1 
    
    # param: int limit:  Maximum number of AccountInfo objects to return. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListAccounts"
    }
    
    if start_account_id != nil
      payload["startAccountID"] = start_account_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAccountsResult.new(raw_response) : nil
  end

  def modify_account(account_id,username = nil,status = nil,initiator_secret = nil,target_secret = nil,attributes = nil)
    ######
    # Used to modify an existing account.
    # When locking an account, any existing connections from that account are immediately terminated.
    # When changing CHAP settings, any existing connections continue to be active,
    # and the new CHAP values are only used on subsequent connection or reconnection.
    # param: int accountID: [required] AccountID for the account to modify. 
    
    # param: str username:  Change the username of the account to this value. 
    
    # param: str status:  Status of the account. 
    
    # param: CHAPSecret initiatorSecret:  CHAP secret to use for the initiator. Should be 12-16 characters long and impenetrable. 
    
    # param: CHAPSecret targetSecret:  CHAP secret to use for the target (mutual CHAP authentication). Should be 12-16 characters long and impenetrable. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "accountID" => account_id,
      "method" => "ModifyAccount"
    }
    
    if username != nil
      payload["username"] = username
    end
    if status != nil
      payload["status"] = status
    end
    if initiator_secret != nil
      raise "initiator_secret should be of type CHAPSecret." unless initiator_secret.class.name == "CHAPSecret"
      payload["initiatorSecret"] = initiator_secret.secret
    end
    if target_secret != nil
      raise "target_secret should be of type CHAPSecret." unless target_secret.class.name == "CHAPSecret"
      payload["targetSecret"] = target_secret.secret
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyAccountResult.new(raw_response) : nil
  end

  def remove_account(account_id)
    ######
    # Used to remove an existing account.
    # All Volumes must be deleted and purged on the account before it can be removed.
    # If volumes on the account are still pending deletion, RemoveAccount cannot be used until DeleteVolume to delete and purge the volumes.
    # param: int accountID: [required] AccountID for the account to remove. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "accountID" => account_id,
      "method" => "RemoveAccount"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveAccountResult.new(raw_response) : nil
  end

  def get_account_efficiency(account_id,force = nil)
    ######
    # GetAccountEfficiency is used to retrieve information about a volume account. Only the account given as a parameter in this API method is used to compute the capacity.
    # param: int accountID: [required] Specifies the volume account for which capacity is computed. 
    
    # param: bool force:  
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "accountID" => account_id,
      "method" => "GetAccountEfficiency"
    }
    
    if force != nil
      payload["force"] = force
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetEfficiencyResult.new(raw_response) : nil
  end

  def create_backup_target(name,attributes = nil)
    ######
    # CreateBackupTarget allows you to create and store backup target information so that you do not need to re-enter it each time a backup is created.
    # param: str name: [required] Name for the backup target. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "name" => name,
      "method" => "CreateBackupTarget"
    }
    
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateBackupTargetResult.new(raw_response) : nil
  end

  def get_backup_target(backup_target_id)
    ######
    # GetBackupTarget allows you to return information about a specific backup target that has been created.
    # param: int backupTargetID: [required] Unique identifier assigned to the backup target. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "backupTargetID" => backup_target_id,
      "method" => "GetBackupTarget"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetBackupTargetResult.new(raw_response) : nil
  end

  def list_backup_targets()
    ######
    # You can use ListBackupTargets to retrieve information about all backup targets that have been created.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListBackupTargets"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListBackupTargetsResult.new(raw_response) : nil
  end

  def modify_backup_target(backup_target_id,name = nil,attributes = nil)
    ######
    # ModifyBackupTarget is used to change attributes of a backup target.
    # param: int backupTargetID: [required] Unique identifier assigned to the backup target. 
    
    # param: str name:  Name for the backup target. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "backupTargetID" => backup_target_id,
      "method" => "ModifyBackupTarget"
    }
    
    if name != nil
      payload["name"] = name
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyBackupTargetResult.new(raw_response) : nil
  end

  def remove_backup_target(backup_target_id)
    ######
    # RemoveBackupTarget allows you to delete backup targets.
    # param: int backupTargetID: [required] Unique target ID of the target to remove. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "backupTargetID" => backup_target_id,
      "method" => "RemoveBackupTarget"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveBackupTargetResult.new(raw_response) : nil
  end

  def get_cluster_capacity()
    ######
    # Return the high-level capacity measurements for an entire cluster.
    # The fields returned from this method can be used to calculate the efficiency rates that are displayed in the Element User Interface.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterCapacity"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterCapacityResult.new(raw_response) : nil
  end

  def get_cluster_info()
    ######
    # Return configuration information about the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterInfoResult.new(raw_response) : nil
  end

  def get_cluster_version_info()
    ######
    # Return information about the Element software version running on each node in the cluster.
    # Information about the nodes that are currently in the process of upgrading software is also returned.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterVersionInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterVersionInfoResult.new(raw_response) : nil
  end

  def get_limits()
    ######
    # GetLimits enables you to retrieve the limit values set by the API. These values might change between releases of  Element, but do not change without an update to the system. Knowing the limit values set by the API can be useful when writing API scripts for user-facing tools.NOTE: The GetLimits method returns the limits for the current software version regardless of the API endpoint version used to pass the method.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetLimits"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetLimitsResult.new(raw_response) : nil
  end

  def list_events(max_events = nil,start_event_id = nil,end_event_id = nil,event_queue_type = nil)
    ######
    # ListEvents returns events detected on the cluster, sorted from oldest to newest.
    # param: int maxEvents:  Specifies the maximum number of events to return. 
    
    # param: int startEventID:  Identifies the beginning of a range of events to return. 
    
    # param: int endEventID:  Identifies the end of a range of events to return. 
    
    # param: str eventQueueType:  
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListEvents"
    }
    
    if max_events != nil
      payload["maxEvents"] = max_events
    end
    if start_event_id != nil
      payload["startEventID"] = start_event_id
    end
    if end_event_id != nil
      payload["endEventID"] = end_event_id
    end
    if event_queue_type != nil
      payload["eventQueueType"] = event_queue_type
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListEventsResult.new(raw_response) : nil
  end

  def list_cluster_faults(exceptions = nil,best_practices = nil,update = nil,fault_types = nil)
    ######
    # ListClusterFaults is used to retrieve information about any faults detected on the cluster.
    # With this method, both current and resolved faults can be retrieved. The system caches faults every 30 seconds.
    # param: bool exceptions:  
    
    # param: bool bestPractices:  Include faults triggered by sub-optimal system configuration. Possible values: true, false 
    
    # param: bool update:  
    
    # param: str faultTypes:  Determines the types of faults returned: current: List active, unresolved faults. <b>resolved</b>: List faults that were previously detected and resolved. <b>all</b>: (Default) List both current and resolved faults. You can see the fault status in the 'resolved' field of the Cluster Fault object. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListClusterFaults"
    }
    
    if exceptions != nil
      payload["exceptions"] = exceptions
    end
    if best_practices != nil
      payload["bestPractices"] = best_practices
    end
    if update != nil
      payload["update"] = update
    end
    if fault_types != nil
      payload["faultTypes"] = fault_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterFaultsResult.new(raw_response) : nil
  end

  def clear_cluster_faults(fault_types = nil)
    ######
    # ClearClusterFaults is used to clear information about both current faults that are resolved as well as faults that were previously detected and resolved can be cleared.
    # param: str faultTypes:  Determines the types of faults cleared:<br/> <b>current</b>: Faults that are currently detected and have not been resolved.<br/> <b>resolved</b>: Faults that were previously detected and resolved.<br/> <b>all</b>: Both current and resolved faults are cleared. The fault status can be determined by the "resolved" field of the fault object. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ClearClusterFaults"
    }
    
    if fault_types != nil
      payload["faultTypes"] = fault_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ClearClusterFaultsResult.new(raw_response) : nil
  end

  def get_cluster_config()
    ######
    # The GetClusterConfig API method is used to return information about the cluster configuration this node uses to communicate with the cluster it is a part of.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "GetClusterConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterConfigResult.new(raw_response) : nil
  end

  def get_cluster_full_threshold()
    ######
    # GetClusterFullThreshold is used to view the stages set for cluster fullness levels. All levels are returned when this method is entered.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterFullThreshold"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterFullThresholdResult.new(raw_response) : nil
  end

  def modify_cluster_full_threshold(stage2_aware_threshold = nil,stage3_block_threshold_percent = nil,max_metadata_over_provision_factor = nil)
    ######
    # ModifyClusterFullThreshold is used to change the level at which an event is generated when the storage cluster approaches the capacity utilization requested. The number entered in this setting is used to indicate the number of node failures the system is required to recover from. For example, on a 10 node cluster, if you want to be alerted when the system cannot recover from 3 nodes failures, enter the value of "3". When this number is reached, a message alert is sent to the Event Log in the Cluster Management Console.
    # param: int stage2AwareThreshold:  Number of nodes worth of capacity remaining on the cluster that triggers a notification. 
    
    # param: int stage3BlockThresholdPercent:  Percent below "Error" state to raise a cluster "Warning" alert. 
    
    # param: int maxMetadataOverProvisionFactor:  A value representative of the number of times metadata space can be over provisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes could be created. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ModifyClusterFullThreshold"
    }
    
    if stage2_aware_threshold != nil
      payload["stage2AwareThreshold"] = stage2_aware_threshold
    end
    if stage3_block_threshold_percent != nil
      payload["stage3BlockThresholdPercent"] = stage3_block_threshold_percent
    end
    if max_metadata_over_provision_factor != nil
      payload["maxMetadataOverProvisionFactor"] = max_metadata_over_provision_factor
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyClusterFullThresholdResult.new(raw_response) : nil
  end

  def get_cluster_stats()
    ######
    # GetClusterStats is used to return high-level activity measurements for the cluster. Values returned are cumulative from the creation of the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterStatsResult.new(raw_response) : nil
  end

  def list_cluster_admins()
    ######
    # ListClusterAdmins returns the list of all cluster administrators for the cluster. There can be several cluster administrators that have different levels of permissions. There can be only one primary cluster administrator in the system. The primary Cluster Admin is the administrator that was created when the cluster was created. LDAP administrators can also be created when setting up an LDAP system on the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListClusterAdmins"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterAdminsResult.new(raw_response) : nil
  end

  def add_cluster_admin(username,password,access,accept_eula = nil,attributes = nil)
    ######
    # AddClusterAdmin adds a new Cluster Admin. A Cluster Admin can be used to manage the cluster via the API and management tools. Cluster Admins are completely separate and unrelated to standard tenant accounts.
    # <br/><br/>
    # Each Cluster Admin can be restricted to a sub-set of the API. SolidFire recommends using multiple Cluster Admins for different users and applications. Each Cluster Admin should be given the minimal permissions necessary to reduce the potential impact of credential compromise.
    # param: str username: [required] Unique username for this Cluster Admin. 
    
    # param: str password: [required] Password used to authenticate this Cluster Admin. 
    
    # param: str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see "Access Control" in the Element API Guide. 
    
    # param: bool acceptEula:  Indicate your acceptance of the End User License Agreement when creating this cluster admin. To accept the EULA, set this parameter to true. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "username" => username,
      "password" => password,
      "access" => access,
      "method" => "AddClusterAdmin"
    }
    
    if accept_eula != nil
      payload["acceptEula"] = accept_eula
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddClusterAdminResult.new(raw_response) : nil
  end

  def modify_cluster_admin(cluster_admin_id,password = nil,access = nil,attributes = nil)
    ######
    # ModifyClusterAdmin is used to change the settings for a Cluster Admin or LDAP Cluster Admin. Access for the administrator Cluster Admin account cannot be changed.
    # param: int clusterAdminID: [required] ClusterAdminID for the Cluster Admin or LDAP Cluster Admin to modify. 
    
    # param: str password:  Password used to authenticate this Cluster Admin. 
    
    # param: str access:  Controls which methods this Cluster Admin can use. For more details on the levels of access, see "Access Control" in the Element API Guide. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "clusterAdminID" => cluster_admin_id,
      "method" => "ModifyClusterAdmin"
    }
    
    if password != nil
      payload["password"] = password
    end
    if access != nil
      payload["access"] = access
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyClusterAdminResult.new(raw_response) : nil
  end

  def remove_cluster_admin(cluster_admin_id)
    ######
    # RemoveClusterAdmin is used to remove a Cluster Admin. The "admin" Cluster Admin cannot be removed.
    # param: int clusterAdminID: [required] ClusterAdminID for the Cluster Admin to remove. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "clusterAdminID" => cluster_admin_id,
      "method" => "RemoveClusterAdmin"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveClusterAdminResult.new(raw_response) : nil
  end

  def set_cluster_config(cluster)
    ######
    # The SetClusterConfig API method is used to set the configuration this node uses to communicate with the cluster it is associated with. To see the states in which these objects can be modified see Cluster Object on page 109. To display the current cluster interface settings for a node, run the GetClusterConfig API method.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: ClusterConfig cluster: [required] Objects that are changed for the cluster interface settings. Only the fields you want changed need to be added to this method as objects in the "cluster" parameter. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "cluster" => cluster,
      "method" => "SetClusterConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetClusterConfigResult.new(raw_response) : nil
  end

  def get_snmp_acl()
    ######
    # GetSnmpACL is used to return the current SNMP access permissions on the cluster nodes.######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "GetSnmpACL"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpACLResult.new(raw_response) : nil
  end

  def set_snmp_acl(networks,usm_users)
    ######
    # SetSnmpACL is used to configure SNMP access permissions on the cluster nodes. The values set with this interface apply to all nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpACL. Also note that the values set with this interface replace all "network" or "usmUsers" values set with the older SetSnmpInfo.
    # param: SnmpNetwork networks: [required] List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. REQUIRED if SNMP v# is disabled. 
    
    # param: SnmpV3UsmUser usmUsers: [required] List of users and the type of access they have to the SNMP servers running on the cluster nodes. REQUIRED if SNMP v3 is enabled. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "networks" => networks,
      "usmUsers" => usm_users,
      "method" => "SetSnmpACL"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpACLResult.new(raw_response) : nil
  end

  def get_snmp_trap_info()
    ######
    # GetSnmpTrapInfo is used to return current SNMP trap configuration information.######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "GetSnmpTrapInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpTrapInfoResult.new(raw_response) : nil
  end

  def set_snmp_trap_info(trap_recipients,cluster_fault_traps_enabled,cluster_fault_resolved_traps_enabled,cluster_event_traps_enabled)
    ######
    # SetSnmpTrapInfo is used to enable and disable the generation of SolidFire SNMP notifications (traps) and to specify the set of network host computers that are to receive the notifications. The values passed with each SetSnmpTrapInfo method replaces all values set in any previous method to SetSnmpTrapInfo.
    # param: SnmpTrapRecipient trapRecipients: [required] List of hosts that are to receive the traps generated by the Cluster Master. At least one object is required if any one of the trap types is enabled. 
    
    # param: bool clusterFaultTrapsEnabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients. 
    
    # param: bool clusterFaultResolvedTrapsEnabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients. 
    
    # param: bool clusterEventTrapsEnabled: [required] If "true", when a cluster fault is logged a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "trapRecipients" => trap_recipients,
      "clusterFaultTrapsEnabled" => cluster_fault_traps_enabled,
      "clusterFaultResolvedTrapsEnabled" => cluster_fault_resolved_traps_enabled,
      "clusterEventTrapsEnabled" => cluster_event_traps_enabled,
      "method" => "SetSnmpTrapInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpTrapInfoResult.new(raw_response) : nil
  end

  def enable_snmp(snmp_v3_enabled)
    ######
    # EnableSnmp is used to enable SNMP on the cluster nodes. The values set with this interface apply to all nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to EnableSnmp.
    # param: bool snmpV3Enabled: [required] If set to "true", then SNMP v3 is enabled on each node in the cluster. If set to "false", then SNMP v2 is enabled. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "snmpV3Enabled" => snmp_v3_enabled,
      "method" => "EnableSnmp"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableSnmpResult.new(raw_response) : nil
  end

  def disable_snmp()
    ######
    # DisableSnmp is used to disable SNMP on the cluster nodes.######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "DisableSnmp"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableSnmpResult.new(raw_response) : nil
  end

  def get_snmp_info()
    ######
    # GetSnmpInfo is used to return the current simple network management protocol (SNMP) configuration information.
    # <br/><br/>
    # <b>Note</b>: GetSnmpInfo will be available for Element OS 8 and prior releases. It will be deprecated after Element OS 8. There are two new SNMP API methods that you should migrate over to. They are GetSnmpState and GetSnmpACL. Please see details in this document for their descriptions and usage.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetSnmpInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpInfoResult.new(raw_response) : nil
  end

  def set_snmp_info(networks = nil,enabled = nil,snmp_v3_enabled = nil,usm_users = nil)
    ######
    # SetSnmpInfo is used to configure SNMP v2 and v3 on the cluster nodes. The values set with this interface apply to all nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpInfo.
    # <br/><br/>
    # <b>Note</b>: EnableSnmp and SetSnmpACL methods can be used to accomplish the same results as SetSnmpInfo. SetSnmpInfo will no longer be available after the Element 8 release. Please use EnableSnmp and SetSnmpACL in the future.
    # param: SnmpNetwork networks:  List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. SNMP v2 only. 
    
    # param: bool enabled:  If set to "true", then SNMP is enabled on each node in the cluster. 
    
    # param: bool snmpV3Enabled:  If set to "true", then SNMP v3 is enabled on each node in the cluster. 
    
    # param: SnmpV3UsmUser usmUsers:  If SNMP v3 is enabled, this value must be passed in place of the "networks" parameter. SNMP v3 only. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "SetSnmpInfo"
    }
    
    if networks != nil
      payload["networks"] = networks
    end
    if enabled != nil
      payload["enabled"] = enabled
    end
    if snmp_v3_enabled != nil
      payload["snmpV3Enabled"] = snmp_v3_enabled
    end
    if usm_users != nil
      payload["usmUsers"] = usm_users
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpInfoResult.new(raw_response) : nil
  end

  def get_snmp_state()
    ######
    # GetSnmpState is used to return the current state of the SNMP feature.
    # <br/><br/>
    # <b>Note</b>: GetSnmpState is new for Element OS 8. Please use this method and SetSnmpACL to migrate your SNMP functionality in the future.######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "GetSnmpState"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpStateResult.new(raw_response) : nil
  end

  def get_api()
    ######
    # Retrieves the current version of the API and a list of all supported versions.######

    check_connection(1.0, "Both")

    payload ={ 
      "method" => "GetAPI"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAPIResult.new(raw_response) : nil
  end

  def get_ntp_info()
    ######
    # GetNtpInfo is used to return the current network time protocol (NTP) configuration information.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetNtpInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNtpInfoResult.new(raw_response) : nil
  end

  def get_cluster_state(force = nil)
    ######
    # The GetClusterState method is used to indicate if a node is part of a cluster or not. The three states are: <br><strong>Available:</strong> Node has not been configured with a cluster name.<br><strong>Pending:</strong> Node is pending for a specific named cluster and can be added.<br><strong>Active:</strong> Node is active and a member of a cluster and may not be added to another cluster.
    # param: bool force:  
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "GetClusterState"
    }
    
    if force != nil
      payload["force"] = force
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterStateResult.new(raw_response) : nil
  end

  def get_current_cluster_admin()
    ######
    # GetCurrentClusterAdmin returns information for the current primary cluster administrator. The primary Cluster Admin was ncreated when the cluster was created.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "GetCurrentClusterAdmin"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetCurrentClusterAdminResult.new(raw_response) : nil
  end

  def enable_encryption_at_rest()
    ######
    # The EnableEncryptionAtRest method is used to enable the Advanced Encryption Standard (AES) 256-bit encryption at rest on the cluster so that the cluster can manage the encryption key used for the drives on each node. This feature is not enabled by default. Enabling this operation allows the cluster to automatically manage encryption keys internally for the drives on each node in the cluster. Nodes do not store the keys to unlock drives and the keys are never passed over the network. Two nodes participating in a cluster are required to access the key to disable encryption on a drive. The encryption management does not affect performance or efficiency on the cluster. If an encryption-enabled drive or node is removed from the cluster with the API, all data is secure erased and any data left on the drive cannot be read or accessed.
    # Enabling or disabling encryption should be performed when the cluster is running and in a healthy state. Encryption can be enabled or disabled at your discretion and can be performed as often as you need.
    # <br/><b>Note</b>: This process is asynchronous and returns a response before encryption is enabled. The GetClusterInfo method can be used to poll the system to see when the process has completed.######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "EnableEncryptionAtRest"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableEncryptionAtRestResult.new(raw_response) : nil
  end

  def disable_encryption_at_rest()
    ######
    # The DisableEncryptionAtRest method enables you to remove the encryption that was previously applied to the cluster using the EnableEncryptionAtRest method.
    # This disable method is asynchronous and returns a response before encryption is disabled.
    # You can use the GetClusterInfo method to poll the system to see when the process has completed.######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "DisableEncryptionAtRest"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableEncryptionAtRestResult.new(raw_response) : nil
  end

  def snmp_send_test_traps()
    ######
    # SnmpSendTestTraps enables you to test SNMP functionality for a cluster. This method instructs the cluster to send test SNMP traps to the currently configured SNMP manager.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "SnmpSendTestTraps"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SnmpSendTestTrapsResult.new(raw_response) : nil
  end

  def get_async_result(async_handle)
    ######
    # Used to retrieve the result of asynchronous method calls.
    # Some method calls are long running and do not complete when the initial response is sent.
    # To obtain the result of the method call, polling with GetAsyncResult is required.
    # <br/><br/>
    # GetAsyncResult returns the overall status of the operation (in progress, completed, or error) in a standard fashion,
    # but the actual data returned for the operation depends on the original method call and the return data is documented with each method.
    # <br/><br/>
    # The result for a completed asynchronous method call can only be retrieved once.
    # Once the final result has been returned, later attempts returns an error.
    # param: int asyncHandle: [required] A value that was returned from the original asynchronous method call. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "asyncHandle" => async_handle,
      "method" => "GetAsyncResult"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAsyncResultResult.new(raw_response) : nil
  end

  def add_drives(drives)
    ######
    # AddDrives is used to add one or more available drives to the cluster enabling the drives to host a portion of the cluster's data.
    # When you add a node to the cluster or install new drives in an existing node, the new drives are marked as "available" and must be added via AddDrives before they can be utilized.
    # Use the "ListDrives" method to display drives that are "available" to be added.
    # When you add multiple drives, it is more efficient to add them in a single "AddDrives" method call rather than multiple individual methods with a single drive each.
    # This reduces the amount of data balancing that must occur to stabilize the storage load on the cluster.
    # <br/><br/>
    # When you add a drive, the system automatically determines the "type" of drive it should be.
    # <br/><br/>
    # The method returns immediately. However, it may take some time for the data in the cluster to be rebalanced using the newly added drives.
    # As the new drive(s) are syncing on the system, you can use the "ListSyncJobs" method to see how the drive(s) are being rebalanced and the progress of adding the new drive.
    # param: NewDrive drives: [required] List of drives to add to the cluster. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "drives" => drives,
      "method" => "AddDrives"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddDrivesResult.new(raw_response) : nil
  end

  def list_drives()
    ######
    # ListDrives allows you to retrieve the list of the drives that exist in the cluster's active nodes.
    # This method returns drives that have been added as volume metadata or block drives as well as drives that have not been added and are available.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListDrives"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDrivesResult.new(raw_response) : nil
  end

  def get_drive_hardware_info(drive_id)
    ######
    # GetDriveHardwareInfo returns all the hardware info for the given drive. This generally includes manufacturers, vendors, versions, and other associated hardware identification information.
    # param: int driveID: [required] DriveID for the drive information requested. DriveIDs can be obtained via the "ListDrives" method. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "driveID" => drive_id,
      "method" => "GetDriveHardwareInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetDriveHardwareInfoResult.new(raw_response) : nil
  end

  def list_drive_hardware(force)
    ######
    # ListDriveHardware returns all the drives connected to a node. Use this method on the cluster to return drive hardware information for all the drives on all nodes.
    # param: bool force: [required] This must be set to true in order to retrieve the drive hardware stats from the cluster. 
    ######

    check_connection(7.0, "Node")

    payload ={ 
      "force" => force,
      "method" => "ListDriveHardware"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDriveHardwareResult.new(raw_response) : nil
  end

  def reset_drives(drives,force)
    ######
    # ResetDrives is used to pro-actively initialize drives and remove all data currently residing on the drive. The drive can then be reused in an existing node or used in an upgraded SolidFire node. This method requires the force=true parameter to be included in the method call.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str drives: [required] List of device names (not driveIDs) to reset. 
    
    # param: bool force: [required] The "force" parameter must be included on this method to successfully reset a drive. 
    ######

    check_connection(6.0, "Node")

    payload ={ 
      "drives" => drives,
      "force" => force,
      "method" => "ResetDrives"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ResetDrivesResult.new(raw_response) : nil
  end

  def test_drives(force,minutes = nil)
    ######
    # The TestDrives API method is used to run a hardware validation on all the drives on the node. Hardware failures on the drives are detected if present and they are reported in the results of the validation tests.
    # <br/><br/>
    # <b>Note</b>: This test takes approximately 10 minutes.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: int minutes:  The number of minutes to run the test can be specified. 
    
    # param: bool force: [required] The "force" parameter must be included on this method to successfully test the drives on the node. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "force" => force,
      "method" => "TestDrives"
    }
    
    if minutes != nil
      payload["minutes"] = minutes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestDrivesResult.new(raw_response) : nil
  end

  def get_drive_stats(drive_id)
    ######
    # GetDriveStats return high-level activity measurements for a single drive. Values are cumulative from the addition of the drive to the cluster. Some values are specific to Block Drives. Statistical data may not be returned for both block and metadata drives when running this method.
    # For more information on which drive type returns which data, see Response Example (Block Drive) and Response Example (Volume Metadata Drive) in the SolidFire API guide.
    # param: int driveID: [required] Specifies the drive for which statistics are gathered. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "driveID" => drive_id,
      "method" => "GetDriveStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetDriveStatsResult.new(raw_response) : nil
  end

  def secure_erase_drives(drives)
    ######
    # SecureEraseDrives is used to remove any residual data from drives that have a status of "available." For example, when replacing a drive at its end-of-life that contained sensitive data.
    # It uses a Security Erase Unit command to write a predetermined pattern to the drive and resets the encryption key on the drive. The method may take up to two minutes to complete, so it is an asynchronous method.
    # The GetAsyncResult method can be used to check on the status of the secure erase operation.
    # <br/><br/>
    # Use the "ListDrives" method to obtain the driveIDs for the drives you want to secure erase.
    # param: int drives: [required] List of driveIDs to secure erase. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "drives" => drives,
      "method" => "SecureEraseDrives"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AsyncHandleResult.new(raw_response) : nil
  end

  def remove_drives(drives)
    ######
    # You can use RemoveDrives to proactively remove drives that are part of the cluster.
    # You may want to use this method when reducing cluster capacity or preparing to replace drives nearing the end of their service life.
    # Any data on the drives is removed and migrated to other drives in the cluster before the drive is removed from the cluster. This is an asynchronous method.
    # Depending on the total capacity of the drives being removed, it may take several minutes to migrate all of the data.
    # Use the "GetAsyncResult" method to check the status of the remove operation.
    # <br/><br/>
    # When removing multiple drives, use a single "RemoveDrives" method call rather than multiple individual methods with a single drive each.
    # This reduces the amount of data balancing that must occur to even stabilize the storage load on the cluster.
    # <br/><br/>
    # You can also remove drives with a "failed" status using "RemoveDrives".
    # When you remove a drive with a "failed" status it is not returned to an "available" or "active" status.
    # The drive is unavailable for use in the cluster.
    # <br/><br/>
    # Use the "ListDrives" method to obtain the driveIDs for the drives you want to remove.
    # param: int drives: [required] List of driveIDs to remove from the cluster. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "drives" => drives,
      "method" => "RemoveDrives"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AsyncHandleResult.new(raw_response) : nil
  end

  def get_feature_status(feature = nil)
    ######
    # GetFeatureStatus allows you to retrieve the status of a cluster feature.
    # param: str feature:  Valid values: vvols: Find the status of the Virtual Volumes (VVOLs) cluster feature. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "GetFeatureStatus"
    }
    
    if feature != nil
      payload["feature"] = feature
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetFeatureStatusResult.new(raw_response) : nil
  end

  def enable_feature(feature)
    ######
    # EnableFeature allows you to enable cluster features that are disabled by default.
    # param: str feature: [required] Valid values: vvols: Enable the Virtual Volumes (VVOLs) cluster feature. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "feature" => feature,
      "method" => "EnableFeature"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableFeatureResult.new(raw_response) : nil
  end

  def list_fibre_channel_port_info()
    ######
    # The ListFibreChannelPortInfo is used to return information about the Fibre Channel ports. The API method is intended for use on individual nodes; userid and password is required for access to individual Fibre Channel nodes. However, this method can be used on the cluster if the force=true parameter is included in the method call. When used on the cluster, all Fibre Channel interfaces are listed.######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "ListFibreChannelPortInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListFibreChannelPortInfoResult.new(raw_response) : nil
  end

  def list_node_fibre_channel_port_info(force = nil)
    ######
    # The ListNodeFibreChannelPortInfo is used to return information about the Fibre Channel ports. The API method is intended for use on individual nodes; userid and password is required for access to individual Fibre Channel nodes. However, this method can be used on the cluster if the force=true parameter is included in the method call. When used on the cluster, all Fibre Channel interfaces are listed.
    # param: bool force:  Specify force=true to call method on all member nodes of the cluster. 
    ######

    check_connection(7.0, "Node")

    payload ={ 
      "method" => "ListNodeFibreChannelPortInfo"
    }
    
    if force != nil
      payload["force"] = force
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListNodeFibreChannelPortInfoResult.new(raw_response) : nil
  end

  def list_fibre_channel_sessions()
    ######
    # The ListFibreChannelSessions is used to return information about the active Fibre Channel sessions on a cluster.######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "ListFibreChannelSessions"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListFibreChannelSessionsResult.new(raw_response) : nil
  end

  def get_cluster_hardware_info(type = nil)
    ######
    # You can use the GetClusterHardwareInfo method to retrieve the hardware status and information for all Fibre Channel nodes, iSCSI nodes and drives in the cluster. This generally includes manufacturers, vendors, versions, and other associated hardware identification information.
    # param: str type:  Include only a certain type of hardware information in the response. Can be one of the following:drives: List only drive information in the response.nodes: List only node information in the response.all: Include both drive and node information in the response.If this parameter is omitted, a type of "all" is assumed. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetClusterHardwareInfo"
    }
    
    if type != nil
      payload["type"] = type
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterHardwareInfoResult.new(raw_response) : nil
  end

  def get_hardware_config()
    ######
    # GetHardwareConfig enables you to display the hardware configuration information for a node. NOTE: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "GetHardwareConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetHardwareConfigResult.new(raw_response) : nil
  end

  def get_node_hardware_info(node_id)
    ######
    # GetNodeHardwareInfo is used to return all the hardware info and status for the node specified. This generally includes manufacturers, vendors, versions, and other associated hardware identification information.
    # param: int nodeID: [required] The ID of the node for which hardware information is being requested.  Information about a  node is returned if a   node is specified. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "nodeID" => node_id,
      "method" => "GetNodeHardwareInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNodeHardwareInfoResult.new(raw_response) : nil
  end

  def get_nvram_info()
    ######
    # GetNvramInfo allows you to retrieve information from each node about the NVRAM card.  ######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "GetNvramInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNvramInfoResult.new(raw_response) : nil
  end

  def create_initiators(initiators)
    ######
    # CreateInitiators enables you to create multiple new initiator IQNs or World Wide Port Names (WWPNs) and optionally assign them aliases and attributes. When you use CreateInitiators to create new initiators, you can also add them to volume access groups.
    # If CreateInitiators fails to create one of the initiators provided in the parameter, the method returns an error and does not create any initiators (no partial completion is possible).
    # param: CreateInitiator initiators: [required] A list of Initiator objects containing characteristics of each new initiator 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "initiators" => initiators,
      "method" => "CreateInitiators"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateInitiatorsResult.new(raw_response) : nil
  end

  def modify_initiators(initiators)
    ######
    # ModifyInitiators enables you to change the attributes of an existing initiator. You cannot change the name of an existing initiator. If you need to change the name of an initiator, delete the existing initiator with DeleteInitiators and create a new one with CreateInitiators.
    # If ModifyInitiators fails to change one of the initiators provided in the parameter, the method returns an error and does not create any initiators (no partial completion is possible).
    # param: ModifyInitiator initiators: [required] A list of Initiator objects containing characteristics of each initiator to modify. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "initiators" => initiators,
      "method" => "ModifyInitiators"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyInitiatorsResult.new(raw_response) : nil
  end

  def delete_initiators(initiators)
    ######
    # DeleteInitiators enables you to delete one or more initiators from the system (and from any associated volumes or volume access groups).
    # If DeleteInitiators fails to delete one of the initiators provided in the parameter, the system returns an error and does not delete any initiators (no partial completion is possible).
    # param: int initiators: [required] An array of IDs of initiators to delete. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "initiators" => initiators,
      "method" => "DeleteInitiators"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteInitiatorsResult.new(raw_response) : nil
  end

  def list_initiators(start_initiator_id = nil,limit = nil,initiators = nil)
    ######
    # ListInitiators enables you to list initiator IQNs or World Wide Port Names (WWPNs).
    # param: int startInitiatorID:  The initiator ID at which to begin the listing. You can supply this parameter or the "initiators" parameter, but not both. 
    
    # param: int limit:  The maximum number of initiator objects to return. 
    
    # param: int initiators:  A list of initiator IDs to retrieve. You can supply this parameter or the "startInitiatorID" parameter, but not both. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListInitiators"
    }
    
    if start_initiator_id != nil
      payload["startInitiatorID"] = start_initiator_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    if initiators != nil
      payload["initiators"] = initiators
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListInitiatorsResult.new(raw_response) : nil
  end

  def invoke_sfapi(method,parameters = nil)
    ######
    # This will invoke any API method supported by the SolidFire API for the version and port the connection is using.
    # Returns a nested hashtable of key/value pairs that contain the result of the invoked method.
    # param: str method: [required] The name of the method to invoke. This is case sensitive. 
    
    # param: dict parameters:  An object, normally a dictionary or hashtable of the key/value pairs, to be passed as the params for the method being invoked. 
    ######

    check_connection(1.0, "Both")

    payload ={ 
      "method" => method,
      "method" => "InvokeSFApi"
    }
    
    if parameters != nil
      payload["parameters"] = parameters
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? str.new(raw_response) : nil
  end

  def add_ldap_cluster_admin(username,access,accept_eula = nil,attributes = nil)
    ######
    # AddLdapClusterAdmin is used to add a new LDAP Cluster Admin. An LDAP Cluster Admin can be used to manage the cluster via the API and management tools. LDAP Cluster Admins are completely separate and unrelated to standard tenant accounts.
    # <br/><br/>
    # An LDAP group that has been defined in Active Directory can also be added using this API method. The access level that is given to the group will be passed to the individual users in the LDAP group.
    # param: str username: [required] The distinguished user name for the new LDAP cluster admin. 
    
    # param: str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see the Access Control appendix in the SolidFire API Reference. 
    
    # param: bool acceptEula:  Indicate your acceptance of the End User License Agreement when creating this cluster admin. To accept the EULA, set this parameter to true. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "username" => username,
      "access" => access,
      "method" => "AddLdapClusterAdmin"
    }
    
    if accept_eula != nil
      payload["acceptEula"] = accept_eula
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddLdapClusterAdminResult.new(raw_response) : nil
  end

  def test_ldap_authentication(username,password,ldap_configuration = nil)
    ######
    # The TestLdapAuthentication is used to verify the currently enabled LDAP authentication configuration settings are correct. If the configuration settings are correct, the API call returns a list of the groups the tested user is a member of.
    # param: str username: [required] The username to be tested. 
    
    # param: str password: [required] The password for the username to be tester. 
    
    # param: LdapConfiguration ldapConfiguration:  An ldapConfiguration object to be tested. If this parameter is provided, the API call will test the provided configuration even if LDAP authentication is currently disabled. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "username" => username,
      "password" => password,
      "method" => "TestLdapAuthentication"
    }
    
    if ldap_configuration != nil
      payload["ldapConfiguration"] = ldap_configuration
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestLdapAuthenticationResult.new(raw_response) : nil
  end

  def get_ldap_configuration()
    ######
    # The GetLdapConfiguration is used to get the LDAP configuration currently active on the cluster.######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "GetLdapConfiguration"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetLdapConfigurationResult.new(raw_response) : nil
  end

  def enable_ldap_authentication(server_uris,auth_type = nil,group_search_base_dn = nil,group_search_custom_filter = nil,group_search_type = nil,search_bind_dn = nil,search_bind_password = nil,user_dntemplate = nil,user_search_base_dn = nil,user_search_filter = nil)
    ######
    # The EnableLdapAuthentication method is used to configure an LDAP server connection to use for LDAP authentication to a SolidFire cluster. Users that are members on the LDAP server can then log in to a SolidFire storage system using their LDAP authentication userid and password.
    # param: str authType:  Identifies which user authentcation method will be used. <br/> Must be one of the following:<br/> <b>DirectBind</b><br/> <b>SearchAndBind</b> (default) 
    
    # param: str groupSearchBaseDN:  The base DN of the tree to start the group search (will do a subtree search from here). 
    
    # param: str groupSearchCustomFilter:  REQUIRED for CustomFilter<br/> For use with the CustomFilter search type, an LDAP filter to use to return the DNs of a user's groups.<br/> The string can have placeholder text of %USERNAME% and %USERDN% to be replaced with their username and full userDN as needed. 
    
    # param: str groupSearchType:  Controls the default group search filter used, can be one of the following:<br/> <b>NoGroups</b>: No group support.<br/> <b>ActiveDirectory</b>: (default) Nested membership of all of a user's AD groups.<br/> <b>MemberDN</b>: MemberDN style groups (single-level). 
    
    # param: str searchBindDN:  REQUIRED for SearchAndBind<br/> A fully qualified DN to log in with to perform an LDAP search for the user (needs read access to the LDAP directory). 
    
    # param: str searchBindPassword:  REQUIRED for SearchAndBind<br/> The password for the searchBindDN account used for searching. 
    
    # param: str serverURIs: [required] A list of LDAP server URIs (examples: "ldap://1.2.3.4" and ldaps://1.2.3.4:123") 
    
    # param: str userDNTemplate:  REQUIRED for DirectBind<br/> A string that is used to form a fully qualified user DN.<br/> The string should have the placeholder text "%USERNAME%" which will be replaced with the username of the authenticating user. 
    
    # param: str userSearchBaseDN:  REQUIRED for SearchAndBind The base DN of the tree used to start the search (will do a subtree search from here). 
    
    # param: str userSearchFilter:  REQUIRED for SearchAndBind.<br/> The LDAP filter to use.<br/> The string should have the placeholder text "%USERNAME%" which will be replaced with the username of the authenticating user.<br/> Example: (&(objectClass=person) (sAMAccountName=%USERNAME%)) will use the sAMAccountName field in Active Directory to match the nusername entered at cluster login. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "serverURIs" => server_uris,
      "method" => "EnableLdapAuthentication"
    }
    
    if auth_type != nil
      payload["authType"] = auth_type
    end
    if group_search_base_dn != nil
      payload["groupSearchBaseDN"] = group_search_base_dn
    end
    if group_search_custom_filter != nil
      payload["groupSearchCustomFilter"] = group_search_custom_filter
    end
    if group_search_type != nil
      payload["groupSearchType"] = group_search_type
    end
    if search_bind_dn != nil
      payload["searchBindDN"] = search_bind_dn
    end
    if search_bind_password != nil
      payload["searchBindPassword"] = search_bind_password
    end
    if user_dntemplate != nil
      payload["userDNTemplate"] = user_dntemplate
    end
    if user_search_base_dn != nil
      payload["userSearchBaseDN"] = user_search_base_dn
    end
    if user_search_filter != nil
      payload["userSearchFilter"] = user_search_filter
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableLdapAuthenticationResult.new(raw_response) : nil
  end

  def disable_ldap_authentication()
    ######
    # The DisableLdapAuthentication method is used disable LDAP authentication and remove all LDAP configuration settings. This call will not remove any configured cluster admin accounts (user or group). However, those cluster admin accounts will no longer be able to log in.######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "DisableLdapAuthentication"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableLdapAuthenticationResult.new(raw_response) : nil
  end

  def list_active_nodes()
    ######
    # ListActiveNodes returns the list of currently active nodes that are in the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListActiveNodes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActiveNodesResult.new(raw_response) : nil
  end

  def list_all_nodes()
    ######
    # ListAllNodes enables you to retrieve a list of active and pending nodes in the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListAllNodes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAllNodesResult.new(raw_response) : nil
  end

  def list_pending_nodes()
    ######
    # Gets the list of pending nodes.
    # Pending nodes are running and configured to join the cluster, but have not been added via the AddNodes method.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListPendingNodes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListPendingNodesResult.new(raw_response) : nil
  end

  def add_nodes(pending_nodes)
    ######
    # AddNodes is used to add one or more new nodes to the cluster. When a node is not configured and starts up for the first time you are prompted to configure the node. Once a node is configured it is registered as a "pending node" with the cluster.
    # <br/><br/>
    # Adding a node to a cluster that has been set up for virtual networking will require a sufficient number of virtual storage IP addresses to allocate a virtual IP to the new node. If there are no virtual IP addresses available for the new node, the AddNode operation will not complete successfully. Use the "ModifyVirtualNetwork" method to add more storage IP addresses to your virtual network.
    # <br/><br/>
    # The software version on each node in a cluster must be compatible. Run the "ListAllNodes" API to see what versions of software are currently running on the cluster nodes. For an explanation of software version compatibility, see "Node Versioning and Compatibility" in the Element API guide.
    # <br/><br/>
    # Once a node has been added, the drives on the node are made available and can then be added via the "AddDrives" method to increase the storage capacity of the cluster.
    # <br/><br/>
    # <b>Note</b>: It may take several seconds after adding a new Node for it to start up and register the drives as being available.
    # param: int pendingNodes: [required] List of PendingNodeIDs for the Nodes to be added. You can obtain the list of Pending Nodes via the ListPendingNodes method. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "pendingNodes" => pending_nodes,
      "method" => "AddNodes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddNodesResult.new(raw_response) : nil
  end

  def remove_nodes(nodes)
    ######
    # RemoveNodes is used to remove one or more nodes that should no longer participate in the cluster. Before removing a node, all drives it contains must first be removed with "RemoveDrives" method. A node cannot be removed until the RemoveDrives process has completed and all data has been migrated away from the node.
    # <br/><br/>
    # Once removed, a node registers itself as a pending node and can be added again, or shut down which removes it from the "Pending Node" list.
    # param: int nodes: [required] List of NodeIDs for the nodes to be removed. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "nodes" => nodes,
      "method" => "RemoveNodes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveNodesResult.new(raw_response) : nil
  end

  def get_network_config()
    ######
    # The GetNetworkConfig API method is used to display the network configuration information for a node.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "GetNetworkConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNetworkConfigResult.new(raw_response) : nil
  end

  def set_config(config)
    ######
    # The SetConfig API method is used to set all the configuration information for the node. This includes the same information available via calls to SetClusterConfig and SetNetworkConfig in one API method.
    # <br/><br/>
    # <b>Warning!</b> Changing the 'bond-mode' on a node can cause a temporary loss of network connectivity. Caution should be taken when using this method.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: Config config: [required] Objects that you want changed for the cluster interface settings. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "config" => config,
      "method" => "SetConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetConfigResult.new(raw_response) : nil
  end

  def set_network_config(network)
    ######
    # The "SetNetworkConfig" method is used to set the network configuration for a node. To see the states in which these objects can be modified, see "Network Object for 1G and 10G Interfaces" on page 109 of the Element API. To display the current network settings for a node, run the "GetNetworkConfig" method.
    # <br/><br/>
    # <b>WARNING!</b> Changing the "bond-mode" on a node can cause a temporary loss of network connectivity. Caution should be taken when using this method.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: Network network: [required] Objects that will be changed for the node network settings. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "network" => network,
      "method" => "SetNetworkConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetNetworkConfigResult.new(raw_response) : nil
  end

  def get_config()
    ######
    # The GetConfig API method is used to retrieve all the configuration information for the node. This one API method includes the same information available in both "GetClusterConfig" and "GetNetworkConfig" methods.
    # <br/><br/>
    # <b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Both")

    payload ={ 
      "method" => "GetConfig"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetConfigResult.new(raw_response) : nil
  end

  def get_node_stats(node_id)
    ######
    # GetNodeStats is used to return the high-level activity measurements for a single node.
    # param: int nodeID: [required] Specifies the node for which statistics are gathered. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "nodeID" => node_id,
      "method" => "GetNodeStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNodeStatsResult.new(raw_response) : nil
  end

  def list_node_stats()
    ######
    # ListNodeStats is used to return the high-level activity measurements for all nodes in a cluster.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListNodeStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListNodeStatsResult.new(raw_response) : nil
  end

  def list_cluster_pairs()
    ######
    # ListClusterPairs is used to list all of the clusters a cluster is paired with.
    # This method returns information about active and pending cluster pairings, such as statistics about the current pairing as well as the connectivity and latency (in milliseconds) of the cluster pairing.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListClusterPairs"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterPairsResult.new(raw_response) : nil
  end

  def list_active_paired_volumes()
    ######
    # ListActivePairedVolumes is used to list all of the active volumes paired with a volume.
    # Volumes listed in the return for this method include volumes with active and pending pairings.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListActivePairedVolumes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActivePairedVolumesResult.new(raw_response) : nil
  end

  def start_cluster_pairing()
    ######
    # StartClusterPairing is used to create an encoded key from a cluster that is used to pair with another cluster.
    # The key created from this API method is used in the "CompleteClusterPairing" API method to establish a cluster pairing.
    # You can pair a cluster with a maximum of four other SolidFire clusters.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "StartClusterPairing"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartClusterPairingResult.new(raw_response) : nil
  end

  def start_volume_pairing(volume_id,mode = nil)
    ######
    # StartVolumePairing is used to create an encoded key from a volume that is used to pair with another volume.
    # The key that this method creates is used in the "CompleteVolumePairing" API method to establish a volume pairing.
    # param: int volumeID: [required] The ID of the volume on which to start the pairing process. 
    
    # param: str mode:  The mode of the volume on which to start the pairing process. The mode can only be set if the volume is the source volume.<br/> Possible values:<br/> <b>Async</b>: (default if no mode parameter specified) Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster.<br/> <b>Sync</b>: Source acknowledges write when the data is stored locally and on the remote cluster.<br/> <b>SnapshotsOnly</b>: Only snapshots created on the source cluster will be replicated. Active writes from the source volume will not be replicated.<br/> 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "StartVolumePairing"
    }
    
    if mode != nil
      payload["mode"] = mode
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartVolumePairingResult.new(raw_response) : nil
  end

  def complete_cluster_pairing(cluster_pairing_key)
    ######
    # The CompleteClusterPairing method is the second step in the cluster pairing process.
    # Use this method with the encoded key received from the "StartClusterPairing" API method to complete the cluster pairing process.
    # param: str clusterPairingKey: [required] A string of characters that is returned from the "StartClusterPairing" API method. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "clusterPairingKey" => cluster_pairing_key,
      "method" => "CompleteClusterPairing"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CompleteClusterPairingResult.new(raw_response) : nil
  end

  def complete_volume_pairing(volume_pairing_key,volume_id)
    ######
    # CompleteVolumePairing is used to complete the pairing of two volumes.
    # param: str volumePairingKey: [required] The key returned from the "StartVolumePairing" API method. 
    
    # param: int volumeID: [required] The ID of volume on which to complete the pairing process. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumePairingKey" => volume_pairing_key,
      "volumeID" => volume_id,
      "method" => "CompleteVolumePairing"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CompleteVolumePairingResult.new(raw_response) : nil
  end

  def remove_cluster_pair(cluster_pair_id)
    ######
    # You can use the RemoveClusterPair method to close the open connections between two paired clusters.<br/>
    # <b>Note</b>: Before you remove a cluster pair, you must first remove all volume pairing to the clusters with the "RemoveVolumePair" API method.
    # param: int clusterPairID: [required] Unique identifier used to pair two clusters. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "clusterPairID" => cluster_pair_id,
      "method" => "RemoveClusterPair"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveClusterPairResult.new(raw_response) : nil
  end

  def remove_volume_pair(volume_id)
    ######
    # RemoveVolumePair is used to remove the remote pairing between two volumes.
    # When the volume pairing information is removed, data is no longer replicated to or from the volume.
    # This method should be run on both the source and target volumes that are paired together.
    # param: int volumeID: [required] ID of the volume on which to stop the replication process. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "RemoveVolumePair"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveVolumePairResult.new(raw_response) : nil
  end

  def modify_volume_pair(volume_id,paused_manual = nil,mode = nil)
    ######
    # ModifyVolumePair is used to pause or restart replication between a pair of volumes.
    # param: int volumeID: [required] Identification number of the volume to be modified. 
    
    # param: bool pausedManual:  Valid values that can be entered:<br/> <b>true</b>: to pause volume replication.<br/> <b>false</b>: to restart volume replication.<br/> If no value is specified, no change in replication is performed. 
    
    # param: str mode:  Volume replication mode.<br/> Possible values:<br/> <b>Async</b>: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster.<br/> <b>Sync</b>: The source acknowledges the write when the data is stored locally and on the remote cluster.<br/> <b>SnapshotsOnly</b>: Only snapshots created on the source cluster will be replicated. Active writes from the source volume are not replicated.<br/> 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "ModifyVolumePair"
    }
    
    if paused_manual != nil
      payload["pausedManual"] = paused_manual
    end
    if mode != nil
      payload["mode"] = mode
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumePairResult.new(raw_response) : nil
  end

  def list_protocol_endpoints(protocol_endpoint_ids = nil)
    ######
    # Gets protocol endpoints in the system
    # If protocolEndpointIDs isn't specified all protocol endpoints
    # are returned. Else the supplied protocolEndpointIDs are.
    # param: UUID protocolEndpointIDs:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListProtocolEndpoints"
    }
    
    if protocol_endpoint_ids != nil
      payload["protocolEndpointIDs"] = protocol_endpoint_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListProtocolEndpointsResult.new(raw_response) : nil
  end

  def create_snapshot(volume_id,snapshot_id = nil,name = nil,enable_remote_replication = nil,retention = nil,attributes = nil)
    ######
    # CreateSnapshot is used to create a point-in-time copy of a volume.
    # A snapshot can be created from any volume or from an existing snapshot.
    # <br/><br/>
    # <b>Note</b>: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3.
    # Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: int volumeID: [required] ID of the volume image from which to copy. 
    
    # param: int snapshotID:  Unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume. If a SnapshotID is not provided, a snapshot is created from the volume's active branch. 
    
    # param: str name:  A name for the snapshot. If no name is provided, the date and time the snapshot was taken is used. 
    
    # param: bool enableRemoteReplication:  Identifies if snapshot is enabled for remote replication. 
    
    # param: str retention:  The amount of time the snapshot will be retained. Enter in HH:mm:ss 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "CreateSnapshot"
    }
    
    if snapshot_id != nil
      payload["snapshotID"] = snapshot_id
    end
    if name != nil
      payload["name"] = name
    end
    if enable_remote_replication != nil
      payload["enableRemoteReplication"] = enable_remote_replication
    end
    if retention != nil
      payload["retention"] = retention
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateSnapshotResult.new(raw_response) : nil
  end

  def delete_snapshot(snapshot_id)
    ######
    # DeleteSnapshot is used to delete a snapshot.
    # A snapshot that is currently the "active" snapshot cannot be deleted.
    # You must rollback and make another snapshot "active" before the current snapshot can be deleted.
    # To rollback a snapshot, use RollbackToSnapshot.
    # param: int snapshotID: [required] The ID of the snapshot to delete. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "snapshotID" => snapshot_id,
      "method" => "DeleteSnapshot"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteSnapshotResult.new(raw_response) : nil
  end

  def list_snapshots(volume_id = nil)
    ######
    # ListSnapshots is used to return the attributes of each snapshot taken on the volume.
    # param: int volumeID:  The volume to list snapshots for. If not provided, all snapshots for all volumes are returned. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListSnapshots"
    }
    
    if volume_id != nil
      payload["volumeID"] = volume_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListSnapshotsResult.new(raw_response) : nil
  end

  def modify_snapshot(snapshot_id,expiration_time = nil,enable_remote_replication = nil)
    ######
    # ModifySnapshot is used to change the attributes currently assigned to a snapshot.
    # Use this API method to enable the snapshots created on the Read/Write (source) volume to be remotely replicated to a target SolidFire storage system.
    # param: int snapshotID: [required] ID of the snapshot. 
    
    # param: str expirationTime:  Use to set the time when the snapshot should be removed. 
    
    # param: bool enableRemoteReplication:  Use to enable the snapshot created to be replicated to a remote SolidFire cluster. Possible values: <br/><b>true</b>: the snapshot will be replicated to remote storage. <br/><b>false</b>: Default. No replication. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "snapshotID" => snapshot_id,
      "method" => "ModifySnapshot"
    }
    
    if expiration_time != nil
      payload["expirationTime"] = expiration_time
    end
    if enable_remote_replication != nil
      payload["enableRemoteReplication"] = enable_remote_replication
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifySnapshotResult.new(raw_response) : nil
  end

  def rollback_to_snapshot(volume_id,snapshot_id,save_current_state,name = nil,attributes = nil)
    ######
    # RollbackToSnapshot is used to make an existing snapshot the "active" volume image. This method creates a new 
    # snapshot from an existing snapshot. The new snapshot becomes "active" and the existing snapshot is preserved until 
    # it is manually deleted. The previously "active" snapshot is deleted unless the parameter saveCurrentState is set with 
    # a value of "true."
    # <b>Note</b>: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3.
    # Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: int volumeID: [required] VolumeID for the volume. 
    
    # param: int snapshotID: [required] ID of a previously created snapshot on the given volume. 
    
    # param: bool saveCurrentState: [required] <br/><b>true</b>: The previous active volume image is kept. <br/><b>false</b>: (default) The previous active volume image is deleted. 
    
    # param: str name:  Name for the snapshot. If no name is given, then the name of the snapshot being rolled back to is used with  "-copy" appended to the end of the name. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "snapshotID" => snapshot_id,
      "saveCurrentState" => save_current_state,
      "method" => "RollbackToSnapshot"
    }
    
    if name != nil
      payload["name"] = name
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateSnapshotResult.new(raw_response) : nil
  end

  def create_group_snapshot(volumes,name = nil,enable_remote_replication = nil,retention = nil,attributes = nil)
    ######
    # CreateGroupSnapshot is used to create a point-in-time copy of a group of volumes.
    # The snapshot created can then be used later as a backup or rollback to ensure the data on the group of volumes is consistent for the point in time in which the snapshot was created.
    # <br/><br/>
    # <b>Note</b>: Creating a group snapshot is allowed if cluster fullness is at stage 2 or 3.
    # Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: int volumes: [required] Unique ID of the volume image from which to copy. 
    
    # param: str name:  A name for the snapshot. If no name is provided, the date and time the snapshot was taken is used. 
    
    # param: bool enableRemoteReplication:  Identifies if snapshot is enabled for remote replication. 
    
    # param: str retention:  The amount of time the snapshot will be retained. Enter in HH:mm:ss 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "volumes" => volumes,
      "method" => "CreateGroupSnapshot"
    }
    
    if name != nil
      payload["name"] = name
    end
    if enable_remote_replication != nil
      payload["enableRemoteReplication"] = enable_remote_replication
    end
    if retention != nil
      payload["retention"] = retention
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateGroupSnapshotResult.new(raw_response) : nil
  end

  def delete_group_snapshot(group_snapshot_id,save_members)
    ######
    # DeleteGroupSnapshot is used to delete a group snapshot.
    # The saveMembers parameter can be used to preserve all the snapshots that
    # were made for the volumes in the group but the group association will be removed.
    # param: int groupSnapshotID: [required] Unique ID of the group snapshot. 
    
    # param: bool saveMembers: [required] <br/><b>true</b>: Snapshots are kept, but group association is removed. <br/><b>false</b>: The group and snapshots are deleted. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "groupSnapshotID" => group_snapshot_id,
      "saveMembers" => save_members,
      "method" => "DeleteGroupSnapshot"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteGroupSnapshotResult.new(raw_response) : nil
  end

  def list_group_snapshots(volume_id = nil)
    ######
    # ListGroupSnapshots is used to return information about all group snapshots that have been created.
    # param: int volumeID:  An array of unique volume IDs to query. If this parameter is not specified, all group snapshots on the cluster will be included. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "ListGroupSnapshots"
    }
    
    if volume_id != nil
      payload["volumeID"] = volume_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListGroupSnapshotsResult.new(raw_response) : nil
  end

  def modify_group_snapshot(group_snapshot_id,expiration_time = nil,enable_remote_replication = nil)
    ######
    # ModifyGroupSnapshot is used to change the attributes currently assigned to a group snapshot.
    # param: int groupSnapshotID: [required] ID of the snapshot. 
    
    # param: str expirationTime:  Use to set the time when the snapshot should be removed. 
    
    # param: bool enableRemoteReplication:  Use to enable the snapshot created to be replicated to a remote SolidFire cluster. Possible values: <br/><b>true</b>: the snapshot will be replicated to remote storage. <br/><b>false</b>: Default. No replication. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "groupSnapshotID" => group_snapshot_id,
      "method" => "ModifyGroupSnapshot"
    }
    
    if expiration_time != nil
      payload["expirationTime"] = expiration_time
    end
    if enable_remote_replication != nil
      payload["enableRemoteReplication"] = enable_remote_replication
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyGroupSnapshotResult.new(raw_response) : nil
  end

  def rollback_to_group_snapshot(group_snapshot_id,save_current_state,name = nil,attributes = nil)
    ######
    # RollbackToGroupSnapshot is used to roll back each individual volume in a snapshot group to a copy of their individual snapshots.
    # <br/><br/>
    # <b>Note</b>: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3.
    # Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: int groupSnapshotID: [required] Unique ID of the group snapshot. 
    
    # param: bool saveCurrentState: [required] <br/><b>true</b>: The previous active volume image is kept. <br/><b>false</b>: (default) The previous active volume image is deleted. 
    
    # param: str name:  Name for the snapshot. If no name is given, then the name of the snapshot being rolled back to is used with  "-copy" appended to the end of the name. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "groupSnapshotID" => group_snapshot_id,
      "saveCurrentState" => save_current_state,
      "method" => "RollbackToGroupSnapshot"
    }
    
    if name != nil
      payload["name"] = name
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateGroupSnapshotResult.new(raw_response) : nil
  end

  def get_schedule(schedule_id)
    ######
    # GetSchedule is used to return information about a scheduled snapshot that has been created. You can see information about a specified schedule if there are many snapshot schedules in the system. You can include more than one schedule with this method by specifying additional scheduleIDs to the parameter.
    # param: int scheduleID: [required] Unique ID of the schedule or multiple schedules to display 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "scheduleID" => schedule_id,
      "method" => "GetSchedule"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetScheduleResult.new(raw_response) : nil
  end

  def list_schedules()
    ######
    # ListSchedule is used to return information about all scheduled snapshots that have been created.######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "ListSchedules"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListSchedulesResult.new(raw_response) : nil
  end

  def create_schedule(schedule)
    ######
    # CreateSchedule is used to create a schedule that will autonomously make a snapshot of a volume at a defined interval.<br/>
    # <br/>
    # The snapshot created can be used later as a backup or rollback to ensure the data on a volume or group of volumes is consistent for the point in time in which the snapshot was created. <br/>
    # <br/>
    # <b>Note</b>: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: Schedule schedule: [required] The "Schedule" object will be used to create a new schedule.<br/> Do not set ScheduleID property, it will be ignored.<br/> Frequency property must be of type that inherits from Frequency. Valid types are:<br/> DaysOfMonthFrequency<br/> DaysOrWeekFrequency<br/> TimeIntervalFrequency 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "schedule" => schedule,
      "method" => "CreateSchedule"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateScheduleResult.new(raw_response) : nil
  end

  def modify_schedule(schedule)
    ######
    # ModifySchedule is used to change the intervals at which a scheduled snapshot occurs. This allows for adjustment to the snapshot frequency and retention.<br/>
    # param: Schedule schedule: [required] The "Schedule" object will be used to modify an existing schedule.<br/> The ScheduleID property is required.<br/> Frequency property must be of type that inherits from Frequency. Valid types are:<br/> DaysOfMonthFrequency<br/> DaysOrWeekFrequency<br/> TimeIntervalFrequency 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "schedule" => schedule,
      "method" => "ModifySchedule"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyScheduleResult.new(raw_response) : nil
  end

  def list_volume_stats_by_virtual_volume(virtual_volume_ids = nil)
    ######
    # ListVolumeStatsByVirtualVolume enables you to list statistics for volumes, sorted by virtual volumes.
    # param: UUID virtualVolumeIDs:  A list of virtual volume  IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeStatsByVirtualVolume"
    }
    
    if virtual_volume_ids != nil
      payload["virtualVolumeIDs"] = virtual_volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVirtualVolumeResult.new(raw_response) : nil
  end

  def get_raw_stats()
    ######
    # The GetRawStats call is used by SolidFire engineering to troubleshoot new features. The data returned from GetRawStats is not documented, it changes frequently, and is not guaranteed to be accurate. It is not recommended to ever use GetRawStats for collecting performance data or any other management integration with a SolidFire cluster.
    # The data returned from GetRawStats changes frequently, and is not guaranteed to accurately show performance from the system. It is not recommended to ever use GetRawStats for collecting performance data or any other management integration with a SolidFire cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetRawStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? str.new(raw_response) : nil
  end

  def get_hardware_info()
    ######
    # GetHardwareInfo allows you to return hardware information and status for a single node. This generally includes manufacturers, vendors, versions, drives, and other associated hardware identification information.######

    check_connection(9.0, "Node")

    payload ={ 
      "method" => "GetHardwareInfo"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetHardwareInfoResult.new(raw_response) : nil
  end

  def get_complete_stats()
    ######
    # The GetCompleteStats API method is used by SolidFire engineering to troubleshoot new features. The data returned from GetCompleteStats is not documented, changes frequently, and is not guaranteed to be accurate. It is not recommended to ever use GetCompleteStats for collecting performance data or any other management integration with a SolidFire cluster.
    # The data returned from GetCompleteStats changes frequently, and is not guaranteed to accurately show performance from the system. It is not recommended to ever use GetCompleteStats for collecting performance data or any other management integration with a SolidFire cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "GetCompleteStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? str.new(raw_response) : nil
  end

  def list_drive_stats(drives = nil)
    ######
    # ListDriveStats enables you to retrieve  high-level activity measurements for multiple drives in the cluster. By default, this method returns statistics for all drives in the cluster, and these measurements are cumulative from the addition of the drive to the cluster. Some values this method returns are specific to block drives, and some are specific to metadata drives. For more information on what data each drive type returns, see the response examples for the GetDriveStats method.
    # param: int drives:  Optional list of DriveIDs for which to return drive statistics. If you omit this parameter, measurements for all drives are returned. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListDriveStats"
    }
    
    if drives != nil
      payload["drives"] = drives
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDriveStatsResult.new(raw_response) : nil
  end

  def list_volume_stats(volume_ids = nil)
    ######
    # param: int volumeIDs:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeStats"
    }
    
    if volume_ids != nil
      payload["volumeIDs"] = volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsResult.new(raw_response) : nil
  end

  def create_storage_container(name,initiator_secret = nil,target_secret = nil)
    ######
    # Creates a new VVols storage container.
    # param: str name: [required] Name of the storage container. 
    
    # param: str initiatorSecret:  The secret for CHAP authentication for the initiator 
    
    # param: str targetSecret:  The secret for CHAP authentication for the target 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "name" => name,
      "method" => "CreateStorageContainer"
    }
    
    if initiator_secret != nil
      payload["initiatorSecret"] = initiator_secret
    end
    if target_secret != nil
      payload["targetSecret"] = target_secret
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateStorageContainerResult.new(raw_response) : nil
  end

  def delete_storage_containers(storage_container_ids)
    ######
    # Deletes a storage container from the system.
    # param: UUID storageContainerIDs: [required] list of storageContainerID of the storage container to delete. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "storageContainerIDs" => storage_container_ids,
      "method" => "DeleteStorageContainers"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteStorageContainerResult.new(raw_response) : nil
  end

  def modify_storage_container(storage_container_id,initiator_secret = nil,target_secret = nil)
    ######
    # Modifies an existing storage container.
    # param: UUID storageContainerID: [required] 
    
    # param: str initiatorSecret:  
    
    # param: str targetSecret:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "storageContainerID" => storage_container_id,
      "method" => "ModifyStorageContainer"
    }
    
    if initiator_secret != nil
      payload["initiatorSecret"] = initiator_secret
    end
    if target_secret != nil
      payload["targetSecret"] = target_secret
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyStorageContainerResult.new(raw_response) : nil
  end

  def list_storage_containers(storage_container_ids = nil)
    ######
    # Gets information for all storage containers currently in the system.
    # param: UUID storageContainerIDs:  List of storage containers to get 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListStorageContainers"
    }
    
    if storage_container_ids != nil
      payload["storageContainerIDs"] = storage_container_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListStorageContainersResult.new(raw_response) : nil
  end

  def get_storage_container_efficiency(storage_container_id)
    ######
    # GetStorageContainerEfficiency enables you to retrieve efficiency information about a virtual volume storage container.
    # param: UUID storageContainerID: [required] The ID of the storage container for which to retrieve efficiency information. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "storageContainerID" => storage_container_id,
      "method" => "GetStorageContainerEfficiency"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetStorageContainerEfficiencyResult.new(raw_response) : nil
  end

  def list_tests()
    ######
    # The ListTests API method is used to return the tests that are available to run on a node.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "ListTests"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListTestsResult.new(raw_response) : nil
  end

  def list_utilities()
    ######
    # The ListUtilities API method is used to return the tests that are available to run on a node.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "ListUtilities"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListUtilitiesResult.new(raw_response) : nil
  end

  def test_connect_ensemble(ensemble = nil)
    ######
    # The TestConnectEnsemble API method is used to verify connectivity with a sepcified database ensemble. By default it uses the ensemble for the cluster the node is associated with. Alternatively you can provide a different ensemble to test connectivity with.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str ensemble:  A comma-separated list of ensemble node CIPs for connectivity testing 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "TestConnectEnsemble"
    }
    
    if ensemble != nil
      payload["ensemble"] = ensemble
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectEnsembleResult.new(raw_response) : nil
  end

  def test_connect_mvip(mvip = nil)
    ######
    # The TestConnectMvip API method is used to test the management connection to the cluster. The test pings the MVIP and executes a simple API method to verify connectivity.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str mvip:  Optionally, use to test the management connection of a different MVIP. This is not needed to test the connection to the target cluster. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "TestConnectMvip"
    }
    
    if mvip != nil
      payload["mvip"] = mvip
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectMvipResult.new(raw_response) : nil
  end

  def test_connect_svip(svip = nil)
    ######
    # The TestConnectSvip API method is used to test the storage connection to the cluster. The test pings the SVIP using ICMP packets and when successful connects as an iSCSI initiator.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str svip:  Optionally, use to test the storage connection of a different SVIP. This is not needed to test the connection to the target cluster. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "TestConnectSvip"
    }
    
    if svip != nil
      payload["svip"] = svip
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectSvipResult.new(raw_response) : nil
  end

  def test_ping(attempts = nil,hosts = nil,total_timeout_sec = nil,packet_size = nil,ping_timeout_msec = nil)
    ######
    # The TestPing API method is used to validate the connection to all nodes in the cluster on both 1G and 10G interfaces using ICMP packets. The test uses the appropriate MTU sizes for each packet based on the MTU settings in the network configuration.
    # <br/><b>Note</b>: This method is available only through the per-node API endpoint 5.0 or later.
    # param: int attempts:  Specifies the number of times the system should repeat the test ping. Default is 5. 
    
    # param: str hosts:  Specify address or hostnames of devices to ping. 
    
    # param: int totalTimeoutSec:  Specifies the length of time the ping should wait for a system response before issuing the next ping attempt or ending the process. 
    
    # param: int packetSize:  Specify the number of bytes to send in the ICMP packet sent to each IP. Number be less than the maximum MTU specified in the network configuration. 
    
    # param: int pingTimeoutMsec:  Specify the number of milliseconds to wait for each individual ping response. Default is 500ms. 
    ######

    check_connection(5.0, "Node")

    payload ={ 
      "method" => "TestPing"
    }
    
    if attempts != nil
      payload["attempts"] = attempts
    end
    if hosts != nil
      payload["hosts"] = hosts
    end
    if total_timeout_sec != nil
      payload["totalTimeoutSec"] = total_timeout_sec
    end
    if packet_size != nil
      payload["packetSize"] = packet_size
    end
    if ping_timeout_msec != nil
      payload["pingTimeoutMsec"] = ping_timeout_msec
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestPingResult.new(raw_response) : nil
  end

  def list_virtual_networks(virtual_network_id = nil,virtual_network_tag = nil,virtual_network_ids = nil,virtual_network_tags = nil)
    ######
    # ListVirtualNetworks is used to get a list of all the configured virtual networks for the cluster. This method can be used to verify the virtual network settings in the cluster.
    # 
    # This method does not require any parameters to be passed. But, one or more VirtualNetworkIDs or VirtualNetworkTags can be passed in order to filter the results.
    # param: int virtualNetworkID:  Network ID to filter the list for a single virtual network 
    
    # param: int virtualNetworkTag:  Network Tag to filter the list for a single virtual network 
    
    # param: int virtualNetworkIDs:  NetworkIDs to include in the list. 
    
    # param: int virtualNetworkTags:  Network Tags to include in the list. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "ListVirtualNetworks"
    }
    
    if virtual_network_id != nil
      payload["virtualNetworkID"] = virtual_network_id
    end
    if virtual_network_tag != nil
      payload["virtualNetworkTag"] = virtual_network_tag
    end
    if virtual_network_ids != nil
      payload["virtualNetworkIDs"] = virtual_network_ids
    end
    if virtual_network_tags != nil
      payload["virtualNetworkTags"] = virtual_network_tags
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualNetworksResult.new(raw_response) : nil
  end

  def add_virtual_network(virtual_network_tag,name,address_blocks,netmask,svip,gateway = nil,namespace = nil,attributes = nil)
    ######
    # AddVirtualNetwork is used to add a new virtual network to a cluster configuration. When a virtual network is added, an interface for each node is created and each will require a virtual network IP address. The number of IP addresses specified as a parameter for this API method must be equal to or greater than the number of nodes in the cluster. Virtual network addresses are bulk provisioned by SolidFire and assigned to individual nodes automatically. Virtual network addresses do not need to be assigned to nodes manually.
    # <br/><br/>
    # <b>Note:</b> The AddVirtualNetwork method is used only to create a new virtual network. If you want to make changes to a virtual network, please use the ModifyVirtualNetwork method.
    # param: int virtualNetworkTag: [required] A unique virtual network (VLAN) tag. Supported values are 1 to 4095 (the number zero (0) is not supported). 
    
    # param: str name: [required] User defined name for the new virtual network. 
    
    # param: AddressBlock addressBlocks: [required] Unique Range of IP addresses to include in the virtual network. Attributes for this parameter are: <br/><b>start:</b> start of the IP address range. (String) <br/><b>size:</b> numbre of IP addresses to include in the block. (Integer) 
    
    # param: str netmask: [required] Unique netmask for the virtual network being created. 
    
    # param: str svip: [required] Unique storage IP address for the virtual network being created. 
    
    # param: str gateway:   
    
    # param: bool namespace:   
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "virtualNetworkTag" => virtual_network_tag,
      "name" => name,
      "addressBlocks" => address_blocks,
      "netmask" => netmask,
      "svip" => svip,
      "method" => "AddVirtualNetwork"
    }
    
    if gateway != nil
      payload["gateway"] = gateway
    end
    if namespace != nil
      payload["namespace"] = namespace
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddVirtualNetworkResult.new(raw_response) : nil
  end

  def modify_virtual_network(virtual_network_id = nil,virtual_network_tag = nil,name = nil,address_blocks = nil,netmask = nil,svip = nil,gateway = nil,namespace = nil,attributes = nil)
    ######
    # ModifyVirtualNetwork is used to change various attributes of a VirtualNetwork object. This method can be used to add or remove address blocks, change the netmask IP, or modify the name or description of the virtual network.
    # <br/><br/>
    # <b>Note:</b> This method requires either the VirtualNetworkID or the VirtualNetworkTag as a parameter, but not both.
    # param: int virtualNetworkID:  Unique identifier of the virtual network to modify. This is the virtual network ID assigned by the SolidFire cluster. 
    
    # param: int virtualNetworkTag:  Network Tag that identifies the virtual network to modify. 
    
    # param: str name:  New name for the virtual network. 
    
    # param: AddressBlock addressBlocks:  New addressBlock to set for this Virtual Network object. This may contain new address blocks to add to the existing object or it may omit unused address blocks that need to be removed. Alternatively, existing address blocks may be extended or reduced in size. The size of the starting addressBlocks for a Virtual Network object can only be increased, and can never be decreased. Attributes for this parameter are: <br/><b>start:</b> start of the IP address range. (String) <br/><b>size:</b> numbre of IP addresses to include in the block. (Integer) 
    
    # param: str netmask:  New netmask for this virtual network. 
    
    # param: str svip:  The storage virtual IP address for this virtual network. The svip for Virtual Network cannot be changed. A new Virtual Network must be created in order to use a different svip address. 
    
    # param: str gateway:   
    
    # param: bool namespace:   
    
    # param: dict attributes:  A new list of Name/Value pairs in JSON object format. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "ModifyVirtualNetwork"
    }
    
    if virtual_network_id != nil
      payload["virtualNetworkID"] = virtual_network_id
    end
    if virtual_network_tag != nil
      payload["virtualNetworkTag"] = virtual_network_tag
    end
    if name != nil
      payload["name"] = name
    end
    if address_blocks != nil
      payload["addressBlocks"] = address_blocks
    end
    if netmask != nil
      payload["netmask"] = netmask
    end
    if svip != nil
      payload["svip"] = svip
    end
    if gateway != nil
      payload["gateway"] = gateway
    end
    if namespace != nil
      payload["namespace"] = namespace
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddVirtualNetworkResult.new(raw_response) : nil
  end

  def remove_virtual_network(virtual_network_id = nil,virtual_network_tag = nil)
    ######
    # RemoveVirtualNetwork is used to remove a previously added virtual network.
    # <br/><br/>
    # <b>Note:</b> This method requires either the VirtualNetworkID of the VirtualNetworkTag as a parameter, but not both.
    # param: int virtualNetworkID:  Network ID that identifies the virtual network to remove. 
    
    # param: int virtualNetworkTag:  Network Tag that identifies the virtual network to remove. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "method" => "RemoveVirtualNetwork"
    }
    
    if virtual_network_id != nil
      payload["virtualNetworkID"] = virtual_network_id
    end
    if virtual_network_tag != nil
      payload["virtualNetworkTag"] = virtual_network_tag
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveVirtualNetworkResult.new(raw_response) : nil
  end

  def list_virtual_volumes(details = nil,limit = nil,recursive = nil,start_virtual_volume_id = nil,virtual_volume_ids = nil)
    ######
    # ListVirtualVolumes enables you to list the virtual volumes currently in the system. You can use this method to list all virtual volumes, or only list a subset.
    # param: bool details:  Possible values:true: Include more details about each VVOL in the response.false: Include the standard level of detail about each VVOL in the response. 
    
    # param: int limit:  The maximum number of virtual volumes to list. 
    
    # param: bool recursive:  Possible values:true: Include information about the children of each VVOL in the response.false: Do not include information about the children of each VVOL in the response. 
    
    # param: UUID startVirtualVolumeID:  The ID of the virtual volume at which to begin the list. 
    
    # param: UUID virtualVolumeIDs:  A list of virtual volume  IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVirtualVolumes"
    }
    
    if details != nil
      payload["details"] = details
    end
    if limit != nil
      payload["limit"] = limit
    end
    if recursive != nil
      payload["recursive"] = recursive
    end
    if start_virtual_volume_id != nil
      payload["startVirtualVolumeID"] = start_virtual_volume_id
    end
    if virtual_volume_ids != nil
      payload["virtualVolumeIDs"] = virtual_volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumesResult.new(raw_response) : nil
  end

  def prepare_virtual_snapshot(virtual_volume_id,name = nil,writable_snapshot = nil,calling_virtual_volume_host_id = nil)
    ######
    # PrepareVirtualSnapshot is used to set up VMware Virtual Volume snapshot.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume to clone. 
    
    # param: str name:  The name for the newly-created volume. 
    
    # param: bool writableSnapshot:  Will the snapshot be writable? 
    
    # param: UUID callingVirtualVolumeHostID:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "virtualVolumeID" => virtual_volume_id,
      "method" => "PrepareVirtualSnapshot"
    }
    
    if name != nil
      payload["name"] = name
    end
    if writable_snapshot != nil
      payload["writableSnapshot"] = writable_snapshot
    end
    if calling_virtual_volume_host_id != nil
      payload["callingVirtualVolumeHostID"] = calling_virtual_volume_host_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PrepareVirtualSnapshotResult.new(raw_response) : nil
  end

  def get_virtual_volume_unshared_chunks(virtual_volume_id,base_virtual_volume_id,segment_start,segment_length,chunk_size,calling_virtual_volume_host_id = nil)
    ######
    # GetVirtualVolumeAllocatedBitmap scans a VVol segment and returns the number of 
    # chunks not shared between two volumes. This call will return results in less 
    # than 30 seconds. If the specified VVol and the base VVil are not related, an 
    # error is thrown. If the offset/length combination is invalid or out fo range 
    # an error is thrown.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume. 
    
    # param: UUID baseVirtualVolumeID: [required] The ID of the Virtual Volume to compare against. 
    
    # param: int segmentStart: [required] Start Byte offset. 
    
    # param: int segmentLength: [required] Length of the scan segment in bytes. 
    
    # param: int chunkSize: [required] Number of bytes represented by one bit in the bitmap. 
    
    # param: UUID callingVirtualVolumeHostID:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "virtualVolumeID" => virtual_volume_id,
      "baseVirtualVolumeID" => base_virtual_volume_id,
      "segmentStart" => segment_start,
      "segmentLength" => segment_length,
      "chunkSize" => chunk_size,
      "method" => "GetVirtualVolumeUnsharedChunks"
    }
    
    if calling_virtual_volume_host_id != nil
      payload["callingVirtualVolumeHostID"] = calling_virtual_volume_host_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeUnsharedChunkResult.new(raw_response) : nil
  end

  def create_virtual_volume_host(virtual_volume_host_id,cluster_id,initiator_names = nil,visible_protocol_endpoint_ids = nil,host_address = nil,calling_virtual_volume_host_id = nil)
    ######
    # CreateVirtualVolumeHost creates a new ESX host.
    # param: UUID virtualVolumeHostID: [required] The GUID of the ESX host. 
    
    # param: UUID clusterID: [required] The GUID of the ESX Cluster. 
    
    # param: str initiatorNames:  
    
    # param: UUID visibleProtocolEndpointIDs:  A list of PEs the host is aware of. 
    
    # param: str hostAddress:  IP or DNS name for the host. 
    
    # param: UUID callingVirtualVolumeHostID:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "virtualVolumeHostID" => virtual_volume_host_id,
      "clusterID" => cluster_id,
      "method" => "CreateVirtualVolumeHost"
    }
    
    if initiator_names != nil
      payload["initiatorNames"] = initiator_names
    end
    if visible_protocol_endpoint_ids != nil
      payload["visibleProtocolEndpointIDs"] = visible_protocol_endpoint_ids
    end
    if host_address != nil
      payload["hostAddress"] = host_address
    end
    if calling_virtual_volume_host_id != nil
      payload["callingVirtualVolumeHostID"] = calling_virtual_volume_host_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def list_virtual_volume_hosts(virtual_volume_host_ids = nil)
    ######
    # ListVirtualVolumeHosts returns a list of known ESX hosts.
    # param: UUID virtualVolumeHostIDs:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVirtualVolumeHosts"
    }
    
    if virtual_volume_host_ids != nil
      payload["virtualVolumeHostIDs"] = virtual_volume_host_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeHostsResult.new(raw_response) : nil
  end

  def get_virtual_volume_task_update(virtual_volume_task_id,calling_virtual_volume_host_id = nil)
    ######
    # GetVirtualVolumeTaskUpdate checks the status of a VVol Async Task.
    # param: UUID virtualVolumeTaskID: [required] The UUID of the VVol Task. 
    
    # param: UUID callingVirtualVolumeHostID:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "virtualVolumeTaskID" => virtual_volume_task_id,
      "method" => "GetVirtualVolumeTaskUpdate"
    }
    
    if calling_virtual_volume_host_id != nil
      payload["callingVirtualVolumeHostID"] = calling_virtual_volume_host_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeTaskResult.new(raw_response) : nil
  end

  def list_virtual_volume_tasks(virtual_volume_task_ids = nil)
    ######
    # ListVirtualVolumeTasks returns a list of VVol Async Tasks.
    # param: UUID virtualVolumeTaskIDs:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVirtualVolumeTasks"
    }
    
    if virtual_volume_task_ids != nil
      payload["virtualVolumeTaskIDs"] = virtual_volume_task_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeTasksResult.new(raw_response) : nil
  end

  def list_virtual_volume_bindings(virtual_volume_binding_ids = nil)
    ######
    # ListVirtualVolumeBindings returns a list of VVol bindings.
    # param: int virtualVolumeBindingIDs:  
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListVirtualVolumeBindings"
    }
    
    if virtual_volume_binding_ids != nil
      payload["virtualVolumeBindingIDs"] = virtual_volume_binding_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeBindingsResult.new(raw_response) : nil
  end

  def get_virtual_volume_count()
    ######
    # Enables retrieval of the number of virtual volumes currently in the system.######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "GetVirtualVolumeCount"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVirtualVolumeCountResult.new(raw_response) : nil
  end

  def clone_volume(volume_id,name,new_account_id = nil,new_size = nil,access = nil,snapshot_id = nil,attributes = nil)
    ######
    # CloneVolume is used to create a copy of the volume.
    # This method is asynchronous and may take a variable amount of time to complete.
    # The cloning process begins immediately when the CloneVolume request is made and is representative of the state of the volume when the API method is issued.
    # GetAsyncResults can be used to determine when the cloning process is complete and the new volume is available for connections.
    # ListSyncJobs can be used to see the progress of creating the clone.
    # <br/><br/>
    # <b>Note</b>: The initial attributes and quality of service settings for the volume are inherited from the volume being cloned.
    # If different settings are required, they can be changed via ModifyVolume.
    # <br/><br/>
    # <b>Note</b>: Cloned volumes do not inherit volume access group memberships from the source volume.
    # param: int volumeID: [required] The ID of the volume to clone. 
    
    # param: str name: [required] The name for the newly-created volume. 
    
    # param: int newAccountID:  AccountID for the owner of the new volume. If unspecified, the AccountID of the owner of the volume being cloned is used. 
    
    # param: int newSize:  New size of the volume, in bytes. May be greater or less than the size of the volume being cloned. If unspecified, the clone's volume size will be the same as the source volume. Size is rounded up to the nearest 1 MiB. 
    
    # param: str access:  Access settings for the new volume. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
    
    # param: int snapshotID:  ID of the snapshot to use as the source of the clone. If unspecified, the clone will be created with a snapshot of the active volume. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "name" => name,
      "method" => "CloneVolume"
    }
    
    if new_account_id != nil
      payload["newAccountID"] = new_account_id
    end
    if new_size != nil
      payload["newSize"] = new_size
    end
    if access != nil
      payload["access"] = access
    end
    if snapshot_id != nil
      payload["snapshotID"] = snapshot_id
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CloneVolumeResult.new(raw_response) : nil
  end

  def clone_multiple_volumes(volumes,access = nil,group_snapshot_id = nil,new_account_id = nil)
    ######
    # CloneMultipleVolumes is used to create a clone of a group of specified volumes. A consistent set of characteristics can be assigned to a group of multiple volume when they are cloned together.
    # If groupSnapshotID is going to be used to clone the volumes in a group snapshot, the group snapshot must be created first using the CreateGroupSnapshot API method or the SolidFire Element WebUI. Using groupSnapshotID is optional when cloning multiple volumes.
    # <br/><br/>
    # <b>Note</b>: Cloning multiple volumes is allowed if cluster fullness is at stage 2 or 3. Clones are not created when cluster fullness is at stage 4 or 5.
    # param: CloneMultipleVolumeParams volumes: [required] Array of Unique ID for each volume to include in the clone with optional parameters. If optional parameters are not specified, the values will be inherited from the source volumes. 
    
    # param: str access:  New default access method for the new volumes if not overridden by information passed in the volumes array. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
    
    # param: int groupSnapshotID:  ID of the group snapshot to use as a basis for the clone. 
    
    # param: int newAccountID:  New account ID for the volumes if not overridden by information passed in the volumes array. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "volumes" => volumes,
      "method" => "CloneMultipleVolumes"
    }
    
    if access != nil
      payload["access"] = access
    end
    if group_snapshot_id != nil
      payload["groupSnapshotID"] = group_snapshot_id
    end
    if new_account_id != nil
      payload["newAccountID"] = new_account_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CloneMultipleVolumesResult.new(raw_response) : nil
  end

  def copy_volume(volume_id,dst_volume_id,snapshot_id = nil)
    ######
    # Copies one volume to another.
    # param: int volumeID: [required] Source volume to copy. 
    
    # param: int dstVolumeID: [required] Destination volume for the copy. 
    
    # param: int snapshotID:  Snapshot ID of the source volume to create the copy from. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "dstVolumeID" => dst_volume_id,
      "method" => "CopyVolume"
    }
    
    if snapshot_id != nil
      payload["snapshotID"] = snapshot_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CopyVolumeResult.new(raw_response) : nil
  end

  def cancel_clone(clone_id)
    ######
    # Cancels a currently running clone operation. This method does not return anything.
    # param: int cloneID: [required] 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "cloneID" => clone_id,
      "method" => "CancelClone"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CancelCloneResult.new(raw_response) : nil
  end

  def cancel_group_clone(group_clone_id)
    ######
    # CancelGroupClone enables you to stop an ongoing CloneMultipleVolumes process for a group of clones. When you cancel a group clone operation, the system completes and removes the operation's associated asyncHandle. This method does not return anything.
    # param: int groupCloneID: [required] cloneID for the ongoing clone process. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "groupCloneID" => group_clone_id,
      "method" => "CancelGroupClone"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CancelGroupCloneResult.new(raw_response) : nil
  end

  def list_async_results(async_result_types = nil)
    ######
    # You can use ListAsyncResults to list the results of all currently running and completed asynchronous methods on the system. Querying asynchronous results with ListAsyncResults does not cause completed asyncHandles to expire; you can use GetAsyncResult to query any of the asyncHandles returned by ListAsyncResults.
    # param: str asyncResultTypes:  An optional list of types of results. You can use this list to restrict the results to only these types of operations. Possible values:BulkVolume: Copy operations between volumes, such as backups or restores.Clone: Volume cloning operations.DriveRemoval: Operations involving the system copying data from a drive in preparation to remove it from the cluster.RtfiPendingNode: Operations involving the system installing compatible software on a node before adding it to the cluster. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "ListAsyncResults"
    }
    
    if async_result_types != nil
      payload["asyncResultTypes"] = async_result_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAsyncResultsResult.new(raw_response) : nil
  end

  def create_volume(name,account_id,total_size,enable512e,qos = nil,attributes = nil)
    ######
    # CreateVolume is used to create a new (empty) volume on the cluster.
    # When the volume is created successfully it is available for connection via iSCSI.
    # param: str name: [required] Name of the volume. Not required to be unique, but it is recommended. May be 1 to 64 characters in length. 
    
    # param: int accountID: [required] AccountID for the owner of this volume. 
    
    # param: int totalSize: [required] Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size. 
    
    # param: bool enable512e: [required] Should the volume provides 512-byte sector emulation? 
    
    # param: QoS qos:  Initial quality of service settings for this volume. <br/><br/> Volumes created without specified QoS values are created with the default values for QoS. Default values for a volume can be found by running the GetDefaultQoS method. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "name" => name,
      "accountID" => account_id,
      "totalSize" => total_size,
      "enable512e" => enable512e,
      "method" => "CreateVolume"
    }
    
    if qos != nil
      payload["qos"] = qos
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateVolumeResult.new(raw_response) : nil
  end

  def delete_volume(volume_id)
    ######
    # DeleteVolume marks an active volume for deletion.
    # It is purged (permanently deleted) after the cleanup interval elapses.
    # After making a request to delete a volume, any active iSCSI connections to the volume is immediately terminated and no further connections are allowed while the volume is in this state.
    # It is not returned in target discovery requests.
    # <br/><br/>
    # Any snapshots of a volume that has been marked to delete are not affected.
    # Snapshots are kept until the volume is purged from the system.
    # <br/><br/>
    # If a volume is marked for deletion, and it has a bulk volume read or bulk volume write operation in progress, the bulk volume operation is stopped.
    # <br/><br/>
    # If the volume you delete is paired with a volume, replication between the paired volumes is suspended and no data is transferred to it or from it while in a deleted state.
    # The remote volume the deleted volume was paired with enters into a PausedMisconfigured state and data is no longer sent to it or from the deleted volume.
    # Until the deleted volume is purged, it can be restored and data transfers resumes.
    # If the deleted volume gets purged from the system, the volume it was paired with enters into a StoppedMisconfigured state and the volume pairing status is removed.
    # The purged volume becomes permanently unavailable.
    # param: int volumeID: [required] The ID of the volume to delete. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "DeleteVolume"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumeResult.new(raw_response) : nil
  end

  def delete_volumes(account_ids = nil,volume_access_group_ids = nil,volume_ids = nil)
    ######
    # DeleteVolumes marks multiple (up to 500) active volumes for deletion. Once marked, the volumes are purged (permanently deleted) after the cleanup interval elapses.The cleanup interval can be set in the SetClusterSettings method. For more information on using this method, see SetClusterSettings on page 1. After making a request to delete volumes, any active iSCSI connections to the volumes are immediately terminated and no further connections are allowed while the volumes are in this state. A marked volume is not returned in target discovery requests. Any snapshots of a volume that has been marked for deletion are not affected. Snapshots are kept until the volume is purged from the system. If a volume is marked for deletion and has a bulk volume read or bulk volume write operation in progress, the bulk volume read or write operation is stopped. If the volumes you delete are paired with a volume, replication between the paired volumes is suspended and no data is transferred to them or from them while in a deleted state. The remote volumes the deleted volumes were paired with enter into a PausedMisconfigured state and data is no longer sent to them or from the deleted volumes. Until the deleted volumes are purged, they can be restored and data transfers resume. If the deleted volumes are purged from the system, the volumes they were paired with enter into a StoppedMisconfigured state and the volume pairing status is removed. The purged volumes become permanently unavailable.
    # param: int accountIDs:  A list of account IDs. All volumes from these accounts are deleted from the system.  
    
    # param: int volumeAccessGroupIDs:  A list of volume access group IDs. All of the volumes from all of the volume access groups you specify in this list are deleted from the system. 
    
    # param: int volumeIDs:  The list of IDs of the volumes to delete from the system. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "DeleteVolumes"
    }
    
    if account_ids != nil
      payload["accountIDs"] = account_ids
    end
    if volume_access_group_ids != nil
      payload["volumeAccessGroupIDs"] = volume_access_group_ids
    end
    if volume_ids != nil
      payload["volumeIDs"] = volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumesResult.new(raw_response) : nil
  end

  def get_volume_stats(volume_id)
    ######
    # GetVolumeStats is used to retrieve high-level activity measurements for a single volume.
    # Values are cumulative from the creation of the volume.
    # param: int volumeID: [required] Specifies the volume for which statistics is gathered. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "GetVolumeStats"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeStatsResult.new(raw_response) : nil
  end

  def get_volume_efficiency(volume_id,force = nil)
    ######
    # GetVolumeEfficiency is used to retrieve information about a volume.
    # Only the volume given as a parameter in this API method is used to compute the capacity.
    # param: int volumeID: [required] Specifies the volume for which capacity is computed. 
    
    # param: bool force:  
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "GetVolumeEfficiency"
    }
    
    if force != nil
      payload["force"] = force
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeEfficiencyResult.new(raw_response) : nil
  end

  def list_bulk_volume_jobs()
    ######
    # ListBulkVolumeJobs is used to return information about each bulk volume read or write operation that is occurring in the system.######

    check_connection(6.0, "Cluster")

    payload ={ 
      "method" => "ListBulkVolumeJobs"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListBulkVolumeJobsResult.new(raw_response) : nil
  end

  def list_active_volumes(start_volume_id = nil,limit = nil)
    ######
    # ListActiveVolumes is used to return the list of active volumes currently in the system.
    # The list of volumes is returned sorted in VolumeID order and can be returned in multiple parts (pages).
    # param: int startVolumeID:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
    
    # param: int limit:  The maximum number of volumes to return from the API. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListActiveVolumes"
    }
    
    if start_volume_id != nil
      payload["startVolumeID"] = start_volume_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActiveVolumesResult.new(raw_response) : nil
  end

  def list_deleted_volumes()
    ######
    # ListDeletedVolumes is used to return the entire list of volumes that have been marked for deletion and is purged from the system.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListDeletedVolumes"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDeletedVolumesResult.new(raw_response) : nil
  end

  def list_iscsisessions()
    ######
    # ListISCSISessions is used to return iSCSI connection information for volumes in the cluster.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListISCSISessions"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListISCSISessionsResult.new(raw_response) : nil
  end

  def list_volumes(start_volume_id = nil,limit = nil,volume_status = nil,accounts = nil,is_paired = nil,volume_ids = nil)
    ######
    # The ListVolumes method is used to return a list of volumes that are in a cluster.
    # You can specify the volumes you want to return in the list by using the available parameters.
    # param: int startVolumeID:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
    
    # param: int limit:  The maximum number of volumes to return from the API. 
    
    # param: str volumeStatus:  If specified, filter to only volumes with the provided status. By default, list all volumes. 
    
    # param: int accounts:  If specified, only fetch volumes which belong to the provided accounts. By default, list volumes for all accounts. 
    
    # param: bool isPaired:  If specified, only fetch volumes which are paired (if true) or non-paired (if false). By default, list all volumes regardless of their pairing status. 
    
    # param: int volumeIDs:  If specified, only fetch volumes specified in this list. This option cannot be specified if startVolumeID, limit, or accounts option is specified. 
    ######

    check_connection(8.0, "Cluster")

    payload ={ 
      "method" => "ListVolumes"
    }
    
    if start_volume_id != nil
      payload["startVolumeID"] = start_volume_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    if volume_status != nil
      payload["volumeStatus"] = volume_status
    end
    if accounts != nil
      payload["accounts"] = accounts
    end
    if is_paired != nil
      payload["isPaired"] = is_paired
    end
    if volume_ids != nil
      payload["volumeIDs"] = volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumesResult.new(raw_response) : nil
  end

  def list_volumes_for_account(account_id,start_volume_id = nil,limit = nil)
    ######
    # ListVolumesForAccount returns the list of active AND (pending) deleted volumes for an account.
    # param: int accountID: [required] The ID of the account to list the volumes for. 
    
    # param: int startVolumeID:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 
    
    # param: int limit:  The maximum number of volumes to return from the API. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "accountID" => account_id,
      "method" => "ListVolumesForAccount"
    }
    
    if start_volume_id != nil
      payload["startVolumeID"] = start_volume_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumesForAccountResult.new(raw_response) : nil
  end

  def list_volume_stats_by_account()
    ######
    # ListVolumeStatsByAccount returns high-level activity measurements for every account.
    # Values are summed from all the volumes owned by the account.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeStatsByAccount"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByAccountResult.new(raw_response) : nil
  end

  def list_volume_stats_by_volume()
    ######
    # ListVolumeStatsByVolume returns high-level activity measurements for every volume, by volume.
    # Values are cumulative from the creation of the volume.######

    check_connection(1.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeStatsByVolume"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVolumeResult.new(raw_response) : nil
  end

  def list_volume_stats_by_volume_access_group(volume_access_groups = nil)
    ######
    # ListVolumeStatsByVolumeAccessGroup is used to get total activity measurements for all of the volumes that are a member of the specified volume access group(s).
    # param: int volumeAccessGroups:  An array of VolumeAccessGroupIDs for which volume activity is returned. If no VolumeAccessGroupID is specified, stats for all volume access groups is returned. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeStatsByVolumeAccessGroup"
    }
    
    if volume_access_groups != nil
      payload["volumeAccessGroups"] = volume_access_groups
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVolumeAccessGroupResult.new(raw_response) : nil
  end

  def modify_volume(volume_id,account_id = nil,access = nil,qos = nil,total_size = nil,attributes = nil)
    ######
    # ModifyVolume is used to modify settings on an existing volume.
    # Modifications can be made to one volume at a time and changes take place immediately.
    # If an optional parameter is left unspecified, the value will not be changed.
    # <br/><br/>
    # Extending the size of a volume that is being replicated should be done in an order.
    # The target (Replication Target) volume should first be increased in size, then the source (Read/Write) volume can be resized.
    # It is recommended that both the target and the source volumes be the same size.
    # <br/><br/>
    # <b>Note</b>: If you change access status to locked or target all existing iSCSI connections are terminated.
    # param: int volumeID: [required] VolumeID for the volume to be modified. 
    
    # param: int accountID:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used. 
    
    # param: str access:  Access allowed for the volume. <br/><b>readOnly</b>: Only read operations are allowed. <br/><b>readWrite</b>: Reads and writes are allowed. <br/><b>locked</b>: No reads or writes are allowed. <br/><b>replicationTarget</b>: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. <br/><br/> If unspecified, the access settings of the clone will be the same as the source. 
    
    # param: QoS qos:  New quality of service settings for this volume. 
    
    # param: int totalSize:  New size of the volume in bytes. Size is rounded up to the nearest 1MiB size. This parameter can only be used to *increase* the size of a volume. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "ModifyVolume"
    }
    
    if account_id != nil
      payload["accountID"] = account_id
    end
    if access != nil
      payload["access"] = access
    end
    if qos != nil
      payload["qos"] = qos
    end
    if total_size != nil
      payload["totalSize"] = total_size
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeResult.new(raw_response) : nil
  end

  def modify_volumes(volume_ids,account_id = nil,access = nil,attributes = nil,qos = nil,total_size = nil)
    ######
    # ModifyVolumes allows you to configure up to 500 existing volumes at one time. Changes take place immediately. If ModifyVolumes fails to modify any of the specified volumes, none of the specified volumes are changed.If you do not specify QoS values when you modify volumes, the QoS values for each volume remain unchanged. You can retrieve default QoS values for a newly created volume by running the GetDefaultQoS method.When you need to increase the size of volumes that are being replicated, do so in the following order to prevent replication errors:Increase the size of the "Replication Target" volume.Increase the size of the source or "Read / Write" volume. recommends that both the target and source volumes be the same size.NOTE: If you change access status to locked or replicationTarget all existing iSCSI connections are terminated.
    # param: int volumeIDs: [required] A list of volumeIDs for the volumes to be modified. 
    
    # param: int accountID:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used. 
    
    # param: str access:  Access allowed for the volume. Possible values:readOnly: Only read operations are allowed.readWrite: Reads and writes are allowed.locked: No reads or writes are allowed.If not specified, the access value does not change.replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked.If a value is not specified, the access value does not change.  
    
    # param: dict attributes:  
    
    # param: QoS qos:  New quality of service settings for this volume.If not specified, the QoS settings are not changed. 
    
    # param: int totalSize:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB in size. This parameter can only be used to increase the size of a volume. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "volumeIDs" => volume_ids,
      "method" => "ModifyVolumes"
    }
    
    if account_id != nil
      payload["accountID"] = account_id
    end
    if access != nil
      payload["access"] = access
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    if qos != nil
      payload["qos"] = qos
    end
    if total_size != nil
      payload["totalSize"] = total_size
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumesResult.new(raw_response) : nil
  end

  def purge_deleted_volume(volume_id)
    ######
    # PurgeDeletedVolume immediately and permanently purges a volume which has been deleted.
    # A volume must be deleted using DeleteVolume before it can be purged.
    # Volumes are purged automatically after a period of time, so usage of this method is not typically required.
    # param: int volumeID: [required] The ID of the volume to purge. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "PurgeDeletedVolume"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PurgeDeletedVolumeResult.new(raw_response) : nil
  end

  def purge_deleted_volumes(volume_ids = nil,account_ids = nil,volume_access_group_ids = nil)
    ######
    # PurgeDeletedVolumes immediately and permanently purges volumes that have been deleted; you can use this method to purge up to 500 volumes at one time. You must delete volumes using DeleteVolumes before they can be purged. Volumes are purged by the system automatically after a period of time, so usage of this method is not typically required.
    # param: int volumeIDs:  A list of volumeIDs of volumes to be purged from the system. 
    
    # param: int accountIDs:  A list of accountIDs. All of the volumes from all of the specified accounts are purged from the system. 
    
    # param: int volumeAccessGroupIDs:  A list of volumeAccessGroupIDs. All of the volumes from all of the specified Volume Access Groups are purged from the system. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "PurgeDeletedVolumes"
    }
    
    if volume_ids != nil
      payload["volumeIDs"] = volume_ids
    end
    if account_ids != nil
      payload["accountIDs"] = account_ids
    end
    if volume_access_group_ids != nil
      payload["volumeAccessGroupIDs"] = volume_access_group_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PurgeDeletedVolumesResult.new(raw_response) : nil
  end

  def restore_deleted_volume(volume_id)
    ######
    # RestoreDeletedVolume marks a deleted volume as active again.
    # This action makes the volume immediately available for iSCSI connection.
    # param: int volumeID: [required] VolumeID for the deleted volume to restore. 
    ######

    check_connection(1.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "method" => "RestoreDeletedVolume"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RestoreDeletedVolumeResult.new(raw_response) : nil
  end

  def start_bulk_volume_read(volume_id,format,snapshot_id = nil,script = nil,script_parameters = nil,attributes = nil)
    ######
    # StartBulkVolumeRead allows you to initialize a bulk volume read session on a specified volume.
    # Only two bulk volume processes can run simultaneously on a volume.
    # When you initialize the session, data is read from a SolidFire storage volume for the purposes of storing the data on an external backup source.
    # The external data is accessed by a web server running on a SolidFire node.
    # Communications and server interaction information for external data access is passed by a script running on the SolidFire storage system.<br/>
    # <br/>
    # At the start of a bulk volume read operation, a snapshot of the volume is made and the snapshot is deleted when the read has completed.
    # You can also read a snapshot of the volume by entering the ID of the snapshot as a parameter.
    # Reading a previous snapshot does not create a new snapshot of the volume, nor does the previous snapshot be deleted when the read completes.<br/>
    # <br/>
    # <b>Note</b>: This process creates a new snapshot if the ID of an existing snapshot is not provided.
    # Snapshots can be created if cluster fullness is at stage 2 or 3.
    # Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: int volumeID: [required] ID of the volume to be read. 
    
    # param: str format: [required] The format of the volume data. Can be either: <br/><b>uncompressed</b>: every byte of the volume is returned without any compression. <br/><b>native</b>: opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write. 
    
    # param: int snapshotID:  ID of a previously created snapshot used for bulk volume reads. If no ID is entered, a snapshot of the current active volume image is made. 
    
    # param: str script:  Executable name of a script. If no script name is given then the key and URL is necessary to access SolidFire nodes. The script is run on the primary node and the key and URL is returned to the script so the local web server can be contacted. 
    
    # param: str scriptParameters:  JSON parameters to pass to the script. 
    
    # param: dict attributes:  JSON attributes for the bulk volume job. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "format" => format,
      "method" => "StartBulkVolumeRead"
    }
    
    if snapshot_id != nil
      payload["snapshotID"] = snapshot_id
    end
    if script != nil
      payload["script"] = script
    end
    if script_parameters != nil
      payload["scriptParameters"] = script_parameters
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartBulkVolumeReadResult.new(raw_response) : nil
  end

  def start_bulk_volume_write(volume_id,format,script = nil,script_parameters = nil,attributes = nil)
    ######
    # StartBulkVolumeWrite allows you to initialize a bulk volume write session on a specified volume.
    # Only two bulk volume processes can run simultaneously on a volume.
    # When the session is initialized, data can be written to a SolidFire storage volume from an external backup source.
    # The external data is accessed by a web server running on a SolidFire node.
    # Communications and server interaction information for external data access is passed by a script running on the SolidFire storage system.
    # param: int volumeID: [required] ID of the volume to be written to. 
    
    # param: str format: [required] The format of the volume data. Can be either: <br/><b>uncompressed</b>: every byte of the volume is returned without any compression. <br/><b>native</b>: opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write 
    
    # param: str script:  Executable name of a script. If no script name is given then the key and URL are necessary to access SolidFire nodes. The script runs on the primary node and the key and URL is returned to the script so the local web server can be contacted. 
    
    # param: str scriptParameters:  JSON parameters to pass to the script. 
    
    # param: dict attributes:  JSON attributes for the bulk volume job. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeID" => volume_id,
      "format" => format,
      "method" => "StartBulkVolumeWrite"
    }
    
    if script != nil
      payload["script"] = script
    end
    if script_parameters != nil
      payload["scriptParameters"] = script_parameters
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartBulkVolumeWriteResult.new(raw_response) : nil
  end

  def update_bulk_volume_status(key,status,percent_complete = nil,message = nil,attributes = nil)
    ######
    # You can use UpdateBulkVolumeStatus in a script to return to the SolidFire system the status of a bulk volume job that you have started with the "StartBulkVolumeRead" or "StartBulkVolumeWrite" methods.
    # param: str key: [required] The key assigned during initialization of a "StartBulkVolumeRead" or "StartBulkVolumeWrite" session. 
    
    # param: str status: [required] The SolidFire system sets the status of the given bulk volume job.<br/> Possible values:<br/> <br/><b>running</b>: jobs that are still active. <br/><b>complete</b>: jobs that are done. failed - jobs that have failed. <br/><b>failed</b>: jobs that have failed. 
    
    # param: str percentComplete:  The completed progress of the bulk volume job as a percentage. 
    
    # param: str message:  Returns the status of the bulk volume job when the job has completed. 
    
    # param: dict attributes:  JSON attributes  updates what is on the bulk volume job. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "key" => key,
      "status" => status,
      "method" => "UpdateBulkVolumeStatus"
    }
    
    if percent_complete != nil
      payload["percentComplete"] = percent_complete
    end
    if message != nil
      payload["message"] = message
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? UpdateBulkVolumeStatusResult.new(raw_response) : nil
  end

  def set_default_qos(min_iops = nil,max_iops = nil,burst_iops = nil)
    ######
    # SetDefaultQoS enables you to configure the default Quality of Service (QoS) values (measured in inputs and outputs per second, or IOPS) for all volumes not yet created.
    # param: int minIOPS:  The minimum number of sustained IOPS that are provided by the cluster to a volume. 
    
    # param: int maxIOPS:  The maximum number of sustained IOPS that are provided by the cluster to a volume. 
    
    # param: int burstIOPS:  The maximum number of IOPS allowed in a short burst scenario. 
    ######

    check_connection(9.0, "Cluster")

    payload ={ 
      "method" => "SetDefaultQoS"
    }
    
    if min_iops != nil
      payload["minIOPS"] = min_iops
    end
    if max_iops != nil
      payload["maxIOPS"] = max_iops
    end
    if burst_iops != nil
      payload["burstIOPS"] = burst_iops
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetDefaultQoSResult.new(raw_response) : nil
  end

  def create_volume_access_group(name,initiators = nil,volumes = nil,virtual_network_id = nil,virtual_network_tags = nil,attributes = nil)
    ######
    # Creates a new volume access group.
    # The new volume access group must be given a name when it is created.
    # Entering initiators and volumes are optional when creating a volume access group.
    # Once the group is created volumes and initiator IQNs can be added.
    # Any initiator IQN that is successfully added to the volume access group is able to access any volume in the group without CHAP authentication.
    # param: str name: [required] Name of the volume access group. It is not required to be unique, but recommended. 
    
    # param: str initiators:  List of initiators to include in the volume access group. If unspecified, the access group will start out without configured initiators. 
    
    # param: int volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group will start without any volumes. 
    
    # param: int virtualNetworkID:  The ID of the SolidFire Virtual Network ID to associate the volume access group with. 
    
    # param: int virtualNetworkTags:  The ID of the VLAN Virtual Network Tag to associate the volume access group with. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "name" => name,
      "method" => "CreateVolumeAccessGroup"
    }
    
    if initiators != nil
      payload["initiators"] = initiators
    end
    if volumes != nil
      payload["volumes"] = volumes
    end
    if virtual_network_id != nil
      payload["virtualNetworkID"] = virtual_network_id
    end
    if virtual_network_tags != nil
      payload["virtualNetworkTags"] = virtual_network_tags
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateVolumeAccessGroupResult.new(raw_response) : nil
  end

  def list_volume_access_groups(start_volume_access_group_id = nil,limit = nil)
    ######
    # ListVolumeAccessGroups is used to return information about the volume access groups that are currently in the system.
    # param: int startVolumeAccessGroupID:  The lowest VolumeAccessGroupID to return. This can be useful for paging. If unspecified, there is no lower limit (implicitly 0). 
    
    # param: int limit:  The maximum number of results to return. This can be useful for paging. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "method" => "ListVolumeAccessGroups"
    }
    
    if start_volume_access_group_id != nil
      payload["startVolumeAccessGroupID"] = start_volume_access_group_id
    end
    if limit != nil
      payload["limit"] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeAccessGroupsResult.new(raw_response) : nil
  end

  def delete_volume_access_group(volume_access_group_id)
    ######
    # Delete a volume access group from the system.
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to delete. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "method" => "DeleteVolumeAccessGroup"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumeAccessGroupResult.new(raw_response) : nil
  end

  def modify_volume_access_group(volume_access_group_id,virtual_network_id = nil,virtual_network_tags = nil,name = nil,initiators = nil,volumes = nil,attributes = nil)
    ######
    # Update initiators and add or remove volumes from a volume access group.
    # A specified initiator or volume that duplicates an existing volume or initiator in a volume access group is left as-is.
    # If a value is not specified for volumes or initiators, the current list of initiators and volumes are not changed.
    # <br/><br/>
    # Often, it is easier to use the convenience functions to modify initiators and volumes independently:
    # <br/><br/>
    # AddInitiatorsToVolumeAccessGroup<br/>
    # RemoveInitiatorsFromVolumeAccessGroup<br/>
    # AddVolumesToVolumeAccessGroup<br/>
    # RemoveVolumesFromVolumeAccessGroup<br/>
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to modify. 
    
    # param: int virtualNetworkID:  The ID of the SolidFire Virtual Network ID to associate the volume access group with. 
    
    # param: int virtualNetworkTags:  The ID of the VLAN Virtual Network Tag to associate the volume access group with. 
    
    # param: str name:  Name of the volume access group. It is not required to be unique, but recommended. 
    
    # param: str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators will not be modified. 
    
    # param: int volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes will not be modified. 
    
    # param: dict attributes:  List of Name/Value pairs in JSON object format. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "method" => "ModifyVolumeAccessGroup"
    }
    
    if virtual_network_id != nil
      payload["virtualNetworkID"] = virtual_network_id
    end
    if virtual_network_tags != nil
      payload["virtualNetworkTags"] = virtual_network_tags
    end
    if name != nil
      payload["name"] = name
    end
    if initiators != nil
      payload["initiators"] = initiators
    end
    if volumes != nil
      payload["volumes"] = volumes
    end
    if attributes != nil
      payload["attributes"] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def add_initiators_to_volume_access_group(volume_access_group_id,initiators)
    ######
    # Add initiators to a volume access group.
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to modify. 
    
    # param: str initiators: [required] List of initiators to add to the volume access group. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "initiators" => initiators,
      "method" => "AddInitiatorsToVolumeAccessGroup"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def remove_initiators_from_volume_access_group(volume_access_group_id,initiators)
    ######
    # Remove initiators from a volume access group.
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to modify. 
    
    # param: str initiators: [required] List of initiators to remove from the volume access group. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "initiators" => initiators,
      "method" => "RemoveInitiatorsFromVolumeAccessGroup"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def add_volumes_to_volume_access_group(volume_access_group_id,volumes)
    ######
    # Add volumes to a volume access group.
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to modify. 
    
    # param: int volumes: [required] List of volumes to add to this volume access group. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "volumes" => volumes,
      "method" => "AddVolumesToVolumeAccessGroup"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def remove_volumes_from_volume_access_group(volume_access_group_id,volumes)
    ######
    # Remove volumes from a volume access group.
    # param: int volumeAccessGroupID: [required] The ID of the volume access group to modify. 
    
    # param: int volumes: [required] List of volumes to remove from this volume access group. 
    ######

    check_connection(5.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "volumes" => volumes,
      "method" => "RemoveVolumesFromVolumeAccessGroup"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def get_volume_access_group_efficiency(volume_access_group_id)
    ######
    # GetVolumeAccessGroupEfficiency is used to retrieve efficiency information about a volume access group. Only the volume access group provided as parameters in this API method is used to compute the capacity.
    # param: int volumeAccessGroupID: [required] Specifies the volume access group for which capacity is computed. 
    ######

    check_connection(6.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "method" => "GetVolumeAccessGroupEfficiency"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetEfficiencyResult.new(raw_response) : nil
  end

  def get_volume_access_group_lun_assignments(volume_access_group_id)
    ######
    # The GetVolumeAccessGroupLunAssignments is used to return information LUN mappings of a specified volume access group.
    # param: int volumeAccessGroupID: [required] Unique volume access group ID used to return information. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "method" => "GetVolumeAccessGroupLunAssignments"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeAccessGroupLunAssignmentsResult.new(raw_response) : nil
  end

  def modify_volume_access_group_lun_assignments(volume_access_group_id,lun_assignments)
    ######
    # The ModifytVolumeAccessGroupLunAssignments is used to define custom LUN assignments for specific volumes. Only LUN values set on the lunAssignments parameter will be changed in the volume access group. All other LUN assignments will remain unchanged.
    # <br/><br/>
    # LUN assignment values must be unique for volumes in a volume access group. An exception will be seen if LUN assignments are duplicated in a volume access group. However, the same LUN values can be used again in different volume access groups.
    # <br/><br/>
    # <b>Note:</b> Correct LUN values are 0 - 16383. An exception will be seen if an incorrect LUN value is passed. None of the specified LUN assignments will be modified if there is an exception.
    # <br/><br/>
    # <b>Caution:</b> If a LUN assignment is changed for a volume with active I/O, the I/O could be disrupted. Changes to the server configuration may be required in order to change volume LUN assignments.
    # param: int volumeAccessGroupID: [required] Unique volume access group ID for which the LUN assignments will be modified. 
    
    # param: LunAssignment lunAssignments: [required] The volume IDs with new assigned LUN values. 
    ######

    check_connection(7.0, "Cluster")

    payload ={ 
      "volumeAccessGroupID" => volume_access_group_id,
      "lunAssignments" => lun_assignments,
      "method" => "ModifyVolumeAccessGroupLunAssignments"
    }
    
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupLunAssignmentsResult.new(raw_response) : nil
  end

end

