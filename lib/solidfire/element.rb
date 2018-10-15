require 'net/http'
require 'net/https'
require 'uri'
require 'rubygems'
require 'json'
require_relative 'service_base'

class Element < ServiceBase
  def initialize(host, port, username, password, connection_version, verify_ssl)
    super(host, port, username, password, connection_version, verify_ssl)
  end

  def add_account(username, initiator_secret = nil, target_secret = nil, attributes = nil)
    ######
    # You can use AddAccount to add a new account to the system. You can create new volumes under the new account. The CHAP settings you specify for the account apply to all volumes owned by the account.
    # param: str username: [required] Specifies the username for this account. (Might be 1 to 64 characters in length). 

    # param: CHAPSecret initiatorSecret:  The CHAP secret to use for the initiator. This secret must be 12-16 characters in length and should be impenetrable. The initiator CHAP secret must be unique and cannot be the same as the target CHAP secret. If unspecified, a random secret is created. 

    # param: CHAPSecret targetSecret:  The CHAP secret to use for the target (mutual CHAP authentication). This secret must be 12-16 characters in length and should be impenetrable. The target CHAP secret must be unique and cannot be the same as the initiator CHAP secret. If unspecified, a random secret is created. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(username, 'username', String)

    payload = {
        'params' => {
            'username' => username
        },
        'method' => 'AddAccount'
    }

    if initiator_secret != nil
      check_parameter(initiator_secret, 'initiator_secret', CHAPSecret)
      payload['params']["initiatorSecret"] = initiator_secret.secret
    end
    if target_secret != nil
      check_parameter(target_secret, 'target_secret', CHAPSecret)
      payload['params']["targetSecret"] = target_secret.secret
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddAccountResult.new(raw_response) : nil
  end

  def add_account_with_object(r)
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.initiator_secret == nil
      raise "Before you can run this command, you need to set the param, initiatorSecret in the request object."
    end
    if r.target_secret == nil
      raise "Before you can run this command, you need to set the param, targetSecret in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    add_account(r.username, r.initiator_secret, r.target_secret, r.attributes)
  end

  def get_account_by_id(account_id)
    ######
    # GetAccountByID enables you to return details about a specific account, given its accountID.
    # param: Fixnum accountID: [required] Specifies the account for which details are gathered. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(account_id, 'account_id', 'Fixnum')

    payload = {
        'params' => {
            'accountID' => account_id
        },
        'method' => 'GetAccountByID'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAccountResult.new(raw_response) : nil
  end

  def get_account_by_id_with_object(r)
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    get_account_by_id(r.account_id)
  end

  def get_account_by_name(username)
    ######
    # GetAccountByName enables you to retrieve details about a specific account, given its username.
    # param: str username: [required] Username for the account. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(username, 'username', String)

    payload = {
        'params' => {
            'username' => username
        },
        'method' => 'GetAccountByName'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAccountResult.new(raw_response) : nil
  end

  def get_account_by_name_with_object(r)
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    get_account_by_name(r.username)
  end

  def get_account_efficiency(account_id)
    ######
    # GetAccountEfficiency enables you to retrieve efficiency statistics about a volume account. This method returns efficiency information
    # only for the account you specify as a parameter.
    # param: Fixnum accountID: [required] Specifies the volume account for which efficiency statistics are returned. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(account_id, 'account_id', 'Fixnum')

    payload = {
        'params' => {
            'accountID' => account_id
        },
        'method' => 'GetAccountEfficiency'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetEfficiencyResult.new(raw_response) : nil
  end

  def get_account_efficiency_with_object(r)
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    get_account_efficiency(r.account_id)
  end

  def list_accounts(start_account_id = nil, limit = nil, include_storage_containers = nil)
    ######
    # ListAccounts returns the entire list of accounts, with optional paging support.
    # param: Fixnum startAccountID:  Starting AccountID to return. If no account exists with this AccountID, the next account by AccountID order is used as the start of the list. To page through the list, pass the AccountID of the last account in the previous response + 1. 

    # param: Fixnum limit:  Maximum number of AccountInfo objects to return. 

    # param: bool includeStorageContainers:  Includes storage containers in the response by default. To exclude storage containers, set to false. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListAccounts'
    }

    if start_account_id != nil
      check_parameter(start_account_id, 'start_account_id', Fixnum)
      payload['params']['startAccountID'] = start_account_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if include_storage_containers != nil
      check_parameter(include_storage_containers, 'include_storage_containers', bool)
      payload['params']['includeStorageContainers'] = include_storage_containers
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAccountsResult.new(raw_response) : nil
  end

  def list_accounts_with_object(r)
    if r.start_account_id == nil
      raise "Before you can run this command, you need to set the param, startAccountID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.include_storage_containers == nil
      raise "Before you can run this command, you need to set the param, includeStorageContainers in the request object."
    end
    list_accounts(r.start_account_id, r.limit, r.include_storage_containers)
  end

  def modify_account(account_id, username = nil, status = nil, initiator_secret = nil, target_secret = nil, attributes = nil)
    ######
    # ModifyAccount enables you to modify an existing account.
    # When you lock an account, any existing connections from that account are immediately terminated. When you change an account's
    # CHAP settings, any existing connections remain active, and the new CHAP settings are used on subsequent connections or
    # reconnections.
    # To clear an account's attributes, specify {} for the attributes parameter.
    # param: Fixnum accountID: [required] Specifies the AccountID for the account to be modified. 

    # param: str username:  Specifies the username associated with the account. (Might be 1 to 64 characters in length). 

    # param: str status:  Sets the status for the account. Possible values are: active: The account is active and connections are allowed. locked: The account is locked and connections are refused. 

    # param: CHAPSecret initiatorSecret:  Specifies the CHAP secret to use for the initiator. This secret must be 12-16 characters in length and should be impenetrable. The initiator CHAP secret must be unique and cannot be the same as the target CHAP secret. 

    # param: CHAPSecret targetSecret:  Specifies the CHAP secret to use for the target (mutual CHAP authentication). This secret must be 12-16 characters in length and should be impenetrable. The target CHAP secret must be unique and cannot be the same as the initiator CHAP secret. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(account_id, 'account_id', 'Fixnum')

    payload = {
        'params' => {
            'accountID' => account_id
        },
        'method' => 'ModifyAccount'
    }

    if username != nil
      check_parameter(username, 'username', str)
      payload['params']['username'] = username
    end
    if status != nil
      check_parameter(status, 'status', str)
      payload['params']['status'] = status
    end
    if initiator_secret != nil
      check_parameter(initiator_secret, 'initiator_secret', CHAPSecret)
      payload['params']["initiatorSecret"] = initiator_secret.secret
    end
    if target_secret != nil
      check_parameter(target_secret, 'target_secret', CHAPSecret)
      payload['params']["targetSecret"] = target_secret.secret
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyAccountResult.new(raw_response) : nil
  end

  def modify_account_with_object(r)
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.status == nil
      raise "Before you can run this command, you need to set the param, status in the request object."
    end
    if r.initiator_secret == nil
      raise "Before you can run this command, you need to set the param, initiatorSecret in the request object."
    end
    if r.target_secret == nil
      raise "Before you can run this command, you need to set the param, targetSecret in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_account(r.account_id, r.username, r.status, r.initiator_secret, r.target_secret, r.attributes)
  end

  def remove_account(account_id)
    ######
    # RemoveAccount enables you to remove an existing account. You must delete and purge all volumes associated with the account
    # using DeleteVolume before you can remove the account. If volumes on the account are still pending deletion, you cannot use
    # RemoveAccount to remove the account.
    # param: Fixnum accountID: [required] Specifies the AccountID for the account to be removed. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(account_id, 'account_id', 'Fixnum')

    payload = {
        'params' => {
            'accountID' => account_id
        },
        'method' => 'RemoveAccount'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveAccountResult.new(raw_response) : nil
  end

  def remove_account_with_object(r)
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    remove_account(r.account_id)
  end

  def create_backup_target(name, attributes = nil)
    ######
    # CreateBackupTarget enables you to create and store backup target information so that you do not need to re-enter it each time a backup is created.
    # param: str name: [required] The name of the backup target. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(name, 'name', String)

    payload = {
        'params' => {
            'name' => name
        },
        'method' => 'CreateBackupTarget'
    }

    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateBackupTargetResult.new(raw_response) : nil
  end

  def create_backup_target_with_object(r)
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_backup_target(r.name, r.attributes)
  end

  def get_backup_target(backup_target_id)
    ######
    # GetBackupTarget enables you to return information about a specific backup target that you have created.
    # param: Fixnum backupTargetID: [required] The unique identifier assigned to the backup target. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(backup_target_id, 'backup_target_id', 'Fixnum')

    payload = {
        'params' => {
            'backupTargetID' => backup_target_id
        },
        'method' => 'GetBackupTarget'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetBackupTargetResult.new(raw_response) : nil
  end

  def get_backup_target_with_object(r)
    if r.backup_target_id == nil
      raise "Before you can run this command, you need to set the param, backupTargetID in the request object."
    end
    get_backup_target(r.backup_target_id)
  end

  def list_backup_targets()
    ######
    # You can use ListBackupTargets to retrieve information about all backup targets that have been created.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListBackupTargets'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListBackupTargetsResult.new(raw_response) : nil
  end


  def modify_backup_target(backup_target_id, name = nil, attributes = nil)
    ######
    # ModifyBackupTarget enables you to change attributes of a backup target.
    # param: Fixnum backupTargetID: [required] The unique target ID for the target to modify. 

    # param: str name:  The new name for the backup target. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(backup_target_id, 'backup_target_id', 'Fixnum')

    payload = {
        'params' => {
            'backupTargetID' => backup_target_id
        },
        'method' => 'ModifyBackupTarget'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyBackupTargetResult.new(raw_response) : nil
  end

  def modify_backup_target_with_object(r)
    if r.backup_target_id == nil
      raise "Before you can run this command, you need to set the param, backupTargetID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_backup_target(r.backup_target_id, r.name, r.attributes)
  end

  def remove_backup_target(backup_target_id)
    ######
    # RemoveBackupTarget allows you to delete backup targets.
    # param: Fixnum backupTargetID: [required] The unique target ID of the target to remove. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(backup_target_id, 'backup_target_id', 'Fixnum')

    payload = {
        'params' => {
            'backupTargetID' => backup_target_id
        },
        'method' => 'RemoveBackupTarget'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveBackupTargetResult.new(raw_response) : nil
  end

  def remove_backup_target_with_object(r)
    if r.backup_target_id == nil
      raise "Before you can run this command, you need to set the param, backupTargetID in the request object."
    end
    remove_backup_target(r.backup_target_id)
  end

  def add_cluster_admin(username, password, access, accept_eula = nil, attributes = nil)
    ######
    # You can use AddClusterAdmin to add a new cluster admin account. A cluster ddmin can manage the cluster using the API and management tools. Cluster admins are completely separate and unrelated to standard tenant accounts.
    # Each cluster admin can be restricted to a subset of the API. NetApp recommends using multiple cluster admin accounts for different users and applications. You should give each cluster admin the minimal permissions necessary; this reduces the potential impact of credential compromise.
    # You must accept the End User License Agreement (EULA) by setting the acceptEula parameter to true to add a cluster administrator account to the system.
    # param: str username: [required] Unique username for this cluster admin. Must be between 1 and 1024 characters in length. 

    # param: str password: [required] Password used to authenticate this cluster admin. 

    # param: str access: [required] Controls which methods this cluster admin can use. For more details on the levels of access, see Access Control in the Element API Reference Guide. 

    # param: bool acceptEula:  Required to indicate your acceptance of the End User License Agreement when creating this cluster. To accept the EULA, set this parameter to true. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(username, 'username', String)

    check_parameter(password, 'password', String)

    check_parameter(access, 'access', String)

    payload = {
        'params' => {
            'username' => username,
            'password' => password,
            'access' => access
        },
        'method' => 'AddClusterAdmin'
    }

    if accept_eula != nil
      check_parameter(accept_eula, 'accept_eula', bool)
      payload['params']['acceptEula'] = accept_eula
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddClusterAdminResult.new(raw_response) : nil
  end

  def add_cluster_admin_with_object(r)
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.password == nil
      raise "Before you can run this command, you need to set the param, password in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.accept_eula == nil
      raise "Before you can run this command, you need to set the param, acceptEula in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    add_cluster_admin(r.username, r.password, r.access, r.accept_eula, r.attributes)
  end

  def clear_cluster_faults(fault_types = nil)
    ######
    # You can use the ClearClusterFaults method to clear information about both current and previously detected faults. Both resolved
    # and unresolved faults can be cleared.
    # param: str faultTypes:  Determines the types of faults cleared. Possible values are: current: Faults that are currently detected and have not been resolved. resolved: (Default) Faults that were previously detected and resolved. all: Both current and resolved faults are cleared. The fault status can be determined by the resolved field of the fault object. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ClearClusterFaults'
    }

    if fault_types != nil
      check_parameter(fault_types, 'fault_types', str)
      payload['params']['faultTypes'] = fault_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ClearClusterFaultsResult.new(raw_response) : nil
  end

  def clear_cluster_faults_with_object(r)
    if r.fault_types == nil
      raise "Before you can run this command, you need to set the param, faultTypes in the request object."
    end
    clear_cluster_faults(r.fault_types)
  end

  def create_cluster(mvip, svip, rep_count, username, password, nodes, accept_eula = nil, attributes = nil)
    ######
    # The CreateCluster method enables you to initialize the node in a cluster that has ownership of the "mvip" and "svip" addresses. Each new cluster is initialized using the management IP (MIP) of the first node in the cluster. This method also automatically adds all the nodes being configured into the cluster. You only need to use this method once each time a new cluster is initialized.
    # Note: You need to log in to the node that is used as the master node for the cluster. After you log in, run the GetBootstrapConfig method on the node to get the IP addresses for the rest of the nodes that you want to include in the
    # cluster. Then, run the CreateCluster method.
    # param: bool acceptEula:  Required to indicate your acceptance of the End User License Agreement when creating this cluster. To accept the EULA, set this parameter to true. 

    # param: str mvip: [required] Floating (virtual) IP address for the cluster on the management network. 

    # param: str svip: [required] Floating (virtual) IP address for the cluster on the storage (iSCSI) network. 

    # param: Fixnum repCount: [required] Number of replicas of each piece of data to store in the cluster. Valid value is "2". 

    # param: str username: [required] Username for the cluster admin. 

    # param: str password: [required] Initial password for the cluster admin account. 

    # param: str nodes: [required] CIP/SIP addresses of the initial set of nodes making up the cluster. This node's IP must be in the list. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(None, 'Both')

    check_parameter(mvip, 'mvip', String)

    check_parameter(svip, 'svip', String)

    check_parameter(rep_count, 'rep_count', 'Fixnum')

    check_parameter(username, 'username', String)

    check_parameter(password, 'password', String)

    check_parameter(nodes, 'nodes', String)

    payload = {
        'params' => {
            'mvip' => mvip,
            'svip' => svip,
            'repCount' => rep_count,
            'username' => username,
            'password' => password,
            'nodes' => nodes
        },
        'method' => 'CreateCluster'
    }

    if accept_eula != nil
      check_parameter(accept_eula, 'accept_eula', bool)
      payload['params']['acceptEula'] = accept_eula
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateClusterResult.new(raw_response) : nil
  end

  def create_cluster_with_object(r)
    if r.accept_eula == nil
      raise "Before you can run this command, you need to set the param, acceptEula in the request object."
    end
    if r.mvip == nil
      raise "Before you can run this command, you need to set the param, mvip in the request object."
    end
    if r.svip == nil
      raise "Before you can run this command, you need to set the param, svip in the request object."
    end
    if r.rep_count == nil
      raise "Before you can run this command, you need to set the param, repCount in the request object."
    end
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.password == nil
      raise "Before you can run this command, you need to set the param, password in the request object."
    end
    if r.nodes == nil
      raise "Before you can run this command, you need to set the param, nodes in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_cluster(r.mvip, r.svip, r.rep_count, r.username, r.password, r.nodes, r.accept_eula, r.attributes)
  end

  def create_support_bundle(bundle_name = nil, extra_args = nil, timeout_sec = nil)
    ######
    # CreateSupportBundle enables you to create a support bundle file under the node's directory. After creation, the bundle is stored on the node as a tar.gz file.
    # param: str bundleName:  The unique name for the support bundle. If no name is provided, "supportbundle" and the node name are used as the filename. 

    # param: str extraArgs:  Passed to the sf_make_support_bundle script. You should use this parameter only at the request of NetApp SolidFire Support. 

    # param: Fixnum timeoutSec:  The number of seconds to allow the support bundle script to run before stopping. The default value is 1500 seconds. 
    ######

    check_connection(8, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'CreateSupportBundle'
    }

    if bundle_name != nil
      check_parameter(bundle_name, 'bundle_name', str)
      payload['params']['bundleName'] = bundle_name
    end
    if extra_args != nil
      check_parameter(extra_args, 'extra_args', str)
      payload['params']['extraArgs'] = extra_args
    end
    if timeout_sec != nil
      check_parameter(timeout_sec, 'timeout_sec', Fixnum)
      payload['params']['timeoutSec'] = timeout_sec
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateSupportBundleResult.new(raw_response) : nil
  end

  def create_support_bundle_with_object(r)
    if r.bundle_name == nil
      raise "Before you can run this command, you need to set the param, bundleName in the request object."
    end
    if r.extra_args == nil
      raise "Before you can run this command, you need to set the param, extraArgs in the request object."
    end
    if r.timeout_sec == nil
      raise "Before you can run this command, you need to set the param, timeoutSec in the request object."
    end
    create_support_bundle(r.bundle_name, r.extra_args, r.timeout_sec)
  end

  def delete_all_support_bundles()
    ######
    # DeleteAllSupportBundles enables you to delete all support bundles generated with the CreateSupportBundle API method.######

    check_connection(8, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'DeleteAllSupportBundles'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteAllSupportBundlesResult.new(raw_response) : nil
  end


  def disable_encryption_at_rest()
    ######
    # The DisableEncryptionAtRest method enables you to remove the encryption that was previously applied to the cluster using the EnableEncryptionAtRest method. This disable method is asynchronous and returns a response before encryption is disabled. You can use the GetClusterInfo method to poll the system to see when the process has completed.######

    check_connection(5, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'DisableEncryptionAtRest'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableEncryptionAtRestResult.new(raw_response) : nil
  end


  def disable_snmp()
    ######
    # You can use DisableSnmp to disable SNMP on the cluster nodes.######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'DisableSnmp'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableSnmpResult.new(raw_response) : nil
  end


  def enable_encryption_at_rest()
    ######
    # You can use the EnableEncryptionAtRest method to enable the Advanced Encryption Standard (AES) 256-bit encryption at rest on the cluster, so that the cluster can manage the encryption key used for the drives on each node. This feature is not enabled by default.
    # When you enable Encryption at Rest, the cluster automatically manages encryption keys internally for the drives on each node in the cluster. Nodes do not store the keys to unlock drives and the keys are never passed over the network. Two nodes participating in a cluster are required to access the key to disable encryption on a drive. The encryption management does not affect performance or efficiency on the cluster. If an encryption-enabled drive or node is removed from the cluster with the API, Encryption at Rest is disabled and the data is not secure erased. Data can be secure erased using the SecureEraseDrives API method.
    # Note: If you have a node type with a model number ending in "-NE", the EnableEncryptionAtRest method call fails with a response of "Encryption not allowed. Cluster detected non-encryptable node".
    # You should only enable or disable encryption when the cluster is running and in a healthy state. You can enable or disable encryption at your discretion and as often as you need.
    # Note: This process is asynchronous and returns a response before encryption is enabled. You can use the GetClusterInfo
    # method to poll the system to see when the process has completed.######

    check_connection(5, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'EnableEncryptionAtRest'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableEncryptionAtRestResult.new(raw_response) : nil
  end


  def enable_snmp(snmp_v3_enabled)
    ######
    # EnableSnmp enables you to enable SNMP on cluster nodes. When you enable SNMP, the action applies to all nodes in the cluster, and
    # the values that are passed replace, in whole, all values set in any previous call to EnableSnmp.
    # param: bool snmpV3Enabled: [required] If set to "true", then SNMP v3 is enabled on each node in the cluster. If set to "false", then SNMP v2 is enabled. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(snmp_v3_enabled, 'snmp_v3_enabled', 'bool')

    payload = {
        'params' => {
            'snmpV3Enabled' => snmp_v3_enabled
        },
        'method' => 'EnableSnmp'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableSnmpResult.new(raw_response) : nil
  end

  def enable_snmp_with_object(r)
    if r.snmp_v3_enabled == nil
      raise "Before you can run this command, you need to set the param, snmpV3Enabled in the request object."
    end
    enable_snmp(r.snmp_v3_enabled)
  end

  def get_api()
    ######
    # You can use the GetAPI method to return a list of all the API methods and supported API endpoints that can be used in the system.######

    check_connection(1.0, 'Both')

    payload = {
        'params' => {
        },
        'method' => 'GetAPI'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetAPIResult.new(raw_response) : nil
  end


  def get_cluster_capacity()
    ######
    # You can use the GetClusterCapacity method to return the high-level capacity measurements for an entire cluster. You can use the fields returned from this method to calculate the efficiency rates that are displayed in the Element OS Web UI. You can use the following calculations in scripts to return the efficiency rates for thin provisioning, deduplication, compression, and overall efficiency.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterCapacity'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterCapacityResult.new(raw_response) : nil
  end


  def get_cluster_config()
    ######
    # The GetClusterConfig API method enables you to return information about the cluster configuration this node uses to communicate with the cluster that it is a part of.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterConfigResult.new(raw_response) : nil
  end


  def get_cluster_full_threshold()
    ######
    # You can use GetClusterFullThreshold to view the stages set for cluster fullness levels. This method returns all fullness metrics for the
    # cluster.
    # Note: When a cluster reaches the Error stage of block cluster fullness, the maximum IOPS on all volumes are reduced linearly to the volume's minimum IOPS as the cluster approaches the Critical stage. This helps prevent the cluster from
    # reaching the Critical stage of block cluster fullness.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterFullThreshold'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterFullThresholdResult.new(raw_response) : nil
  end


  def get_cluster_info()
    ######
    # GetClusterInfo enables you to return configuration information about the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterInfoResult.new(raw_response) : nil
  end


  def get_cluster_master_node_id()
    ######
    # GetClusterMasterNodeID enables you to retrieve the ID of the node that can perform cluster-wide administration tasks and holds the
    # storage virtual IP address (SVIP) and management virtual IP address (MVIP).######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterMasterNodeID'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterMasterNodeIDResult.new(raw_response) : nil
  end


  def get_cluster_state(force)
    ######
    # The GetClusterState API method enables you to indicate if a node is part of a cluster or not. The three states are:
    # Available: Node has not been configured with a cluster name.
    # Pending: Node is pending for a specific named cluster and can be added.
    # Active: Node is an active member of a cluster and may not be added to another
    # cluster.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: bool force: [required] To run this command, the force parameter must be set to true. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'force' => force
        },
        'method' => 'GetClusterState'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterStateResult.new(raw_response) : nil
  end

  def get_cluster_state_with_object(r)
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    get_cluster_state(r.force)
  end

  def get_cluster_stats()
    ######
    # GetClusterStats enables you to retrieve high-level activity measurements for the cluster. Values returned are cumulative from the
    # creation of the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterStatsResult.new(raw_response) : nil
  end


  def get_cluster_version_info()
    ######
    # GetClusterVersionInfo enables you to retrieve information about the Element software version running on each node in the cluster.
    # This method also returns information about nodes that are currently in the process of upgrading software.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterVersionInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterVersionInfoResult.new(raw_response) : nil
  end


  def get_current_cluster_admin()
    ######
    # GetCurrentClusterAdmin returns information for the current primary cluster administrator. The primary Cluster Admin was created when the cluster was created.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetCurrentClusterAdmin'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetCurrentClusterAdminResult.new(raw_response) : nil
  end


  def get_limits()
    ######
    # GetLimits enables you to retrieve the limit values set by the API. These values might change between releases of Element OS, but do not change without an update to the system. Knowing the limit values set by the API can be useful when writing API scripts for user-facing tools.
    # Note: The GetLimits method returns the limits for the current software version regardless of the API endpoint version used to pass the method.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetLimits'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetLimitsResult.new(raw_response) : nil
  end


  def get_ntp_info()
    ######
    # GetNtpInfo enables you to return the current network time protocol (NTP) configuration information.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetNtpInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNtpInfoResult.new(raw_response) : nil
  end


  def get_snmp_acl()
    ######
    # GetSnmpACL enables you to return the current SNMP access permissions on the cluster nodes.######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetSnmpACL'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpACLResult.new(raw_response) : nil
  end


  def get_snmp_info()
    ######
    # GetSnmpInfo enables you to retrieve the current simple network management protocol (SNMP) configuration information.
    # Note: GetSnmpInfo is available for Element OS 8 and prior releases. It is deprecated for versions later than Element OS 8.
    # NetApp recommends that you migrate to the GetSnmpState and SetSnmpACL methods. See details in the Element API Reference Guide
    # for their descriptions and usage.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetSnmpInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpInfoResult.new(raw_response) : nil
  end


  def get_snmp_state()
    ######
    # You can use GetSnmpState to return the current state of the SNMP feature.######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetSnmpState'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpStateResult.new(raw_response) : nil
  end


  def get_snmp_trap_info()
    ######
    # You can use GetSnmpTrapInfo to return current SNMP trap configuration information.######

    check_connection(5, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetSnmpTrapInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSnmpTrapInfoResult.new(raw_response) : nil
  end


  def get_system_status()
    ######
    # GetSystemStatus enables you to return whether a reboot ir required or not.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetSystemStatus'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetSystemStatusResult.new(raw_response) : nil
  end


  def list_cluster_admins()
    ######
    # ListClusterAdmins returns the list of all cluster administrators for the cluster. There can be several cluster administrator accounts with different levels of permissions. There can be only one primary cluster administrator in the system. The primary Cluster Admin is the administrator that was created when the cluster was created. You can also create LDAP administrators when setting up an LDAP system on the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListClusterAdmins'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterAdminsResult.new(raw_response) : nil
  end


  def list_cluster_faults(best_practices = nil, fault_types = nil)
    ######
    # ListClusterFaults enables you to retrieve information about any faults detected on the cluster. With this method, you can retrieve both current faults as well as faults that have been resolved. The system caches faults every 30 seconds.
    # param: bool bestPractices:  Specifies whether to include faults triggered by suboptimal system configuration. Possible values are: true false 

    # param: str faultTypes:  Determines the types of faults returned. Possible values are: current: List active, unresolved faults. resolved: List faults that were previously detected and resolved. all: (Default) List both current and resolved faults. You can see the fault status in the resolved field of the Cluster Fault object. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListClusterFaults'
    }

    if best_practices != nil
      check_parameter(best_practices, 'best_practices', bool)
      payload['params']['bestPractices'] = best_practices
    end
    if fault_types != nil
      check_parameter(fault_types, 'fault_types', str)
      payload['params']['faultTypes'] = fault_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterFaultsResult.new(raw_response) : nil
  end

  def list_cluster_faults_with_object(r)
    if r.best_practices == nil
      raise "Before you can run this command, you need to set the param, bestPractices in the request object."
    end
    if r.fault_types == nil
      raise "Before you can run this command, you need to set the param, faultTypes in the request object."
    end
    list_cluster_faults(r.best_practices, r.fault_types)
  end

  def list_events(max_events = nil, start_event_id = nil, end_event_id = nil)
    ######
    # ListEvents returns events detected on the cluster, sorted from oldest to newest.
    # param: Fixnum maxEvents:  Specifies the maximum number of events to return. 

    # param: Fixnum startEventID:  Identifies the beginning of a range of events to return. 

    # param: Fixnum endEventID:  Identifies the end of a range of events to return. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListEvents'
    }

    if max_events != nil
      check_parameter(max_events, 'max_events', Fixnum)
      payload['params']['maxEvents'] = max_events
    end
    if start_event_id != nil
      check_parameter(start_event_id, 'start_event_id', Fixnum)
      payload['params']['startEventID'] = start_event_id
    end
    if end_event_id != nil
      check_parameter(end_event_id, 'end_event_id', Fixnum)
      payload['params']['endEventID'] = end_event_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListEventsResult.new(raw_response) : nil
  end

  def list_events_with_object(r)
    if r.max_events == nil
      raise "Before you can run this command, you need to set the param, maxEvents in the request object."
    end
    if r.start_event_id == nil
      raise "Before you can run this command, you need to set the param, startEventID in the request object."
    end
    if r.end_event_id == nil
      raise "Before you can run this command, you need to set the param, endEventID in the request object."
    end
    list_events(r.max_events, r.start_event_id, r.end_event_id)
  end

  def list_sync_jobs()
    ######
    # ListSyncJobs enables you to return information about synchronization jobs that are running on a SolidFire cluster. The type of
    # synchronization jobs that are returned with this method are slice, clone, and remote.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListSyncJobs'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListSyncJobsResult.new(raw_response) : nil
  end


  def modify_cluster_admin(cluster_admin_id, password = nil, access = nil, attributes = nil)
    ######
    # You can use ModifyClusterAdmin to change the settings for a cluster admin or LDAP cluster admin. You cannot change access for the administrator cluster admin account.
    # param: Fixnum clusterAdminID: [required] ClusterAdminID for the cluster admin or LDAP cluster admin to modify. 

    # param: str password:  Password used to authenticate this cluster admin. 

    # param: str access:  Controls which methods this cluster admin can use. For more details, see Access Control in the Element API Reference Guide. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(cluster_admin_id, 'cluster_admin_id', 'Fixnum')

    payload = {
        'params' => {
            'clusterAdminID' => cluster_admin_id
        },
        'method' => 'ModifyClusterAdmin'
    }

    if password != nil
      check_parameter(password, 'password', str)
      payload['params']['password'] = password
    end
    if access != nil
      check_parameter(access, 'access', str)
      payload['params']['access'] = access
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyClusterAdminResult.new(raw_response) : nil
  end

  def modify_cluster_admin_with_object(r)
    if r.cluster_admin_id == nil
      raise "Before you can run this command, you need to set the param, clusterAdminID in the request object."
    end
    if r.password == nil
      raise "Before you can run this command, you need to set the param, password in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_cluster_admin(r.cluster_admin_id, r.password, r.access, r.attributes)
  end

  def modify_cluster_full_threshold(stage2_aware_threshold = nil, stage3_block_threshold_percent = nil, max_metadata_over_provision_factor = nil)
    ######
    # You can use ModifyClusterFullThreshold to change the level at which the system generates an event when the storage cluster approaches a certain capacity utilization. You can use the threshold setting to indicate the acceptable amount of utilized block storage before the system generates a warning. For example, if you want to be alerted when the system reaches 3% below the "Error" level block storage utilization, enter a value of "3" for the stage3BlockThresholdPercent parameter. If this level is reached, the system sends an alert to the Event Log in the Cluster Management Console.
    # param: Fixnum stage2AwareThreshold:  The number of nodes of capacity remaining in the cluster before the system triggers a capacity notification. 

    # param: Fixnum stage3BlockThresholdPercent:  The percentage of block storage utilization below the "Error" threshold that causes the system to trigger a cluster "Warning" alert. 

    # param: Fixnum maxMetadataOverProvisionFactor:  A value representative of the number of times metadata space can be overprovisioned relative to the amount of space available. For example, if there was enough metadata space to store 100 TiB of volumes and this number was set to 5, then 500 TiB worth of volumes can be created. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ModifyClusterFullThreshold'
    }

    if stage2_aware_threshold != nil
      check_parameter(stage2_aware_threshold, 'stage2_aware_threshold', Fixnum)
      payload['params']['stage2AwareThreshold'] = stage2_aware_threshold
    end
    if stage3_block_threshold_percent != nil
      check_parameter(stage3_block_threshold_percent, 'stage3_block_threshold_percent', Fixnum)
      payload['params']['stage3BlockThresholdPercent'] = stage3_block_threshold_percent
    end
    if max_metadata_over_provision_factor != nil
      check_parameter(max_metadata_over_provision_factor, 'max_metadata_over_provision_factor', Fixnum)
      payload['params']['maxMetadataOverProvisionFactor'] = max_metadata_over_provision_factor
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyClusterFullThresholdResult.new(raw_response) : nil
  end

  def modify_cluster_full_threshold_with_object(r)
    if r.stage2_aware_threshold == nil
      raise "Before you can run this command, you need to set the param, stage2AwareThreshold in the request object."
    end
    if r.stage3_block_threshold_percent == nil
      raise "Before you can run this command, you need to set the param, stage3BlockThresholdPercent in the request object."
    end
    if r.max_metadata_over_provision_factor == nil
      raise "Before you can run this command, you need to set the param, maxMetadataOverProvisionFactor in the request object."
    end
    modify_cluster_full_threshold(r.stage2_aware_threshold, r.stage3_block_threshold_percent, r.max_metadata_over_provision_factor)
  end

  def remove_cluster_admin(cluster_admin_id)
    ######
    # You can use RemoveClusterAdmin to remove a Cluster Admin. You cannot remove the administrator cluster admin account.
    # param: Fixnum clusterAdminID: [required] ClusterAdminID for the cluster admin to remove. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(cluster_admin_id, 'cluster_admin_id', 'Fixnum')

    payload = {
        'params' => {
            'clusterAdminID' => cluster_admin_id
        },
        'method' => 'RemoveClusterAdmin'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveClusterAdminResult.new(raw_response) : nil
  end

  def remove_cluster_admin_with_object(r)
    if r.cluster_admin_id == nil
      raise "Before you can run this command, you need to set the param, clusterAdminID in the request object."
    end
    remove_cluster_admin(r.cluster_admin_id)
  end

  def set_cluster_config(cluster)
    ######
    # The SetClusterConfig API method enables you to set the configuration this node uses to communicate with the cluster it is associated with. To see the states in which these objects can be modified, see Cluster Object Attributes. To display the current cluster
    # interface settings for a node, run the GetClusterConfig API method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: ClusterConfig cluster: [required] Objects that are changed for the cluster interface settings. 
    ######

    check_connection(5, 'Node')

    check_parameter(cluster, 'cluster', 'ClusterConfig')

    payload = {
        'params' => {
            'cluster' => cluster
        },
        'method' => 'SetClusterConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetClusterConfigResult.new(raw_response) : nil
  end

  def set_cluster_config_with_object(r)
    if r.cluster == nil
      raise "Before you can run this command, you need to set the param, cluster in the request object."
    end
    set_cluster_config(r.cluster)
  end

  def set_ntp_info(servers, broadcastclient = nil)
    ######
    # SetNtpInfo enables you to configure NTP on cluster nodes. The values you set with this interface apply to all nodes in the cluster. If an NTP broadcast server periodically broadcasts time information on your network, you can optionally configure nodes as broadcast clients.
    # Note: NetApp recommends using NTP servers that are internal to your network, rather than the installation defaults.
    # param: str servers: [required] List of NTP servers to add to each nodes NTP configuration. 

    # param: bool broadcastclient:  Enables every node in the cluster as a broadcast client. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(servers, 'servers', String)

    payload = {
        'params' => {
            'servers' => servers
        },
        'method' => 'SetNtpInfo'
    }

    if broadcastclient != nil
      check_parameter(broadcastclient, 'broadcastclient', bool)
      payload['params']['broadcastclient'] = broadcastclient
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetNtpInfoResult.new(raw_response) : nil
  end

  def set_ntp_info_with_object(r)
    if r.servers == nil
      raise "Before you can run this command, you need to set the param, servers in the request object."
    end
    if r.broadcastclient == nil
      raise "Before you can run this command, you need to set the param, broadcastclient in the request object."
    end
    set_ntp_info(r.servers, r.broadcastclient)
  end

  def set_snmp_acl(networks, usm_users)
    ######
    # SetSnmpACL enables you to configure SNMP access permissions on the cluster nodes. The values you set with this interface apply to all
    # nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpACL. Also note
    # that the values set with this interface replace all network or usmUsers values set with the older SetSnmpInfo.
    # param: SnmpNetwork networks: [required] List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See SNMP Network Object for possible "networks" values. This parameter is required if SNMP v3 is disabled. 

    # param: SnmpV3UsmUser usmUsers: [required] List of users and the type of access they have to the SNMP servers running on the cluster nodes. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(networks, 'networks', 'SnmpNetwork')

    check_parameter(usm_users, 'usm_users', 'SnmpV3UsmUser')

    payload = {
        'params' => {
            'networks' => networks,
            'usmUsers' => usm_users
        },
        'method' => 'SetSnmpACL'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpACLResult.new(raw_response) : nil
  end

  def set_snmp_acl_with_object(r)
    if r.networks == nil
      raise "Before you can run this command, you need to set the param, networks in the request object."
    end
    if r.usm_users == nil
      raise "Before you can run this command, you need to set the param, usmUsers in the request object."
    end
    set_snmp_acl(r.networks, r.usm_users)
  end

  def set_snmp_info(networks = nil, enabled = nil, snmp_v3_enabled = nil, usm_users = nil)
    ######
    # SetSnmpInfo enables you to configure SNMP version 2 and version 3 on cluster nodes. The values you set with this interface apply to
    # all nodes in the cluster, and the values that are passed replace, in whole, all values set in any previous call to SetSnmpInfo.
    # Note: SetSnmpInfo is deprecated. Use the EnableSnmp and SetSnmpACL methods instead.
    # param: SnmpNetwork networks:  List of networks and what type of access they have to the SNMP servers running on the cluster nodes. See the SNMP Network Object for possible "networks" values. This parameter is required only for SNMP v2. 

    # param: bool enabled:  If set to true, SNMP is enabled on each node in the cluster. 

    # param: bool snmpV3Enabled:  If set to true, SNMP v3 is enabled on each node in the cluster. 

    # param: SnmpV3UsmUser usmUsers:  If SNMP v3 is enabled, this value must be passed in place of the networks parameter. This parameter is required only for SNMP v3. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'SetSnmpInfo'
    }

    if networks != nil
      check_parameter(networks, 'networks', SnmpNetwork)
      payload['params']['networks'] = networks
    end
    if enabled != nil
      check_parameter(enabled, 'enabled', bool)
      payload['params']['enabled'] = enabled
    end
    if snmp_v3_enabled != nil
      check_parameter(snmp_v3_enabled, 'snmp_v3_enabled', bool)
      payload['params']['snmpV3Enabled'] = snmp_v3_enabled
    end
    if usm_users != nil
      check_parameter(usm_users, 'usm_users', SnmpV3UsmUser)
      payload['params']['usmUsers'] = usm_users
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpInfoResult.new(raw_response) : nil
  end

  def set_snmp_info_with_object(r)
    if r.networks == nil
      raise "Before you can run this command, you need to set the param, networks in the request object."
    end
    if r.enabled == nil
      raise "Before you can run this command, you need to set the param, enabled in the request object."
    end
    if r.snmp_v3_enabled == nil
      raise "Before you can run this command, you need to set the param, snmpV3Enabled in the request object."
    end
    if r.usm_users == nil
      raise "Before you can run this command, you need to set the param, usmUsers in the request object."
    end
    set_snmp_info(r.networks, r.enabled, r.snmp_v3_enabled, r.usm_users)
  end

  def set_snmp_trap_info(trap_recipients, cluster_fault_traps_enabled, cluster_fault_resolved_traps_enabled, cluster_event_traps_enabled)
    ######
    # You can use SetSnmpTrapInfo to enable and disable the generation of cluster SNMP notifications (traps) and to specify the set of network host computers that receive the notifications. The values you pass with each SetSnmpTrapInfo method call replace all values set in any previous call to SetSnmpTrapInfo.
    # param: SnmpTrapRecipient trapRecipients: [required] List of hosts that are to receive the traps generated by the Cluster Master. At least one object is required if any one of the trap types is enabled. 

    # param: bool clusterFaultTrapsEnabled: [required] If the value is set to true, a corresponding solidFireClusterFaultNotification is sent to the configured list of trap recipients when a cluster fault is logged. The default value is false. 

    # param: bool clusterFaultResolvedTrapsEnabled: [required] If the value is set to true, a corresponding solidFireClusterFaultResolvedNotification is sent to the configured list of trap recipients when a cluster fault is resolved. The default value is false. 

    # param: bool clusterEventTrapsEnabled: [required] If the value is set to true, a corresponding solidFireClusterEventNotification is sent to the configured list of trap recipients when a cluster event is logged. The default value is false. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(trap_recipients, 'trap_recipients', 'SnmpTrapRecipient')

    check_parameter(cluster_fault_traps_enabled, 'cluster_fault_traps_enabled', 'bool')

    check_parameter(cluster_fault_resolved_traps_enabled, 'cluster_fault_resolved_traps_enabled', 'bool')

    check_parameter(cluster_event_traps_enabled, 'cluster_event_traps_enabled', 'bool')

    payload = {
        'params' => {
            'trapRecipients' => trap_recipients,
            'clusterFaultTrapsEnabled' => cluster_fault_traps_enabled,
            'clusterFaultResolvedTrapsEnabled' => cluster_fault_resolved_traps_enabled,
            'clusterEventTrapsEnabled' => cluster_event_traps_enabled
        },
        'method' => 'SetSnmpTrapInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetSnmpTrapInfoResult.new(raw_response) : nil
  end

  def set_snmp_trap_info_with_object(r)
    if r.trap_recipients == nil
      raise "Before you can run this command, you need to set the param, trapRecipients in the request object."
    end
    if r.cluster_fault_traps_enabled == nil
      raise "Before you can run this command, you need to set the param, clusterFaultTrapsEnabled in the request object."
    end
    if r.cluster_fault_resolved_traps_enabled == nil
      raise "Before you can run this command, you need to set the param, clusterFaultResolvedTrapsEnabled in the request object."
    end
    if r.cluster_event_traps_enabled == nil
      raise "Before you can run this command, you need to set the param, clusterEventTrapsEnabled in the request object."
    end
    set_snmp_trap_info(r.trap_recipients, r.cluster_fault_traps_enabled, r.cluster_fault_resolved_traps_enabled, r.cluster_event_traps_enabled)
  end

  def snmp_send_test_traps()
    ######
    # SnmpSendTestTraps enables you to test SNMP functionality for a cluster. This method instructs the cluster to send test SNMP traps to the currently configured SNMP manager.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'SnmpSendTestTraps'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SnmpSendTestTrapsResult.new(raw_response) : nil
  end


  def add_drives(drives, force_during_upgrade = nil)
    ######
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
    # param: NewDrive drives: [required] Returns information about each drive to be added to the cluster. Possible values are: driveID: The ID of the drive to add. (Integer) type: (Optional) The type of drive to add. Valid values are "slice" or "block". If omitted, the system assigns the correct type. (String) 

    # param: bool forceDuringUpgrade:  Allows the user to force the addition of drives during an upgrade. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(drives, 'drives', 'NewDrive')

    payload = {
        'params' => {
            'drives' => drives
        },
        'method' => 'AddDrives'
    }

    if force_during_upgrade != nil
      check_parameter(force_during_upgrade, 'force_during_upgrade', bool)
      payload['params']['forceDuringUpgrade'] = force_during_upgrade
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddDrivesResult.new(raw_response) : nil
  end

  def add_drives_with_object(r)
    if r.drives == nil
      raise "Before you can run this command, you need to set the param, drives in the request object."
    end
    if r.force_during_upgrade == nil
      raise "Before you can run this command, you need to set the param, forceDuringUpgrade in the request object."
    end
    add_drives(r.drives, r.force_during_upgrade)
  end

  def get_drive_config()
    ######
    # GetDriveConfig enables you to display drive information for expected slice and block drive counts as well as the number of slices
    # and block drives that are currently connected to the node.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(2, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetDriveConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetDriveConfigResult.new(raw_response) : nil
  end


  def get_drive_hardware_info(drive_id)
    ######
    # GetDriveHardwareInfo returns all the hardware information for the given drive. This generally includes details about manufacturers, vendors, versions, and
    # other associated hardware identification information.
    # param: Fixnum driveID: [required] DriveID for the drive information requested. You can get DriveIDs by using the ListDrives method. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(drive_id, 'drive_id', 'Fixnum')

    payload = {
        'params' => {
            'driveID' => drive_id
        },
        'method' => 'GetDriveHardwareInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetDriveHardwareInfoResult.new(raw_response) : nil
  end

  def get_drive_hardware_info_with_object(r)
    if r.drive_id == nil
      raise "Before you can run this command, you need to set the param, driveID in the request object."
    end
    get_drive_hardware_info(r.drive_id)
  end

  def get_drive_stats(drive_id)
    ######
    # GetDriveStats returns high-level activity measurements for a single drive. Values are cumulative from the addition of the drive to the
    # cluster. Some values are specific to block drives. You might not obtain statistical data for both block and metadata drives when you
    # run this method. 
    # param: Fixnum driveID: [required] Specifies the drive for which statistics are gathered. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(drive_id, 'drive_id', 'Fixnum')

    payload = {
        'params' => {
            'driveID' => drive_id
        },
        'method' => 'GetDriveStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetDriveStatsResult.new(raw_response) : nil
  end

  def get_drive_stats_with_object(r)
    if r.drive_id == nil
      raise "Before you can run this command, you need to set the param, driveID in the request object."
    end
    get_drive_stats(r.drive_id)
  end

  def list_drive_hardware(force)
    ######
    # ListDriveHardware returns all the drives connected to a node. Use this method on individual nodes to return drive hardware
    # information or use this method on the cluster master node MVIP to see information for all the drives on all nodes.
    # Note: The "securitySupported": true line of the method response does not imply that the drives are capable of
    # encryption; only that the security status can be queried. If you have a node type with a model number ending in "-NE",
    # commands to enable security features on these drives will fail. See the EnableEncryptionAtRest method for more information.
    # param: bool force: [required] To run this command, the force parameter must be set to true. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'force' => force
        },
        'method' => 'ListDriveHardware'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDriveHardwareResult.new(raw_response) : nil
  end

  def list_drive_hardware_with_object(r)
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    list_drive_hardware(r.force)
  end

  def list_drives()
    ######
    # ListDrives enables you to retrieve the list of the drives that exist in the cluster's active nodes. This method returns drives that have
    # been added as volume metadata or block drives as well as drives that have not been added and are available.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListDrives'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDrivesResult.new(raw_response) : nil
  end


  def remove_drives(drives, force_during_upgrade = nil)
    ######
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
    # param: Fixnum drives: [required] List of driveIDs to remove from the cluster. 

    # param: bool forceDuringUpgrade:  If you want to remove a drive during upgrade, this must be set to true. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(drives, 'drives', 'Fixnum')

    payload = {
        'params' => {
            'drives' => drives
        },
        'method' => 'RemoveDrives'
    }

    if force_during_upgrade != nil
      check_parameter(force_during_upgrade, 'force_during_upgrade', bool)
      payload['params']['forceDuringUpgrade'] = force_during_upgrade
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AsyncHandleResult.new(raw_response) : nil
  end

  def remove_drives_with_object(r)
    if r.drives == nil
      raise "Before you can run this command, you need to set the param, drives in the request object."
    end
    if r.force_during_upgrade == nil
      raise "Before you can run this command, you need to set the param, forceDuringUpgrade in the request object."
    end
    remove_drives(r.drives, r.force_during_upgrade)
  end

  def reset_drives(drives, force)
    ######
    # ResetDrives enables you to proactively initialize drives and remove all data currently residing on a drive. The drive can then be reused
    # in an existing node or used in an upgraded node. This method requires the force parameter to be included in the method call.
    # param: str drives: [required] List of device names (not driveIDs) to reset. 

    # param: bool force: [required] Required parameter to successfully reset a drive. 
    ######

    check_connection(6, 'Node')

    check_parameter(drives, 'drives', String)

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'drives' => drives,
            'force' => force
        },
        'method' => 'ResetDrives'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ResetDrivesResult.new(raw_response) : nil
  end

  def reset_drives_with_object(r)
    if r.drives == nil
      raise "Before you can run this command, you need to set the param, drives in the request object."
    end
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    reset_drives(r.drives, r.force)
  end

  def secure_erase_drives(drives)
    ######
    # SecureEraseDrives enables you to remove any residual data from drives that have a status of "available." You might want to use this method when replacing a drive nearing the end of its service life that contained sensitive data. This method uses a Security Erase Unit command to write a predetermined pattern to the drive and resets the encryption key on the drive. This asynchronous method might take up to two minutes to complete. You can use GetAsyncResult to check on the status of the secure erase operation.
    # You can use the ListDrives method to obtain the driveIDs for the drives you want to secure erase.
    # param: Fixnum drives: [required] List of driveIDs to be secure erased. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(drives, 'drives', 'Fixnum')

    payload = {
        'params' => {
            'drives' => drives
        },
        'method' => 'SecureEraseDrives'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AsyncHandleResult.new(raw_response) : nil
  end

  def secure_erase_drives_with_object(r)
    if r.drives == nil
      raise "Before you can run this command, you need to set the param, drives in the request object."
    end
    secure_erase_drives(r.drives)
  end

  def test_drives(minutes = nil)
    ######
    # You can use the TestDrives API method to run a hardware validation on all drives on the node. This method detects hardware
    # failures on the drives (if present) and reports them in the results of the validation tests.
    # You can only use the TestDrives method on nodes that are not "active" in a cluster.
    # Note: This test takes approximately 10 minutes.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: Fixnum minutes:  Specifies the number of minutes to run the test. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'TestDrives'
    }

    if minutes != nil
      check_parameter(minutes, 'minutes', Fixnum)
      payload['params']['minutes'] = minutes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestDrivesResult.new(raw_response) : nil
  end

  def test_drives_with_object(r)
    if r.minutes == nil
      raise "Before you can run this command, you need to set the param, minutes in the request object."
    end
    test_drives(r.minutes)
  end

  def get_cluster_hardware_info(type = nil)
    ######
    # You can use the GetClusterHardwareInfo method to retrieve the hardware status and information for all Fibre Channel nodes, iSCSI
    # nodes and drives in the cluster. This generally includes details about manufacturers, vendors, versions, and other associated hardware
    # identification information.
    # param: str type:  Includes only a certain type of hardware information in the response. Possible values are: drives: List only drive information in the response. nodes: List only node information in the response. all: Include both drive and node information in the response. If this parameter is omitted, a type of "all" is assumed. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetClusterHardwareInfo'
    }

    if type != nil
      check_parameter(type, 'type', str)
      payload['params']['type'] = type
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetClusterHardwareInfoResult.new(raw_response) : nil
  end

  def get_cluster_hardware_info_with_object(r)
    if r.type == nil
      raise "Before you can run this command, you need to set the param, type in the request object."
    end
    get_cluster_hardware_info(r.type)
  end

  def get_hardware_config()
    ######
    # GetHardwareConfig enables you to display the hardware configuration information for a node.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetHardwareConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetHardwareConfigResult.new(raw_response) : nil
  end


  def get_node_hardware_info(node_id)
    ######
    # GetNodeHardwareInfo enables you to return all the hardware information and status for the node specified. This generally includes details about
    # manufacturers, vendors, versions, and other associated hardware identification information.
    # param: Fixnum nodeID: [required] The ID of the node for which hardware information is being requested. Information about a Fibre Channel node is returned if a Fibre Channel node is specified. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(node_id, 'node_id', 'Fixnum')

    payload = {
        'params' => {
            'nodeID' => node_id
        },
        'method' => 'GetNodeHardwareInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNodeHardwareInfoResult.new(raw_response) : nil
  end

  def get_node_hardware_info_with_object(r)
    if r.node_id == nil
      raise "Before you can run this command, you need to set the param, nodeID in the request object."
    end
    get_node_hardware_info(r.node_id)
  end

  def get_nvram_info(force = nil)
    ######
    # GetNvramInfo enables you to retrieve information from each node about the NVRAM card.
    # param: bool force:  Required parameter to successfully run on all nodes in the cluster. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetNvramInfo'
    }

    if force != nil
      check_parameter(force, 'force', bool)
      payload['params']['force'] = force
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNvramInfoResult.new(raw_response) : nil
  end

  def get_nvram_info_with_object(r)
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    get_nvram_info(r.force)
  end

  def create_initiators(initiators)
    ######
    # CreateInitiators enables you to create multiple new initiator IQNs or World Wide Port Names (WWPNs) and optionally assign them
    # aliases and attributes. When you use CreateInitiators to create new initiators, you can also add them to volume access groups.
    # If CreateInitiators fails to create one of the initiators provided in the parameter, the method returns an error and does not create
    # any initiators (no partial completion is possible).
    # param: CreateInitiator initiators: [required] A list of objects containing characteristics of each new initiator. Values are: name: (Required) The name of the initiator (IQN or WWPN) to create. (String) alias: (Optional) The friendly name to assign to this initiator. (String) attributes: (Optional) A set of JSON attributes to assign to this initiator. (JSON Object) volumeAccessGroupID: (Optional) The ID of the volume access group into to which this newly created initiator will be added. (Integer) 
    ######

    check_connection(9, 'Cluster')

    check_parameter(initiators, 'initiators', 'CreateInitiator')

    payload = {
        'params' => {
            'initiators' => initiators
        },
        'method' => 'CreateInitiators'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateInitiatorsResult.new(raw_response) : nil
  end

  def create_initiators_with_object(r)
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    create_initiators(r.initiators)
  end

  def delete_initiators(initiators)
    ######
    # DeleteInitiators enables you to delete one or more initiators from the system (and from any associated volumes or volume access
    # groups).
    # If DeleteInitiators fails to delete one of the initiators provided in the parameter, the system returns an error and does not delete any
    # initiators (no partial completion is possible).
    # param: Fixnum initiators: [required] An array of IDs of initiators to delete. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(initiators, 'initiators', 'Fixnum')

    payload = {
        'params' => {
            'initiators' => initiators
        },
        'method' => 'DeleteInitiators'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteInitiatorsResult.new(raw_response) : nil
  end

  def delete_initiators_with_object(r)
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    delete_initiators(r.initiators)
  end

  def list_initiators(start_initiator_id = nil, limit = nil, initiators = nil)
    ######
    # ListInitiators enables you to list initiator IQNs or World Wide Port Names (WWPNs).
    # param: Fixnum startInitiatorID:  The initiator ID at which to begin the listing. You can supply this parameter or the "initiators" parameter, but not both. 

    # param: Fixnum limit:  The maximum number of initiator objects to return. 

    # param: Fixnum initiators:  A list of initiator IDs to retrieve. You can provide a value for this parameter or the "startInitiatorID" parameter, but not both. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListInitiators'
    }

    if start_initiator_id != nil
      check_parameter(start_initiator_id, 'start_initiator_id', Fixnum)
      payload['params']['startInitiatorID'] = start_initiator_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if initiators != nil
      check_parameter(initiators, 'initiators', Fixnum)
      payload['params']['initiators'] = initiators
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListInitiatorsResult.new(raw_response) : nil
  end

  def list_initiators_with_object(r)
    if r.start_initiator_id == nil
      raise "Before you can run this command, you need to set the param, startInitiatorID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    list_initiators(r.start_initiator_id, r.limit, r.initiators)
  end

  def modify_initiators(initiators)
    ######
    # ModifyInitiators enables you to change the attributes of one or more existing initiators. You cannot change the name of an existing
    # initiator. If you need to change the name of an initiator, delete it first with DeleteInitiators and create a new one with
    # CreateInitiators.
    # If ModifyInitiators fails to change one of the initiators provided in the parameter, the method returns an error and does not modify
    # any initiators (no partial completion is possible).
    # param: ModifyInitiator initiators: [required] A list of objects containing characteristics of each initiator to modify. Values are: initiatorID: (Required) The ID of the initiator to modify. (Integer) alias: (Optional) A new friendly name to assign to the initiator. (String) attributes: (Optional) A new set of JSON attributes to assign to the initiator. (JSON Object) volumeAccessGroupID: (Optional) The ID of the volume access group into to which the initiator should be added. If the initiator was previously in a different volume access group, it is removed from the old volume access group. If this key is present but null, the initiator is removed from its current volume access group, but not placed in any new volume access group. (Integer) 
    ######

    check_connection(9, 'Cluster')

    check_parameter(initiators, 'initiators', 'ModifyInitiator')

    payload = {
        'params' => {
            'initiators' => initiators
        },
        'method' => 'ModifyInitiators'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyInitiatorsResult.new(raw_response) : nil
  end

  def modify_initiators_with_object(r)
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    modify_initiators(r.initiators)
  end

  def add_ldap_cluster_admin(username, access, accept_eula = nil, attributes = nil)
    ######
    # AddLdapClusterAdmin enables you to add a new LDAP cluster administrator user. An LDAP cluster administrator can manage the
    # cluster via the API and management tools. LDAP cluster admin accounts are completely separate and unrelated to standard tenant
    # accounts.
    # You can also use this method to add an LDAP group that has been defined in Active Directory. The access level that is given to the group is passed to the individual users in the LDAP group.
    # param: str username: [required] The distinguished user name for the new LDAP cluster admin. 

    # param: str access: [required] Controls which methods this Cluster Admin can use. For more details on the levels of access, see the Access Control appendix in the SolidFire API Reference. 

    # param: bool acceptEula:  Accept the End User License Agreement. Set to true to add a cluster administrator account to the system. If omitted or set to false, the method call fails. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(username, 'username', String)

    check_parameter(access, 'access', String)

    payload = {
        'params' => {
            'username' => username,
            'access' => access
        },
        'method' => 'AddLdapClusterAdmin'
    }

    if accept_eula != nil
      check_parameter(accept_eula, 'accept_eula', bool)
      payload['params']['acceptEula'] = accept_eula
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddLdapClusterAdminResult.new(raw_response) : nil
  end

  def add_ldap_cluster_admin_with_object(r)
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.accept_eula == nil
      raise "Before you can run this command, you need to set the param, acceptEula in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    add_ldap_cluster_admin(r.username, r.access, r.accept_eula, r.attributes)
  end

  def disable_ldap_authentication()
    ######
    # The DisableLdapAuthentication method enables you to disable LDAP authentication and remove all LDAP configuration settings. This method does not remove any configured cluster admin accounts (user or group). However, those cluster admin accounts will no longer be able to log in.######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'DisableLdapAuthentication'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DisableLdapAuthenticationResult.new(raw_response) : nil
  end


  def enable_ldap_authentication(server_uris, auth_type = nil, group_search_base_dn = nil, group_search_custom_filter = nil, group_search_type = nil, search_bind_dn = nil, search_bind_password = nil, user_dntemplate = nil, user_search_base_dn = nil, user_search_filter = nil)
    ######
    # The EnableLdapAuthentication method enables you to configure an LDAP directory connection to use for LDAP authentication to a cluster. Users that are members of the LDAP directory can then log in to the storage system using their LDAP credentials.
    # param: str authType:  Identifies which user authentication method to use. Must be one of the following: DirectBind SearchAndBind 

    # param: str groupSearchBaseDN:  The base DN of the tree to start the group search (will do a subtree search from here). 

    # param: str groupSearchCustomFilter:  For use with the CustomFilter search type, an LDAP filter to use to return the DNs of a users groups. The string can have placeholder text of %USERNAME% and %USERDN% to be replaced with their username and full userDN as needed. 

    # param: str groupSearchType:  Controls the default group search filter used, and must be one of the following: NoGroups: No group support. ActiveDirectory: Nested membership of all of a users AD groups. MemberDN: MemberDN style groups (single level). 

    # param: str searchBindDN:  A fully qualified DN to log in with to perform an LDAP search for the user (needs read access to the LDAP directory). 

    # param: str searchBindPassword:  The password for the searchBindDN account used for searching. 

    # param: str serverURIs: [required] A comma-separated list of LDAP server URIs (examples: "ldap://1.2.3.4" and ldaps://1.2.3.4:123") 

    # param: str userDNTemplate:  A string that is used to form a fully qualified user DN. The string should have the placeholder text %USERNAME%, which is replaced with the username of the authenticating user. 

    # param: str userSearchBaseDN:  The base DN of the tree to start the search (will do a subtree search from here). 

    # param: str userSearchFilter:  The LDAP filter to use. The string should have the placeholder text %USERNAME% which is replaced with the username of the authenticating user. Example: (&(objectClass=person)(sAMAccountName=%USERNAME%)) will use the sAMAccountName field in Active Directory to match the username entered at cluster login. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(server_uris, 'server_uris', String)

    payload = {
        'params' => {
            'serverURIs' => server_uris
        },
        'method' => 'EnableLdapAuthentication'
    }

    if auth_type != nil
      check_parameter(auth_type, 'auth_type', str)
      payload['params']['authType'] = auth_type
    end
    if group_search_base_dn != nil
      check_parameter(group_search_base_dn, 'group_search_base_dn', str)
      payload['params']['groupSearchBaseDN'] = group_search_base_dn
    end
    if group_search_custom_filter != nil
      check_parameter(group_search_custom_filter, 'group_search_custom_filter', str)
      payload['params']['groupSearchCustomFilter'] = group_search_custom_filter
    end
    if group_search_type != nil
      check_parameter(group_search_type, 'group_search_type', str)
      payload['params']['groupSearchType'] = group_search_type
    end
    if search_bind_dn != nil
      check_parameter(search_bind_dn, 'search_bind_dn', str)
      payload['params']['searchBindDN'] = search_bind_dn
    end
    if search_bind_password != nil
      check_parameter(search_bind_password, 'search_bind_password', str)
      payload['params']['searchBindPassword'] = search_bind_password
    end
    if user_dntemplate != nil
      check_parameter(user_dntemplate, 'user_dntemplate', str)
      payload['params']['userDNTemplate'] = user_dntemplate
    end
    if user_search_base_dn != nil
      check_parameter(user_search_base_dn, 'user_search_base_dn', str)
      payload['params']['userSearchBaseDN'] = user_search_base_dn
    end
    if user_search_filter != nil
      check_parameter(user_search_filter, 'user_search_filter', str)
      payload['params']['userSearchFilter'] = user_search_filter
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableLdapAuthenticationResult.new(raw_response) : nil
  end

  def enable_ldap_authentication_with_object(r)
    if r.auth_type == nil
      raise "Before you can run this command, you need to set the param, authType in the request object."
    end
    if r.group_search_base_dn == nil
      raise "Before you can run this command, you need to set the param, groupSearchBaseDN in the request object."
    end
    if r.group_search_custom_filter == nil
      raise "Before you can run this command, you need to set the param, groupSearchCustomFilter in the request object."
    end
    if r.group_search_type == nil
      raise "Before you can run this command, you need to set the param, groupSearchType in the request object."
    end
    if r.search_bind_dn == nil
      raise "Before you can run this command, you need to set the param, searchBindDN in the request object."
    end
    if r.search_bind_password == nil
      raise "Before you can run this command, you need to set the param, searchBindPassword in the request object."
    end
    if r.server_uris == nil
      raise "Before you can run this command, you need to set the param, serverURIs in the request object."
    end
    if r.user_dntemplate == nil
      raise "Before you can run this command, you need to set the param, userDNTemplate in the request object."
    end
    if r.user_search_base_dn == nil
      raise "Before you can run this command, you need to set the param, userSearchBaseDN in the request object."
    end
    if r.user_search_filter == nil
      raise "Before you can run this command, you need to set the param, userSearchFilter in the request object."
    end
    enable_ldap_authentication(r.server_uris, r.auth_type, r.group_search_base_dn, r.group_search_custom_filter, r.group_search_type, r.search_bind_dn, r.search_bind_password, r.user_dntemplate, r.user_search_base_dn, r.user_search_filter)
  end

  def get_ldap_configuration()
    ######
    # The GetLdapConfiguration method enables you to get the currently active LDAP configuration on the cluster.######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetLdapConfiguration'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetLdapConfigurationResult.new(raw_response) : nil
  end


  def test_ldap_authentication(username, password, ldap_configuration = nil)
    ######
    # The TestLdapAuthentication method enables you to validate the currently enabled LDAP authentication settings. If the configuration is
    # correct, the API call returns the group membership of the tested user.
    # param: str username: [required] The username to be tested. 

    # param: str password: [required] The password for the username to be tested. 

    # param: LdapConfiguration ldapConfiguration:  An ldapConfiguration object to be tested. If specified, the API call tests the provided configuration even if LDAP authentication is disabled. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(username, 'username', String)

    check_parameter(password, 'password', String)

    payload = {
        'params' => {
            'username' => username,
            'password' => password
        },
        'method' => 'TestLdapAuthentication'
    }

    if ldap_configuration != nil
      check_parameter(ldap_configuration, 'ldap_configuration', LdapConfiguration)
      payload['params']['ldapConfiguration'] = ldap_configuration
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestLdapAuthenticationResult.new(raw_response) : nil
  end

  def test_ldap_authentication_with_object(r)
    if r.username == nil
      raise "Before you can run this command, you need to set the param, username in the request object."
    end
    if r.password == nil
      raise "Before you can run this command, you need to set the param, password in the request object."
    end
    if r.ldap_configuration == nil
      raise "Before you can run this command, you need to set the param, ldapConfiguration in the request object."
    end
    test_ldap_authentication(r.username, r.password, r.ldap_configuration)
  end

  def get_login_session_info()
    ######
    # GetLoginSessionInfo enables you to return the period of time a log in authentication session is valid for both log in shells and the TUI.######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetLoginSessionInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetLoginSessionInfoResult.new(raw_response) : nil
  end


  def get_remote_logging_hosts()
    ######
    # GetRemoteLoggingHosts enables you to retrieve the current list of log servers.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetRemoteLoggingHosts'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetRemoteLoggingHostsResult.new(raw_response) : nil
  end


  def set_login_session_info(timeout)
    ######
    # You can use SetLoginSessionInfo to set the period of time that a session's login authentication is valid. After the log in period elapses without activity on the system, the authentication expires. New login credentials are required for continued access to the cluster after the timeout period has elapsed.
    # param: str timeout: [required] Cluster authentication expiration period. Formatted in HH:mm:ss. For example, 01:30:00, 00:90:00, and 00:00:5400 can be used to equal a 90 minute timeout period. The default value is 30 minutes. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(timeout, 'timeout', String)

    payload = {
        'params' => {
            'timeout' => timeout
        },
        'method' => 'SetLoginSessionInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetLoginSessionInfoResult.new(raw_response) : nil
  end

  def set_login_session_info_with_object(r)
    if r.timeout == nil
      raise "Before you can run this command, you need to set the param, timeout in the request object."
    end
    set_login_session_info(r.timeout)
  end

  def set_remote_logging_hosts(remote_hosts)
    ######
    # SetRemoteLoggingHosts enables you to configure remote logging from the nodes in the storage cluster to a centralized log server or servers. Remote logging is performed over TCP using the default port 514. This API does not add to the existing logging hosts. Rather, it replaces what currently exists with new values specified by this API method. You can use GetRemoteLoggingHosts to determine what the current logging hosts are, and then use SetRemoteLoggingHosts to set the desired list of current and new logging hosts.
    # param: LoggingServer remoteHosts: [required] A list of hosts to send log messages to. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(remote_hosts, 'remote_hosts', 'LoggingServer')

    payload = {
        'params' => {
            'remoteHosts' => remote_hosts
        },
        'method' => 'SetRemoteLoggingHosts'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetRemoteLoggingHostsResult.new(raw_response) : nil
  end

  def set_remote_logging_hosts_with_object(r)
    if r.remote_hosts == nil
      raise "Before you can run this command, you need to set the param, remoteHosts in the request object."
    end
    set_remote_logging_hosts(r.remote_hosts)
  end

  def list_fibre_channel_port_info()
    ######
    # ListFibreChannelPortInfo enables you to retrieve information about the Fibre Channel ports on a node.  The API method is intended for use on individual nodes; userid and password authentication is required for access to individual Fibre Channel nodes.######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListFibreChannelPortInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListFibreChannelPortInfoResult.new(raw_response) : nil
  end


  def list_fibre_channel_sessions()
    ######
    # ListFibreChannelSessions enables you to retrieve information about the active Fibre Channel sessions on a cluster. ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListFibreChannelSessions'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListFibreChannelSessionsResult.new(raw_response) : nil
  end


  def list_iscsisessions()
    ######
    # You can use ListISCSISessions to return iSCSI information for volumes in the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListISCSISessions'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListISCSISessionsResult.new(raw_response) : nil
  end


  def list_network_interfaces()
    ######
    # ListNetworkInterfaces enables you to retrieve information about each network interface on a node. The API method is intended for use on individual nodes; userid and password authentication is required for access to individual nodes.######

    check_connection(7, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'ListNetworkInterfaces'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListNetworkInterfacesResult.new(raw_response) : nil
  end


  def list_node_fibre_channel_port_info()
    ######
    # The ListNodeFibreChannelPortInfo API method enables you to retrieve information about the Fibre Channel ports on a node. The API method is intended for use on individual nodes; userid and password authentication is required for access to individual Fibre Channel nodes.######

    check_connection(7, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'ListNodeFibreChannelPortInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListNodeFibreChannelPortInfoResult.new(raw_response) : nil
  end


  def add_nodes(pending_nodes, auto_install = nil)
    ######
    # AddNodes enables you to add one or more new nodes to a cluster. When a node that is not configured starts up for the first time, you are prompted to configure the node. After you configure the node, it is registered as a "pending node" with the cluster. 
    # Note: It might take several seconds after adding a new node for it to start up and register its drives as available.
    # param: Fixnum pendingNodes: [required]  List of pending NodeIDs for the nodes to be added. You can  obtain the list of pending nodes using the ListPendingNodes method. 

    # param: bool autoInstall:  Whether these nodes should be autoinstalled 
    ######

    check_connection(1, 'Cluster')

    check_parameter(pending_nodes, 'pending_nodes', 'Fixnum')

    payload = {
        'params' => {
            'pendingNodes' => pending_nodes
        },
        'method' => 'AddNodes'
    }

    if auto_install != nil
      check_parameter(auto_install, 'auto_install', bool)
      payload['params']['autoInstall'] = auto_install
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddNodesResult.new(raw_response) : nil
  end

  def add_nodes_with_object(r)
    if r.pending_nodes == nil
      raise "Before you can run this command, you need to set the param, pendingNodes in the request object."
    end
    if r.auto_install == nil
      raise "Before you can run this command, you need to set the param, autoInstall in the request object."
    end
    add_nodes(r.pending_nodes, r.auto_install)
  end

  def get_bootstrap_config()
    ######
    # GetBootstrapConfig returns cluster and node information from the bootstrap configuration file. Use this API method on an individual node before it has been joined with a cluster. You can use the information this method returns in the cluster configuration interface when you create a cluster.######

    check_connection(2, 'Both')

    payload = {
        'params' => {
        },
        'method' => 'GetBootstrapConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetBootstrapConfigResult.new(raw_response) : nil
  end


  def get_config()
    ######
    # The GetConfig API method enables you to retrieve all configuration information for a node. This method includes the same information available in both the GetClusterConfig and GetNetworkConfig API methods.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetConfigResult.new(raw_response) : nil
  end


  def get_network_config()
    ######
    # The GetNetworkConfig API method enables you to display the network configuration information for a node.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetNetworkConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNetworkConfigResult.new(raw_response) : nil
  end


  def get_node_stats(node_id)
    ######
    # GetNodeStats enables you to retrieve the high-level activity measurements for a single node.
    # param: Fixnum nodeID: [required] Specifies the node for which statistics are gathered. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(node_id, 'node_id', 'Fixnum')

    payload = {
        'params' => {
            'nodeID' => node_id
        },
        'method' => 'GetNodeStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetNodeStatsResult.new(raw_response) : nil
  end

  def get_node_stats_with_object(r)
    if r.node_id == nil
      raise "Before you can run this command, you need to set the param, nodeID in the request object."
    end
    get_node_stats(r.node_id)
  end

  def get_origin()
    ######
    # GetOrigin enables you to retrieve the origination certificate for where the node was built. This method might return null if there is no origination certification.######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetOrigin'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetOriginResult.new(raw_response) : nil
  end


  def get_pending_operation()
    ######
    # You can use GetPendingOperation to detect an operation on a node that is currently in progress. You can also use this method to report back when an operation has completed. 
    # Note: method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetPendingOperation'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetPendingOperationResult.new(raw_response) : nil
  end


  def list_active_nodes()
    ######
    # ListActiveNodes returns the list of currently active nodes that are in the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListActiveNodes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActiveNodesResult.new(raw_response) : nil
  end


  def list_all_nodes()
    ######
    # ListAllNodes enables you to retrieve a list of active and pending nodes in the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListAllNodes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAllNodesResult.new(raw_response) : nil
  end


  def list_node_stats()
    ######
    # ListNodeStats enables you to view the high-level activity measurements for all nodes in a cluster.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListNodeStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListNodeStatsResult.new(raw_response) : nil
  end


  def list_pending_active_nodes()
    ######
    # ListPendingActiveNodes returns the list of nodes in the cluster that are currently in the PendingActive state, between the pending and active states. These are nodes that are currently being returned to the factory image.######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListPendingActiveNodes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListPendingActiveNodesResult.new(raw_response) : nil
  end


  def list_pending_nodes()
    ######
    # ListPendingNodes returns a list of the currently pending nodes in the system. Pending nodes are nodes that are running and configured to join the cluster, but have not yet been added via the AddNodes API method.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListPendingNodes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListPendingNodesResult.new(raw_response) : nil
  end


  def remove_nodes(nodes)
    ######
    # You can use RemoveNodes to remove one or more nodes that should no longer participate in the cluster. Before removing a node, you must remove all drives the node contains using the RemoveDrives method. You cannot remove a node until the RemoveDrives process has completed and all data has been migrated away from the node.
    # After you remove a node, it registers itself as a pending node. You can add the node again or shut it down (shutting the node down removes it from the Pending Node list).
    # param: Fixnum nodes: [required] List of NodeIDs for the nodes to be removed. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(nodes, 'nodes', 'Fixnum')

    payload = {
        'params' => {
            'nodes' => nodes
        },
        'method' => 'RemoveNodes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveNodesResult.new(raw_response) : nil
  end

  def remove_nodes_with_object(r)
    if r.nodes == nil
      raise "Before you can run this command, you need to set the param, nodes in the request object."
    end
    remove_nodes(r.nodes)
  end

  def set_config(config)
    ######
    # The SetConfig API method enables you to set all the configuration information for the node. This includes the same information available via calls to SetClusterConfig and SetNetworkConfig in one API method. 
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # Caution: Changing the "bond-mode" on a node can cause a temporary loss of network connectivity. Exercise caution when using this method.
    # param: Config config: [required] Objects that you want changed for the cluster interface settings. 
    ######

    check_connection(5, 'Node')

    check_parameter(config, 'config', 'Config')

    payload = {
        'params' => {
            'config' => config
        },
        'method' => 'SetConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetConfigResult.new(raw_response) : nil
  end

  def set_config_with_object(r)
    if r.config == nil
      raise "Before you can run this command, you need to set the param, config in the request object."
    end
    set_config(r.config)
  end

  def set_network_config(network)
    ######
    # The SetNetworkConfig API method enables you to set the network configuration for a node. To display the current network settings for a node, run the GetNetworkConfig API method. 
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # Changing the "bond-mode" on a node can cause a temporary loss of network connectivity. Exercise caution when using this method.
    # param: NetworkParams network: [required] An object containing node network settings to modify. 
    ######

    check_connection(5, 'Node')

    check_parameter(network, 'network', 'NetworkParams')

    payload = {
        'params' => {
            'network' => network
        },
        'method' => 'SetNetworkConfig'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetNetworkConfigResult.new(raw_response) : nil
  end

  def set_network_config_with_object(r)
    if r.network == nil
      raise "Before you can run this command, you need to set the param, network in the request object."
    end
    set_network_config(r.network)
  end

  def complete_cluster_pairing(cluster_pairing_key)
    ######
    # You can use the CompleteClusterPairing method with the encoded key received from the  StartClusterPairing method to complete the cluster pairing process. The CompleteClusterPairing method is the second step in the cluster pairing process. 
    # param: str clusterPairingKey: [required] A string of characters that is returned from the "StartClusterPairing" API method. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(cluster_pairing_key, 'cluster_pairing_key', String)

    payload = {
        'params' => {
            'clusterPairingKey' => cluster_pairing_key
        },
        'method' => 'CompleteClusterPairing'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CompleteClusterPairingResult.new(raw_response) : nil
  end

  def complete_cluster_pairing_with_object(r)
    if r.cluster_pairing_key == nil
      raise "Before you can run this command, you need to set the param, clusterPairingKey in the request object."
    end
    complete_cluster_pairing(r.cluster_pairing_key)
  end

  def complete_volume_pairing(volume_pairing_key, volume_id)
    ######
    # You can use the CompleteVolumePairing method to complete the pairing of two volumes.
    # param: str volumePairingKey: [required] The key returned from the StartVolumePairing method. 

    # param: Fixnum volumeID: [required] The ID of the volume on which to complete the pairing process. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_pairing_key, 'volume_pairing_key', String)

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumePairingKey' => volume_pairing_key,
            'volumeID' => volume_id
        },
        'method' => 'CompleteVolumePairing'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CompleteVolumePairingResult.new(raw_response) : nil
  end

  def complete_volume_pairing_with_object(r)
    if r.volume_pairing_key == nil
      raise "Before you can run this command, you need to set the param, volumePairingKey in the request object."
    end
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    complete_volume_pairing(r.volume_pairing_key, r.volume_id)
  end

  def list_active_paired_volumes(start_volume_id = nil, limit = nil)
    ######
    # ListActivePairedVolumes enables you to list all the active volumes paired with a volume. This method returns information about volumes with active and pending pairings.
    # param: Fixnum startVolumeID:  The beginning of the range of active paired volumes to return. 

    # param: Fixnum limit:  Maximum number of active paired volumes to return. 
    ######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListActivePairedVolumes'
    }

    if start_volume_id != nil
      check_parameter(start_volume_id, 'start_volume_id', Fixnum)
      payload['params']['startVolumeID'] = start_volume_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActivePairedVolumesResult.new(raw_response) : nil
  end

  def list_active_paired_volumes_with_object(r)
    if r.start_volume_id == nil
      raise "Before you can run this command, you need to set the param, startVolumeID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    list_active_paired_volumes(r.start_volume_id, r.limit)
  end

  def list_cluster_pairs()
    ######
    # You can use the ListClusterPairs method to list all the clusters that a cluster is paired with. This method returns information about active and pending cluster pairings, such as statistics about the current pairing as well as the connectivity and latency (in milliseconds) of the cluster pairing.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListClusterPairs'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListClusterPairsResult.new(raw_response) : nil
  end


  def modify_volume_pair(volume_id, paused_manual = nil, mode = nil, pause_limit = nil)
    ######
    # ModifyVolumePair enables you to pause or restart replication between a pair of volumes.
    # param: Fixnum volumeID: [required] The ID of the volume to be modified. 

    # param: bool pausedManual:  Specifies whether to pause or restart volume replication process. Valid values are:  true: Pauses volume replication false: Restarts volume replication 

    # param: str mode:  Specifies the volume replication mode. Possible values are: Async: Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster. Sync: The source acknowledges the write when the data is stored locally and on the remote cluster. SnapshotsOnly: Only snapshots created on the source cluster are replicated. Active writes from the source volume are not replicated. 

    # param: Fixnum pauseLimit:  Internal use only. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'ModifyVolumePair'
    }

    if paused_manual != nil
      check_parameter(paused_manual, 'paused_manual', bool)
      payload['params']['pausedManual'] = paused_manual
    end
    if mode != nil
      check_parameter(mode, 'mode', str)
      payload['params']['mode'] = mode
    end
    if pause_limit != nil
      check_parameter(pause_limit, 'pause_limit', Fixnum)
      payload['params']['pauseLimit'] = pause_limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumePairResult.new(raw_response) : nil
  end

  def modify_volume_pair_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.paused_manual == nil
      raise "Before you can run this command, you need to set the param, pausedManual in the request object."
    end
    if r.mode == nil
      raise "Before you can run this command, you need to set the param, mode in the request object."
    end
    if r.pause_limit == nil
      raise "Before you can run this command, you need to set the param, pauseLimit in the request object."
    end
    modify_volume_pair(r.volume_id, r.paused_manual, r.mode, r.pause_limit)
  end

  def remove_cluster_pair(cluster_pair_id)
    ######
    # You can use the RemoveClusterPair method to close the open connections between two paired clusters.
    # Note: Before you remove a cluster pair, you must first remove all volume pairing to the clusters with the "RemoveVolumePair" API method.
    # param: Fixnum clusterPairID: [required] Unique identifier used to pair two clusters. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(cluster_pair_id, 'cluster_pair_id', 'Fixnum')

    payload = {
        'params' => {
            'clusterPairID' => cluster_pair_id
        },
        'method' => 'RemoveClusterPair'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveClusterPairResult.new(raw_response) : nil
  end

  def remove_cluster_pair_with_object(r)
    if r.cluster_pair_id == nil
      raise "Before you can run this command, you need to set the param, clusterPairID in the request object."
    end
    remove_cluster_pair(r.cluster_pair_id)
  end

  def remove_volume_pair(volume_id)
    ######
    # RemoveVolumePair enables you to remove the remote pairing between two volumes. Use this method on both the source and target volumes that are paired together. When you remove the volume pairing information, data is no longer replicated to or from the volume.
    # param: Fixnum volumeID: [required] The ID of the volume on which to stop the replication process. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'RemoveVolumePair'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveVolumePairResult.new(raw_response) : nil
  end

  def remove_volume_pair_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    remove_volume_pair(r.volume_id)
  end

  def start_cluster_pairing()
    ######
    # You can use the StartClusterPairing method to create an encoded key from a cluster that is used to pair with another cluster. The key created from this API method is used in the CompleteClusterPairing API method to establish a cluster pairing. You can pair a cluster with a maximum of four other clusters. ######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'StartClusterPairing'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartClusterPairingResult.new(raw_response) : nil
  end


  def start_volume_pairing(volume_id, mode = nil)
    ######
    # StartVolumePairing enables you to create an encoded key from a volume that is used to pair with another volume. The key that this
    # method creates is used in the CompleteVolumePairing API method to establish a volume pairing.
    # param: Fixnum volumeID: [required] The ID of the volume on which to start the pairing process. 

    # param: str mode:  The mode of the volume on which to start the pairing process. The mode can only be set if the volume is the source volume. Possible values are: Async: (default if no mode parameter specified) Writes are acknowledged when they complete locally. The cluster does not wait for writes to be replicated to the target cluster. Sync: Source acknowledges write when the data is stored locally and on the remote cluster. SnapshotsOnly: Only snapshots created on the source cluster will be replicated. Active writes from the source volume are not replicated. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'StartVolumePairing'
    }

    if mode != nil
      check_parameter(mode, 'mode', str)
      payload['params']['mode'] = mode
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartVolumePairingResult.new(raw_response) : nil
  end

  def start_volume_pairing_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.mode == nil
      raise "Before you can run this command, you need to set the param, mode in the request object."
    end
    start_volume_pairing(r.volume_id, r.mode)
  end

  def list_protocol_endpoints(protocol_endpoint_ids = nil)
    ######
    # ListProtocolEndpoints enables you to retrieve information about all protocol endpoints in the cluster. Protocol endpoints govern
    # access to their associated virtual volume storage containers.
    # param: UUID protocolEndpointIDs:  A list of protocol endpoint IDs for which to retrieve information. If you omit this parameter, the method returns information about all protocol endpoints. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListProtocolEndpoints'
    }

    if protocol_endpoint_ids != nil
      check_parameter(protocol_endpoint_ids, 'protocol_endpoint_ids', UUID)
      payload['params']['protocolEndpointIDs'] = protocol_endpoint_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListProtocolEndpointsResult.new(raw_response) : nil
  end

  def list_protocol_endpoints_with_object(r)
    if r.protocol_endpoint_ids == nil
      raise "Before you can run this command, you need to set the param, protocolEndpointIDs in the request object."
    end
    list_protocol_endpoints(r.protocol_endpoint_ids)
  end

  def reset_node(build, force, options = nil, reboot = nil)
    ######
    # The ResetNode API method enables you to reset a node to the factory settings. All data, packages (software upgrades, and so on),
    # configurations, and log files are deleted from the node when you call this method. However, network settings for the node are
    # preserved during this operation. Nodes that are participating in a cluster cannot be reset to the factory settings.
    # The ResetNode API can only be used on nodes that are in an "Available" state. It cannot be used on nodes that are "Active" in a
    # cluster, or in a "Pending" state.
    # Caution: This method clears any data that is on the node. Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str build: [required] Specifies the URL to a remote Element software image to which the node will be reset. 

    # param: bool force: [required] Required parameter to successfully reset the node. 

    # param: str options:  Specifications for running the reset operation. 

    # param: bool reboot:  Should it be rebooted? 
    ######

    check_connection(5, 'Node')

    check_parameter(build, 'build', String)

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'build' => build,
            'force' => force
        },
        'method' => 'ResetNode'
    }

    if options != nil
      check_parameter(options, 'options', str)
      payload['params']['options'] = options
    end
    if reboot != nil
      check_parameter(reboot, 'reboot', bool)
      payload['params']['reboot'] = reboot
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ResetNodeResult.new(raw_response) : nil
  end

  def reset_node_with_object(r)
    if r.build == nil
      raise "Before you can run this command, you need to set the param, build in the request object."
    end
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    if r.options == nil
      raise "Before you can run this command, you need to set the param, options in the request object."
    end
    if r.reboot == nil
      raise "Before you can run this command, you need to set the param, reboot in the request object."
    end
    reset_node(r.build, r.force, r.options, r.reboot)
  end

  def restart_networking(force)
    ######
    # The RestartNetworking API method enables you to restart the networking services on a node.
    # Warning: This method restarts all networking services on a node, causing temporary loss of networking connectivity.
    # Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: bool force: [required] Required parameter to successfully reset the node. 
    ######

    check_connection(5, 'Node')

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'force' => force
        },
        'method' => 'RestartNetworking'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end

  def restart_networking_with_object(r)
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    restart_networking(r.force)
  end

  def restart_services(force, service = nil, action = nil)
    ######
    # The RestartServices API method enables you to restart the services on a node.
    # Caution: This method causes temporary node services interruption. Exercise caution when using this method.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: bool force: [required] Required parameter to successfully restart services on a node. 

    # param: str service:  Service name to be restarted. 

    # param: str action:  Action to perform on the service (start, stop, restart). 
    ######

    check_connection(5, 'Node')

    check_parameter(force, 'force', 'bool')

    payload = {
        'params' => {
            'force' => force
        },
        'method' => 'RestartServices'
    }

    if service != nil
      check_parameter(service, 'service', str)
      payload['params']['service'] = service
    end
    if action != nil
      check_parameter(action, 'action', str)
      payload['params']['action'] = action
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end

  def restart_services_with_object(r)
    if r.force == nil
      raise "Before you can run this command, you need to set the param, force in the request object."
    end
    if r.service == nil
      raise "Before you can run this command, you need to set the param, service in the request object."
    end
    if r.action == nil
      raise "Before you can run this command, you need to set the param, action in the request object."
    end
    restart_services(r.force, r.service, r.action)
  end

  def shutdown(nodes, option = nil)
    ######
    # The Shutdown API method enables you to restart or shutdown a node that has not yet been added to a cluster. To use this method,
    # log in to the MIP for the pending node, and enter the "shutdown" method with either the "restart" or "halt" options.
    # param: Fixnum nodes: [required] List of NodeIDs for the nodes to be shutdown. 

    # param: str option:  Specifies the action to take for the node shutdown. Possible values are: restart: Restarts the node. halt: Shuts down the node. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(nodes, 'nodes', 'Fixnum')

    payload = {
        'params' => {
            'nodes' => nodes
        },
        'method' => 'Shutdown'
    }

    if option != nil
      check_parameter(option, 'option', str)
      payload['params']['option'] = option
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ShutdownResult.new(raw_response) : nil
  end

  def shutdown_with_object(r)
    if r.nodes == nil
      raise "Before you can run this command, you need to set the param, nodes in the request object."
    end
    if r.option == nil
      raise "Before you can run this command, you need to set the param, option in the request object."
    end
    shutdown(r.nodes, r.option)
  end

  def get_ipmi_config(chassis_type = nil)
    ######
    # GetIpmiConfig enables you to retrieve hardware sensor information from sensors that are in your node.
    # param: str chassisType:  Displays information for each node chassis type. Valid values are: all: Returns sensor information for each chassis type. {chassis type}: Returns sensor information for a specified chassis type. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetIpmiConfig'
    }

    if chassis_type != nil
      check_parameter(chassis_type, 'chassis_type', str)
      payload['params']['chassisType'] = chassis_type
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetIpmiConfigResult.new(raw_response) : nil
  end

  def get_ipmi_config_with_object(r)
    if r.chassis_type == nil
      raise "Before you can run this command, you need to set the param, chassisType in the request object."
    end
    get_ipmi_config(r.chassis_type)
  end

  def get_ipmi_info()
    ######
    # GetIpmiInfo enables you to display a detailed reporting of sensors (objects) for node fans, intake and exhaust temperatures, and power supplies that are monitored by the system.######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetIpmiInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetIpmiInfoResult.new(raw_response) : nil
  end


  def list_services()
    ######
    # You can use ListServices to return the services information for nodes, drives, current software, and other services that are running on the cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListServices'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListServicesResult.new(raw_response) : nil
  end


  def invoke_sfapi(method, parameters = nil)
    ######
    # This will invoke any API method supported by the SolidFire API for the version and port the connection is using.
    # Returns a nested hashtable of key/value pairs that contain the result of the invoked method.
    # param: str method: [required] The name of the method to invoke. This is case sensitive. 

    # param: omnitype parameters:  An object, normally a dictionary or hashtable of the key/value pairs, to be passed as the params for the method being invoked. 
    ######

    check_connection(1.0, 'Both')

    check_parameter(method, 'method', String)

    payload = {
        'params' => {
            'method' => method
        },
        'method' => 'InvokeSFApi'
    }

    if parameters != nil
      check_parameter(parameters, 'parameters', omnitype)
      payload['params']['parameters'] = parameters
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end

  def invoke_sfapi_with_object(r)
    if r.method == nil
      raise "Before you can run this command, you need to set the param, method in the request object."
    end
    if r.parameters == nil
      raise "Before you can run this command, you need to set the param, parameters in the request object."
    end
    invoke_sfapi(r.method, r.parameters)
  end

  def create_group_snapshot(volumes, name = nil, enable_remote_replication = nil, retention = nil, attributes = nil)
    ######
    # CreateGroupSnapshot enables you to create a point-in-time copy of a group of volumes. You can use this snapshot later as a backup or rollback to ensure the data on the group of volumes is consistent for the point in time that you created the snapshot.
    # Note: Creating a group snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: Fixnum volumes: [required] Unique ID of the volume image from which to copy. 

    # param: str name:  Name for the group snapshot. If unspecified, the date and time the group snapshot was taken is used. 

    # param: bool enableRemoteReplication:  Replicates the snapshot created to remote storage. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated. 

    # param: str retention:  Specifies the amount of time for which the snapshots are retained. The format is HH:mm:ss. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(volumes, 'volumes', 'Fixnum')

    payload = {
        'params' => {
            'volumes' => volumes
        },
        'method' => 'CreateGroupSnapshot'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if enable_remote_replication != nil
      check_parameter(enable_remote_replication, 'enable_remote_replication', bool)
      payload['params']['enableRemoteReplication'] = enable_remote_replication
    end
    if retention != nil
      check_parameter(retention, 'retention', str)
      payload['params']['retention'] = retention
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateGroupSnapshotResult.new(raw_response) : nil
  end

  def create_group_snapshot_with_object(r)
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.enable_remote_replication == nil
      raise "Before you can run this command, you need to set the param, enableRemoteReplication in the request object."
    end
    if r.retention == nil
      raise "Before you can run this command, you need to set the param, retention in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_group_snapshot(r.volumes, r.name, r.enable_remote_replication, r.retention, r.attributes)
  end

  def create_schedule(schedule)
    ######
    # CreateSchedule enables you to schedule an automatic snapshot of a volume at a defined interval.
    # You can use the created snapshot later as a backup or rollback to ensure the data on a volume or group of volumes is consistent for
    # the point in time in which the snapshot was created.
    # If you schedule a snapshot to run at a time period that is not divisible by 5 minutes, the snapshot runs at the next time period
    # that is divisible by 5 minutes. For example, if you schedule a snapshot to run at 12:42:00 UTC, it runs at 12:45:00 UTC.
    # Note: You can create snapshots if cluster fullness is at stage 1, 2 or 3. You cannot create snapshots after cluster fullness reaches stage 4 or 5.
    # param: Schedule schedule: [required] The "Schedule" object will be used to create a new schedule. Do not set ScheduleID property, it will be ignored. Frequency property must be of type that inherits from Frequency. Valid types are: DaysOfMonthFrequency DaysOrWeekFrequency TimeIntervalFrequency 
    ######

    check_connection(8, 'Cluster')

    check_parameter(schedule, 'schedule', 'Schedule')

    payload = {
        'params' => {
            'schedule' => schedule
        },
        'method' => 'CreateSchedule'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateScheduleResult.new(raw_response) : nil
  end

  def create_schedule_with_object(r)
    if r.schedule == nil
      raise "Before you can run this command, you need to set the param, schedule in the request object."
    end
    create_schedule(r.schedule)
  end

  def create_snapshot(volume_id, snapshot_id = nil, name = nil, enable_remote_replication = nil, retention = nil, attributes = nil)
    ######
    # CreateSnapshot enables you to create a point-in-time copy of a volume. You can create a snapshot from any volume or from an existing snapshot. If you do not provide a SnapshotID with this API method, a snapshot is created from the volume's active branch.
    # If the volume from which the snapshot is created is being replicated to a remote cluster, the snapshot can also be replicated to the same target. Use the enableRemoteReplication parameter to enable snapshot replication.
    # Note: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: Fixnum volumeID: [required] Specifies the unique ID of the volume image from which to copy. 

    # param: Fixnum snapshotID:  Specifies the unique ID of a snapshot from which the new snapshot is made. The snapshotID passed must be a snapshot on the given volume. 

    # param: str name:  Specifies a name for the snapshot. If unspecified, the date and time the snapshot was taken is used. 

    # param: bool enableRemoteReplication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated. 

    # param: str retention:  Specifies the amount of time for which the snapshot is retained. The format is HH:mm:ss. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'CreateSnapshot'
    }

    if snapshot_id != nil
      check_parameter(snapshot_id, 'snapshot_id', Fixnum)
      payload['params']['snapshotID'] = snapshot_id
    end
    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if enable_remote_replication != nil
      check_parameter(enable_remote_replication, 'enable_remote_replication', bool)
      payload['params']['enableRemoteReplication'] = enable_remote_replication
    end
    if retention != nil
      check_parameter(retention, 'retention', str)
      payload['params']['retention'] = retention
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateSnapshotResult.new(raw_response) : nil
  end

  def create_snapshot_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.enable_remote_replication == nil
      raise "Before you can run this command, you need to set the param, enableRemoteReplication in the request object."
    end
    if r.retention == nil
      raise "Before you can run this command, you need to set the param, retention in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_snapshot(r.volume_id, r.snapshot_id, r.name, r.enable_remote_replication, r.retention, r.attributes)
  end

  def delete_group_snapshot(group_snapshot_id, save_members)
    ######
    # DeleteGroupSnapshot enables you to delete a group snapshot. You can use the saveMembers parameter to preserve all the snapshots that were made for the volumes in the group, but the group association is removed.
    # param: Fixnum groupSnapshotID: [required] Specifies the unique ID of the group snapshot. 

    # param: bool saveMembers: [required] Specifies whether to preserve snapshots or delete them. Valid values are: true: Snapshots are preserved, but group association is removed. false: The group and snapshots are deleted. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(group_snapshot_id, 'group_snapshot_id', 'Fixnum')

    check_parameter(save_members, 'save_members', 'bool')

    payload = {
        'params' => {
            'groupSnapshotID' => group_snapshot_id,
            'saveMembers' => save_members
        },
        'method' => 'DeleteGroupSnapshot'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteGroupSnapshotResult.new(raw_response) : nil
  end

  def delete_group_snapshot_with_object(r)
    if r.group_snapshot_id == nil
      raise "Before you can run this command, you need to set the param, groupSnapshotID in the request object."
    end
    if r.save_members == nil
      raise "Before you can run this command, you need to set the param, saveMembers in the request object."
    end
    delete_group_snapshot(r.group_snapshot_id, r.save_members)
  end

  def delete_snapshot(snapshot_id)
    ######
    # DeleteSnapshot enables you to delete a snapshot. A snapshot that is currently the "active" snapshot cannot be deleted. You must
    # rollback and make another snapshot "active" before the current snapshot can be deleted. For more details on rolling back snapshots, see RollbackToSnapshot.
    # param: Fixnum snapshotID: [required] The ID of the snapshot to be deleted. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(snapshot_id, 'snapshot_id', 'Fixnum')

    payload = {
        'params' => {
            'snapshotID' => snapshot_id
        },
        'method' => 'DeleteSnapshot'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteSnapshotResult.new(raw_response) : nil
  end

  def delete_snapshot_with_object(r)
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    delete_snapshot(r.snapshot_id)
  end

  def get_schedule(schedule_id)
    ######
    # You can use the GetSchedule method to retrieve information about a scheduled snapshot. You can see information about a specific
    # schedule if there are many snapshot schedules in the system. You also retrieve information about more than one schedule with this
    # method by specifying additional scheduleIDs in the parameter.
    # param: Fixnum scheduleID: [required] Specifies the unique ID of the schedule or multiple schedules to display. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(schedule_id, 'schedule_id', 'Fixnum')

    payload = {
        'params' => {
            'scheduleID' => schedule_id
        },
        'method' => 'GetSchedule'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetScheduleResult.new(raw_response) : nil
  end

  def get_schedule_with_object(r)
    if r.schedule_id == nil
      raise "Before you can run this command, you need to set the param, scheduleID in the request object."
    end
    get_schedule(r.schedule_id)
  end

  def list_group_snapshots(volume_id = nil, group_snapshot_id = nil)
    ######
    # ListGroupSnapshots enables you to get information about all group snapshots that have been created.
    # param: Fixnum volumeID:  An array of unique volume IDs to query. If you do not specify this parameter, all group snapshots on the cluster are included. 

    # param: Fixnum groupSnapshotID:  Retrieves information for a specific group snapshot ID. 
    ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListGroupSnapshots'
    }

    if volume_id != nil
      check_parameter(volume_id, 'volume_id', Fixnum)
      payload['params']['volumeID'] = volume_id
    end
    if group_snapshot_id != nil
      check_parameter(group_snapshot_id, 'group_snapshot_id', Fixnum)
      payload['params']['groupSnapshotID'] = group_snapshot_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListGroupSnapshotsResult.new(raw_response) : nil
  end

  def list_group_snapshots_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.group_snapshot_id == nil
      raise "Before you can run this command, you need to set the param, groupSnapshotID in the request object."
    end
    list_group_snapshots(r.volume_id, r.group_snapshot_id)
  end

  def list_schedules()
    ######
    # ListSchedule enables you to retrieve information about all scheduled snapshots that have been created.######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListSchedules'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListSchedulesResult.new(raw_response) : nil
  end


  def list_snapshots(volume_id = nil, snapshot_id = nil)
    ######
    # ListSnapshots enables you to return the attributes of each snapshot taken on the volume. Information about snapshots that reside on the target cluster is displayed on the source cluster when this method is called from the source cluster.
    # param: Fixnum volumeID:  Retrieves snapshots for a volume. If volumeID is not provided, all snapshots for all volumes are returned. 

    # param: Fixnum snapshotID:  Retrieves information for a specific snapshot ID. 
    ######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListSnapshots'
    }

    if volume_id != nil
      check_parameter(volume_id, 'volume_id', Fixnum)
      payload['params']['volumeID'] = volume_id
    end
    if snapshot_id != nil
      check_parameter(snapshot_id, 'snapshot_id', Fixnum)
      payload['params']['snapshotID'] = snapshot_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListSnapshotsResult.new(raw_response) : nil
  end

  def list_snapshots_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    list_snapshots(r.volume_id, r.snapshot_id)
  end

  def modify_group_snapshot(group_snapshot_id, expiration_time = nil, enable_remote_replication = nil)
    ######
    # ModifyGroupSnapshot enables you to change the attributes of a group of snapshots. You can also use this method to enable snapshots created on the Read/Write (source) volume to be remotely replicated to a target SolidFire storage system.
    # param: Fixnum groupSnapshotID: [required] Specifies the ID of the group of snapshots. 

    # param: str expirationTime:  Sets the time when the snapshot should be removed. If unspecified, the current time is used. 

    # param: bool enableRemoteReplication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(group_snapshot_id, 'group_snapshot_id', 'Fixnum')

    payload = {
        'params' => {
            'groupSnapshotID' => group_snapshot_id
        },
        'method' => 'ModifyGroupSnapshot'
    }

    if expiration_time != nil
      check_parameter(expiration_time, 'expiration_time', str)
      payload['params']['expirationTime'] = expiration_time
    end
    if enable_remote_replication != nil
      check_parameter(enable_remote_replication, 'enable_remote_replication', bool)
      payload['params']['enableRemoteReplication'] = enable_remote_replication
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyGroupSnapshotResult.new(raw_response) : nil
  end

  def modify_group_snapshot_with_object(r)
    if r.group_snapshot_id == nil
      raise "Before you can run this command, you need to set the param, groupSnapshotID in the request object."
    end
    if r.expiration_time == nil
      raise "Before you can run this command, you need to set the param, expirationTime in the request object."
    end
    if r.enable_remote_replication == nil
      raise "Before you can run this command, you need to set the param, enableRemoteReplication in the request object."
    end
    modify_group_snapshot(r.group_snapshot_id, r.expiration_time, r.enable_remote_replication)
  end

  def modify_schedule(schedule)
    ######
    # ModifySchedule enables you to change the intervals at which a scheduled snapshot occurs. This allows for adjustment to the snapshot frequency and retention.
    # param: Schedule schedule: [required] The "Schedule" object will be used to modify an existing schedule. The ScheduleID property is required. Frequency property must be of type that inherits from Frequency. Valid types are: DaysOfMonthFrequency DaysOrWeekFrequency TimeIntervalFrequency 
    ######

    check_connection(8, 'Cluster')

    check_parameter(schedule, 'schedule', 'Schedule')

    payload = {
        'params' => {
            'schedule' => schedule
        },
        'method' => 'ModifySchedule'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyScheduleResult.new(raw_response) : nil
  end

  def modify_schedule_with_object(r)
    if r.schedule == nil
      raise "Before you can run this command, you need to set the param, schedule in the request object."
    end
    modify_schedule(r.schedule)
  end

  def modify_snapshot(snapshot_id, expiration_time = nil, enable_remote_replication = nil)
    ######
    # ModifySnapshot enables you to change the attributes currently assigned to a snapshot. You can use this method to enable snapshots created on
    # the Read/Write (source) volume to be remotely replicated to a target SolidFire storage system.
    # param: Fixnum snapshotID: [required] Specifies the ID of the snapshot. 

    # param: str expirationTime:  Sets the time when the snapshot should be removed. 

    # param: bool enableRemoteReplication:  Replicates the snapshot created to a remote cluster. Possible values are: true: The snapshot is replicated to remote storage. false: Default. The snapshot is not replicated. 
    ######

    check_connection(8, 'Cluster')

    check_parameter(snapshot_id, 'snapshot_id', 'Fixnum')

    payload = {
        'params' => {
            'snapshotID' => snapshot_id
        },
        'method' => 'ModifySnapshot'
    }

    if expiration_time != nil
      check_parameter(expiration_time, 'expiration_time', str)
      payload['params']['expirationTime'] = expiration_time
    end
    if enable_remote_replication != nil
      check_parameter(enable_remote_replication, 'enable_remote_replication', bool)
      payload['params']['enableRemoteReplication'] = enable_remote_replication
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifySnapshotResult.new(raw_response) : nil
  end

  def modify_snapshot_with_object(r)
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    if r.expiration_time == nil
      raise "Before you can run this command, you need to set the param, expirationTime in the request object."
    end
    if r.enable_remote_replication == nil
      raise "Before you can run this command, you need to set the param, enableRemoteReplication in the request object."
    end
    modify_snapshot(r.snapshot_id, r.expiration_time, r.enable_remote_replication)
  end

  def rollback_to_group_snapshot(group_snapshot_id, save_current_state, name = nil, attributes = nil)
    ######
    # RollbackToGroupSnapshot enables you to roll back all individual volumes in a snapshot group to each volume's individual snapshot.
    # Note: Rolling back to a group snapshot creates a temporary snapshot of each volume within the group snapshot.
    # Snapshots are allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: Fixnum groupSnapshotID: [required] Specifies the unique ID of the group snapshot. 

    # param: bool saveCurrentState: [required] Specifies whether to save an active volume image or delete it. Values are: true: The previous active volume image is kept. false: (default) The previous active volume image is deleted. 

    # param: str name:  Name for the group snapshot of the volume's current state that is created if "saveCurrentState" is set to true. If you do not give a name, the name of the snapshots (group and individual volume) are set to a timestamp of the time that the rollback occurred. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(group_snapshot_id, 'group_snapshot_id', 'Fixnum')

    check_parameter(save_current_state, 'save_current_state', 'bool')

    payload = {
        'params' => {
            'groupSnapshotID' => group_snapshot_id,
            'saveCurrentState' => save_current_state
        },
        'method' => 'RollbackToGroupSnapshot'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RollbackToGroupSnapshotResult.new(raw_response) : nil
  end

  def rollback_to_group_snapshot_with_object(r)
    if r.group_snapshot_id == nil
      raise "Before you can run this command, you need to set the param, groupSnapshotID in the request object."
    end
    if r.save_current_state == nil
      raise "Before you can run this command, you need to set the param, saveCurrentState in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    rollback_to_group_snapshot(r.group_snapshot_id, r.save_current_state, r.name, r.attributes)
  end

  def rollback_to_snapshot(volume_id, snapshot_id, save_current_state, name = nil, attributes = nil)
    ######
    # RollbackToSnapshot enables you to make an existing snapshot of the "active" volume image. This method creates a new snapshot
    # from an existing snapshot. The new snapshot becomes "active" and the existing snapshot is preserved until you delete it.
    # The previously "active" snapshot is deleted unless you set the parameter saveCurrentState to true.
    # Note: Creating a snapshot is allowed if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is
    # at stage 4 or 5.
    # param: Fixnum volumeID: [required] VolumeID for the volume. 

    # param: Fixnum snapshotID: [required] The ID of a previously created snapshot on the given volume. 

    # param: bool saveCurrentState: [required] Specifies whether to save an active volume image or delete it. Values are: true: The previous active volume image is kept. false: (default) The previous active volume image is deleted. 

    # param: str name:  Name for the snapshot. If unspecified, the name of the snapshot being rolled back to is used with "- copy" appended to the end of the name. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    check_parameter(snapshot_id, 'snapshot_id', 'Fixnum')

    check_parameter(save_current_state, 'save_current_state', 'bool')

    payload = {
        'params' => {
            'volumeID' => volume_id,
            'snapshotID' => snapshot_id,
            'saveCurrentState' => save_current_state
        },
        'method' => 'RollbackToSnapshot'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RollbackToSnapshotResult.new(raw_response) : nil
  end

  def rollback_to_snapshot_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    if r.save_current_state == nil
      raise "Before you can run this command, you need to set the param, saveCurrentState in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    rollback_to_snapshot(r.volume_id, r.snapshot_id, r.save_current_state, r.name, r.attributes)
  end

  def get_complete_stats()
    ######
    # NetApp engineering uses the GetCompleteStats API method to troubleshoot new features. The data returned from GetCompleteStats is not documented, changes frequently, and is not guaranteed to be accurate. NetApp does not recommend using GetCompleteStats for collecting performance data or any other
    # management integration with a SolidFire cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetCompleteStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end


  def get_hardware_info()
    ######
    # The GetHardwareInfo API method enables you to return hardware information and status for a single node. This generally includes details about manufacturers, vendors, versions, drives, and other associated hardware identification information.######

    check_connection(9, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'GetHardwareInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetHardwareInfoResult.new(raw_response) : nil
  end


  def get_raw_stats()
    ######
    # NetApp engineering uses the GetRawStats API method to troubleshoot new features. The data returned from GetRawStats is not documented, changes frequently, and is not guaranteed to be accurate. NetApp does not recommend using GetCompleteStats for collecting performance data or any other
    # management integration with a SolidFire cluster.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetRawStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end


  def list_drive_stats(drives = nil)
    ######
    # ListDriveStats enables you to retrieve high-level activity measurements for multiple drives in the cluster. By default, this method returns statistics for all drives in the cluster, and these measurements are cumulative from the addition of the drive to the cluster. Some values this method returns are specific to block drives, and some are specific to metadata drives.
    # param: Fixnum drives:  Optional list of DriveIDs for which to return drive statistics. If you omit this parameter, measurements for all drives are returned. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListDriveStats'
    }

    if drives != nil
      check_parameter(drives, 'drives', Fixnum)
      payload['params']['drives'] = drives
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDriveStatsResult.new(raw_response) : nil
  end

  def list_drive_stats_with_object(r)
    if r.drives == nil
      raise "Before you can run this command, you need to set the param, drives in the request object."
    end
    list_drive_stats(r.drives)
  end

  def list_volume_stats(volume_ids = nil)
    ######
    # ListVolumeStats returns high-level activity measurements for a single volume, list of volumes, or all volumes (if you omit the volumeIDs parameter). Measurement values are cumulative from the creation of the volume.
    # param: Fixnum volumeIDs:  A list of volume IDs of volumes from which to retrieve activity information. 
    ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeStats'
    }

    if volume_ids != nil
      check_parameter(volume_ids, 'volume_ids', Fixnum)
      payload['params']['volumeIDs'] = volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsResult.new(raw_response) : nil
  end

  def list_volume_stats_with_object(r)
    if r.volume_ids == nil
      raise "Before you can run this command, you need to set the param, volumeIDs in the request object."
    end
    list_volume_stats(r.volume_ids)
  end

  def list_volume_stats_by_virtual_volume(virtual_volume_ids = nil)
    ######
    # ListVolumeStatsByVirtualVolume enables you to list volume statistics for any volumes in the system that are associated with virtual volumes. Statistics are cumulative from the creation of the volume.
    # param: UUID virtualVolumeIDs:  A list of one or more virtual volume IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeStatsByVirtualVolume'
    }

    if virtual_volume_ids != nil
      check_parameter(virtual_volume_ids, 'virtual_volume_ids', UUID)
      payload['params']['virtualVolumeIDs'] = virtual_volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVirtualVolumeResult.new(raw_response) : nil
  end

  def list_volume_stats_by_virtual_volume_with_object(r)
    if r.virtual_volume_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeIDs in the request object."
    end
    list_volume_stats_by_virtual_volume(r.virtual_volume_ids)
  end

  def create_storage_container(name, initiator_secret = nil, target_secret = nil, account_id = nil)
    ######
    # CreateStorageContainer enables you to create a Virtual Volume (VVol) storage container. Storage containers are associated with a SolidFire storage system account, and are used for reporting and resource allocation. Storage containers can only be associated with virtual volumes. You need at least one storage container to use the Virtual Volumes feature.
    # param: str name: [required] The name of the storage container. Follows SolidFire account naming restrictions. 

    # param: str initiatorSecret:  The secret for CHAP authentication for the initiator. 

    # param: str targetSecret:  The secret for CHAP authentication for the target. 

    # param: Fixnum accountID:  Non-storage container account that will become a storage container. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(name, 'name', String)

    payload = {
        'params' => {
            'name' => name
        },
        'method' => 'CreateStorageContainer'
    }

    if initiator_secret != nil
      check_parameter(initiator_secret, 'initiator_secret', str)
      payload['params']['initiatorSecret'] = initiator_secret
    end
    if target_secret != nil
      check_parameter(target_secret, 'target_secret', str)
      payload['params']['targetSecret'] = target_secret
    end
    if account_id != nil
      check_parameter(account_id, 'account_id', Fixnum)
      payload['params']['accountID'] = account_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateStorageContainerResult.new(raw_response) : nil
  end

  def create_storage_container_with_object(r)
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.initiator_secret == nil
      raise "Before you can run this command, you need to set the param, initiatorSecret in the request object."
    end
    if r.target_secret == nil
      raise "Before you can run this command, you need to set the param, targetSecret in the request object."
    end
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    create_storage_container(r.name, r.initiator_secret, r.target_secret, r.account_id)
  end

  def delete_storage_containers(storage_container_ids)
    ######
    # DeleteStorageContainers enables you to remove up to 2000 Virtual Volume (VVol) storage containers from the system at one time.
    # The storage containers you remove must not contain any VVols.
    # param: UUID storageContainerIDs: [required] A list of IDs of the storage containers to delete. You can specify up to 2000 IDs in the list. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(storage_container_ids, 'storage_container_ids', 'UUID')

    payload = {
        'params' => {
            'storageContainerIDs' => storage_container_ids
        },
        'method' => 'DeleteStorageContainers'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteStorageContainerResult.new(raw_response) : nil
  end

  def delete_storage_containers_with_object(r)
    if r.storage_container_ids == nil
      raise "Before you can run this command, you need to set the param, storageContainerIDs in the request object."
    end
    delete_storage_containers(r.storage_container_ids)
  end

  def get_storage_container_efficiency(storage_container_id)
    ######
    # GetStorageContainerEfficiency enables you to retrieve efficiency information about a virtual volume storage container.
    # param: UUID storageContainerID: [required] The ID of the storage container for which to retrieve efficiency information. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(storage_container_id, 'storage_container_id', 'UUID')

    payload = {
        'params' => {
            'storageContainerID' => storage_container_id
        },
        'method' => 'GetStorageContainerEfficiency'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetStorageContainerEfficiencyResult.new(raw_response) : nil
  end

  def get_storage_container_efficiency_with_object(r)
    if r.storage_container_id == nil
      raise "Before you can run this command, you need to set the param, storageContainerID in the request object."
    end
    get_storage_container_efficiency(r.storage_container_id)
  end

  def list_storage_containers(storage_container_ids = nil)
    ######
    # ListStorageContainers enables you to retrieve information about all virtual volume storage containers known to the system.
    # param: UUID storageContainerIDs:  A list of storage container IDs for which to retrieve information. If you omit this parameter, the method returns information about all storage containers in the system. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListStorageContainers'
    }

    if storage_container_ids != nil
      check_parameter(storage_container_ids, 'storage_container_ids', UUID)
      payload['params']['storageContainerIDs'] = storage_container_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListStorageContainersResult.new(raw_response) : nil
  end

  def list_storage_containers_with_object(r)
    if r.storage_container_ids == nil
      raise "Before you can run this command, you need to set the param, storageContainerIDs in the request object."
    end
    list_storage_containers(r.storage_container_ids)
  end

  def modify_storage_container(storage_container_id, initiator_secret = nil, target_secret = nil)
    ######
    # ModifyStorageContainer enables you to make changes to an existing virtual volume storage container.
    # param: UUID storageContainerID: [required] The unique ID of the virtual volume storage container to modify. 

    # param: str initiatorSecret:  The new secret for CHAP authentication for the initiator. 

    # param: str targetSecret:  The new secret for CHAP authentication for the target. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(storage_container_id, 'storage_container_id', 'UUID')

    payload = {
        'params' => {
            'storageContainerID' => storage_container_id
        },
        'method' => 'ModifyStorageContainer'
    }

    if initiator_secret != nil
      check_parameter(initiator_secret, 'initiator_secret', str)
      payload['params']['initiatorSecret'] = initiator_secret
    end
    if target_secret != nil
      check_parameter(target_secret, 'target_secret', str)
      payload['params']['targetSecret'] = target_secret
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyStorageContainerResult.new(raw_response) : nil
  end

  def modify_storage_container_with_object(r)
    if r.storage_container_id == nil
      raise "Before you can run this command, you need to set the param, storageContainerID in the request object."
    end
    if r.initiator_secret == nil
      raise "Before you can run this command, you need to set the param, initiatorSecret in the request object."
    end
    if r.target_secret == nil
      raise "Before you can run this command, you need to set the param, targetSecret in the request object."
    end
    modify_storage_container(r.storage_container_id, r.initiator_secret, r.target_secret)
  end

  def list_tests()
    ######
    # You can use the ListTests API method to return the tests that are available to run on a node.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'ListTests'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListTestsResult.new(raw_response) : nil
  end


  def list_utilities()
    ######
    # You can use the ListUtilities API method to return the operations that are available to run on a node. 
    # Note: This method is available only through the per-node API endpoint 5.0 or later.######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'ListUtilities'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListUtilitiesResult.new(raw_response) : nil
  end


  def test_connect_ensemble(ensemble = nil)
    ######
    # The TestConnectEnsemble API method enables you to verify connectivity with a specified database ensemble. By default, it uses the ensemble for the cluster that the node is associated with. Alternatively, you can provide a different ensemble to test connectivity with.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str ensemble:  Uses a comma-separated list of ensemble node cluster IP addresses to test connectivity. This parameter is optional. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'TestConnectEnsemble'
    }

    if ensemble != nil
      check_parameter(ensemble, 'ensemble', str)
      payload['params']['ensemble'] = ensemble
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectEnsembleResult.new(raw_response) : nil
  end

  def test_connect_ensemble_with_object(r)
    if r.ensemble == nil
      raise "Before you can run this command, you need to set the param, ensemble in the request object."
    end
    test_connect_ensemble(r.ensemble)
  end

  def test_connect_mvip(mvip = nil)
    ######
    # The TestConnectMvip API method enables you to test the
    # management connection to the cluster. The test pings the MVIP and executes a simple API method to verify connectivity.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str mvip:  If specified, tests the management connection of a different MVIP. You do not need to use this value when testing the connection to the target cluster. This parameter is optional. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'TestConnectMvip'
    }

    if mvip != nil
      check_parameter(mvip, 'mvip', str)
      payload['params']['mvip'] = mvip
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectMvipResult.new(raw_response) : nil
  end

  def test_connect_mvip_with_object(r)
    if r.mvip == nil
      raise "Before you can run this command, you need to set the param, mvip in the request object."
    end
    test_connect_mvip(r.mvip)
  end

  def test_connect_svip(svip = nil)
    ######
    # The TestConnectSvip API method enables you to test the storage connection to the cluster. The test pings the SVIP using ICMP packets, and when successful, connects as an iSCSI initiator.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: str svip:  If specified, tests the storage connection of a different SVIP. You do not need to use this value when testing the connection to the target cluster. This parameter is optional. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'TestConnectSvip'
    }

    if svip != nil
      check_parameter(svip, 'svip', str)
      payload['params']['svip'] = svip
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestConnectSvipResult.new(raw_response) : nil
  end

  def test_connect_svip_with_object(r)
    if r.svip == nil
      raise "Before you can run this command, you need to set the param, svip in the request object."
    end
    test_connect_svip(r.svip)
  end

  def test_ping(attempts = nil, hosts = nil, total_timeout_sec = nil, packet_size = nil, ping_timeout_msec = nil, prohibit_fragmentation = nil)
    ######
    # You can use the TestPing API method to validate the
    # connection to all the nodes in a cluster on both 1G and 10G interfaces by using ICMP packets. The test uses the appropriate MTU sizes for each packet based on the MTU settings in the network configuration.
    # Note: This method is available only through the per-node API endpoint 5.0 or later.
    # param: Fixnum attempts:  Specifies the number of times the system should repeat the test ping. The default value is 5. 

    # param: str hosts:  Specifies a comma-separated list of addresses or hostnames of devices to ping. 

    # param: Fixnum totalTimeoutSec:  Specifies the length of time the ping should wait for a system response before issuing the next ping attempt or ending the process. 

    # param: Fixnum packetSize:  Specifies the number of bytes to send in the ICMP packet that is sent to each IP. The number must be less than the maximum MTU specified in the network configuration. 

    # param: Fixnum pingTimeoutMsec:  Specifies the number of milliseconds to wait for each individual ping response. The default value is 500 ms. 

    # param: bool prohibitFragmentation:  Specifies that the Do not Fragment (DF) flag is enabled for the ICMP packets. 
    ######

    check_connection(5, 'Node')

    payload = {
        'params' => {
        },
        'method' => 'TestPing'
    }

    if attempts != nil
      check_parameter(attempts, 'attempts', Fixnum)
      payload['params']['attempts'] = attempts
    end
    if hosts != nil
      check_parameter(hosts, 'hosts', str)
      payload['params']['hosts'] = hosts
    end
    if total_timeout_sec != nil
      check_parameter(total_timeout_sec, 'total_timeout_sec', Fixnum)
      payload['params']['totalTimeoutSec'] = total_timeout_sec
    end
    if packet_size != nil
      check_parameter(packet_size, 'packet_size', Fixnum)
      payload['params']['packetSize'] = packet_size
    end
    if ping_timeout_msec != nil
      check_parameter(ping_timeout_msec, 'ping_timeout_msec', Fixnum)
      payload['params']['pingTimeoutMsec'] = ping_timeout_msec
    end
    if prohibit_fragmentation != nil
      check_parameter(prohibit_fragmentation, 'prohibit_fragmentation', bool)
      payload['params']['prohibitFragmentation'] = prohibit_fragmentation
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? TestPingResult.new(raw_response) : nil
  end

  def test_ping_with_object(r)
    if r.attempts == nil
      raise "Before you can run this command, you need to set the param, attempts in the request object."
    end
    if r.hosts == nil
      raise "Before you can run this command, you need to set the param, hosts in the request object."
    end
    if r.total_timeout_sec == nil
      raise "Before you can run this command, you need to set the param, totalTimeoutSec in the request object."
    end
    if r.packet_size == nil
      raise "Before you can run this command, you need to set the param, packetSize in the request object."
    end
    if r.ping_timeout_msec == nil
      raise "Before you can run this command, you need to set the param, pingTimeoutMsec in the request object."
    end
    if r.prohibit_fragmentation == nil
      raise "Before you can run this command, you need to set the param, prohibitFragmentation in the request object."
    end
    test_ping(r.attempts, r.hosts, r.total_timeout_sec, r.packet_size, r.ping_timeout_msec, r.prohibit_fragmentation)
  end

  def add_virtual_network(virtual_network_tag, name, address_blocks, netmask, svip, gateway = nil, namespace = nil, attributes = nil)
    ######
    # You can use the AddVirtualNetwork method to add a new virtual network to a cluster configuration. When you add a virtual network,
    # an interface for each node is created and each interface will require a virtual network IP address. The number of IP addresses you
    # specify as a parameter for this API method must be equal to or greater than the number of nodes in the cluster. The system bulk
    # provisions virtual network addresses and assigns them to individual nodes automatically. You do not need to assign virtual
    # network addresses to nodes manually.
    # Note: You can use AddVirtualNetwork only to create a new virtual network. If you want to make changes to an
    # existing virtual network, use ModifyVirtualNetwork.
    # Note: Virtual network parameters must be unique to each virtual network when setting the namespace parameter to false.
    # param: Fixnum virtualNetworkTag: [required] A unique virtual network (VLAN) tag. Supported values are 1 through 4094.The number zero (0) is not supported. 

    # param: str name: [required] A user-defined name for the new virtual network. 

    # param: AddressBlock addressBlocks: [required] Unique range of IP addresses to include in the virtual network. Attributes for this parameter are: start: The start of the IP address range. (String) size: The number of IP addresses to include in the block. (Integer) 

    # param: str netmask: [required] Unique network mask for the virtual network being created. 

    # param: str svip: [required] Unique storage IP address for the virtual network being created. 

    # param: str gateway:  The IP address of a gateway of the virtual network. This parameter is only valid if the "namespace" parameter is set to true. 

    # param: bool namespace:  When set to true, enables the Routable Storage VLANs functionality by creating and configuring a namespace and the virtual network contained by it. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(virtual_network_tag, 'virtual_network_tag', 'Fixnum')

    check_parameter(name, 'name', String)

    check_parameter(address_blocks, 'address_blocks', 'AddressBlock')

    check_parameter(netmask, 'netmask', String)

    check_parameter(svip, 'svip', String)

    payload = {
        'params' => {
            'virtualNetworkTag' => virtual_network_tag,
            'name' => name,
            'addressBlocks' => address_blocks,
            'netmask' => netmask,
            'svip' => svip
        },
        'method' => 'AddVirtualNetwork'
    }

    if gateway != nil
      check_parameter(gateway, 'gateway', str)
      payload['params']['gateway'] = gateway
    end
    if namespace != nil
      check_parameter(namespace, 'namespace', bool)
      payload['params']['namespace'] = namespace
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddVirtualNetworkResult.new(raw_response) : nil
  end

  def add_virtual_network_with_object(r)
    if r.virtual_network_tag == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTag in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.address_blocks == nil
      raise "Before you can run this command, you need to set the param, addressBlocks in the request object."
    end
    if r.netmask == nil
      raise "Before you can run this command, you need to set the param, netmask in the request object."
    end
    if r.svip == nil
      raise "Before you can run this command, you need to set the param, svip in the request object."
    end
    if r.gateway == nil
      raise "Before you can run this command, you need to set the param, gateway in the request object."
    end
    if r.namespace == nil
      raise "Before you can run this command, you need to set the param, namespace in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    add_virtual_network(r.virtual_network_tag, r.name, r.address_blocks, r.netmask, r.svip, r.gateway, r.namespace, r.attributes)
  end

  def list_virtual_networks(virtual_network_id = nil, virtual_network_tag = nil, virtual_network_ids = nil, virtual_network_tags = nil)
    ######
    # ListVirtualNetworks enables you to list all configured virtual networks for the cluster. You can use this method to verify the virtual
    # network settings in the cluster.
    # There are no required parameters for this method. However, to filter the results, you can pass one or more VirtualNetworkID or
    # VirtualNetworkTag values.
    # param: Fixnum virtualNetworkID:  Network ID to filter the list for a single virtual network. 

    # param: Fixnum virtualNetworkTag:  Network tag to filter the list for a single virtual network. 

    # param: Fixnum virtualNetworkIDs:  Network IDs to include in the list. 

    # param: Fixnum virtualNetworkTags:  Network tag to include in the list. 
    ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVirtualNetworks'
    }

    if virtual_network_id != nil
      check_parameter(virtual_network_id, 'virtual_network_id', Fixnum)
      payload['params']['virtualNetworkID'] = virtual_network_id
    end
    if virtual_network_tag != nil
      check_parameter(virtual_network_tag, 'virtual_network_tag', Fixnum)
      payload['params']['virtualNetworkTag'] = virtual_network_tag
    end
    if virtual_network_ids != nil
      check_parameter(virtual_network_ids, 'virtual_network_ids', Fixnum)
      payload['params']['virtualNetworkIDs'] = virtual_network_ids
    end
    if virtual_network_tags != nil
      check_parameter(virtual_network_tags, 'virtual_network_tags', Fixnum)
      payload['params']['virtualNetworkTags'] = virtual_network_tags
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualNetworksResult.new(raw_response) : nil
  end

  def list_virtual_networks_with_object(r)
    if r.virtual_network_id == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkID in the request object."
    end
    if r.virtual_network_tag == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTag in the request object."
    end
    if r.virtual_network_ids == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkIDs in the request object."
    end
    if r.virtual_network_tags == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTags in the request object."
    end
    list_virtual_networks(r.virtual_network_id, r.virtual_network_tag, r.virtual_network_ids, r.virtual_network_tags)
  end

  def modify_virtual_network(virtual_network_id = nil, virtual_network_tag = nil, name = nil, address_blocks = nil, netmask = nil, svip = nil, gateway = nil, namespace = nil, attributes = nil)
    ######
    # You can use ModifyVirtualNetwork to change the attributes of an existing virtual network. This method enables you to add or remove
    # address blocks, change the netmask, or modify the name or description of the virtual network. You can also use it to enable or
    # disable namespaces, as well as add or remove a gateway if namespaces are enabled on the virtual network.
    # Note: This method requires either the VirtualNetworkID or the VirtualNetworkTag as a parameter, but not both.
    # Caution: Enabling or disabling the Routable Storage VLANs functionality for an existing virtual network by changing the
    # "namespace" parameter disrupts any traffic handled by the virtual network. NetApp strongly recommends changing the
    # "namespace" parameter only during a scheduled maintenance window.
    # param: Fixnum virtualNetworkID:  The unique identifier of the virtual network to modify. This is the virtual network ID assigned by the cluster.  Note: This parameter is optional but either virtualNetworkID or virtualNetworkTag must be specified with this API method. 

    # param: Fixnum virtualNetworkTag:  The network tag that identifies the virtual network to modify. Note: This parameter is optional but either virtualNetworkID or virtualNetworkTag must be specified with this API method. 

    # param: str name:  The new name for the virtual network. 

    # param: AddressBlock addressBlocks:  The new addressBlock to set for this virtual network. This might contain new address blocks to add to the existing object or omit unused address blocks that need to be removed. Alternatively, you can extend or reduce the size of existing address blocks. You can only increase the size of the starting addressBlocks for a virtual network object; you can never decrease it. Attributes for this parameter are: start: The start of the IP address range. (String) size: The number of IP addresses to include in the block. (Integer) 

    # param: str netmask:  New network mask for this virtual network. 

    # param: str svip:  The storage virtual IP address for this virtual network. The svip for a virtual network cannot be changed. You must create a new virtual network to use a different svip address. 

    # param: str gateway:  The IP address of a gateway of the virtual network. This parameter is only valid if the "namespace" parameter is set to true. 

    # param: bool namespace:  When set to true, enables Routable Storage VLANs functionality by recreating the virtual network and configuring a namespace to contain it. When set to false, disables the VRF functionality for the virtual network. Changing this value disrupts traffic running through this virtual network. 

    # param: dict attributes:  A new list of name-value pairs in JSON object format. 
    ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ModifyVirtualNetwork'
    }

    if virtual_network_id != nil
      check_parameter(virtual_network_id, 'virtual_network_id', Fixnum)
      payload['params']['virtualNetworkID'] = virtual_network_id
    end
    if virtual_network_tag != nil
      check_parameter(virtual_network_tag, 'virtual_network_tag', Fixnum)
      payload['params']['virtualNetworkTag'] = virtual_network_tag
    end
    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if address_blocks != nil
      check_parameter(address_blocks, 'address_blocks', AddressBlock)
      payload['params']['addressBlocks'] = address_blocks
    end
    if netmask != nil
      check_parameter(netmask, 'netmask', str)
      payload['params']['netmask'] = netmask
    end
    if svip != nil
      check_parameter(svip, 'svip', str)
      payload['params']['svip'] = svip
    end
    if gateway != nil
      check_parameter(gateway, 'gateway', str)
      payload['params']['gateway'] = gateway
    end
    if namespace != nil
      check_parameter(namespace, 'namespace', bool)
      payload['params']['namespace'] = namespace
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? AddVirtualNetworkResult.new(raw_response) : nil
  end

  def modify_virtual_network_with_object(r)
    if r.virtual_network_id == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkID in the request object."
    end
    if r.virtual_network_tag == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTag in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.address_blocks == nil
      raise "Before you can run this command, you need to set the param, addressBlocks in the request object."
    end
    if r.netmask == nil
      raise "Before you can run this command, you need to set the param, netmask in the request object."
    end
    if r.svip == nil
      raise "Before you can run this command, you need to set the param, svip in the request object."
    end
    if r.gateway == nil
      raise "Before you can run this command, you need to set the param, gateway in the request object."
    end
    if r.namespace == nil
      raise "Before you can run this command, you need to set the param, namespace in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_virtual_network(r.virtual_network_id, r.virtual_network_tag, r.name, r.address_blocks, r.netmask, r.svip, r.gateway, r.namespace, r.attributes)
  end

  def remove_virtual_network(virtual_network_id = nil, virtual_network_tag = nil)
    ######
    # RemoveVirtualNetwork enables you to remove a previously added virtual network.
    # Note: This method requires either the virtualNetworkID or the virtualNetworkTag as a parameter, but not both.
    # param: Fixnum virtualNetworkID:  Network ID that identifies the virtual network to remove. 

    # param: Fixnum virtualNetworkTag:  Network tag that identifies the virtual network to remove. 
    ######

    check_connection(7, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'RemoveVirtualNetwork'
    }

    if virtual_network_id != nil
      check_parameter(virtual_network_id, 'virtual_network_id', Fixnum)
      payload['params']['virtualNetworkID'] = virtual_network_id
    end
    if virtual_network_tag != nil
      check_parameter(virtual_network_tag, 'virtual_network_tag', Fixnum)
      payload['params']['virtualNetworkTag'] = virtual_network_tag
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RemoveVirtualNetworkResult.new(raw_response) : nil
  end

  def remove_virtual_network_with_object(r)
    if r.virtual_network_id == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkID in the request object."
    end
    if r.virtual_network_tag == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTag in the request object."
    end
    remove_virtual_network(r.virtual_network_id, r.virtual_network_tag)
  end

  def bind_virtual_volumes(virtual_volume_ids, virtual_volume_host_id, bind_context)
    ######
    # BindVirtualVolume binds a VVol with a Host.
    # param: UUID virtualVolumeIDs: [required] The UUID of the VVol to bind. 

    # param: UUID virtualVolumeHostID: [required] The UUID of the ESX host. 

    # param: str bindContext: [required] Normal or Start? 
    ######

    check_connection(None, 'Cluster')

    check_parameter(virtual_volume_ids, 'virtual_volume_ids', 'UUID')

    check_parameter(virtual_volume_host_id, 'virtual_volume_host_id', 'UUID')

    check_parameter(bind_context, 'bind_context', String)

    payload = {
        'params' => {
            'virtualVolumeIDs' => virtual_volume_ids,
            'virtualVolumeHostID' => virtual_volume_host_id,
            'bindContext' => bind_context
        },
        'method' => 'BindVirtualVolumes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeBindingListResult.new(raw_response) : nil
  end

  def bind_virtual_volumes_with_object(r)
    if r.virtual_volume_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeIDs in the request object."
    end
    if r.virtual_volume_host_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeHostID in the request object."
    end
    if r.bind_context == nil
      raise "Before you can run this command, you need to set the param, bindContext in the request object."
    end
    bind_virtual_volumes(r.virtual_volume_ids, r.virtual_volume_host_id, r.bind_context)
  end

  def cancel_virtual_volume_task(virtual_volume_task_id)
    ######
    # CancelVirtualVolumeTask attempts to cancel the VVol Async Task.
    # param: UUID virtualVolumeTaskID: [required] The UUID of the VVol Task to cancel. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_task_id, 'virtual_volume_task_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeTaskID' => virtual_volume_task_id
        },
        'method' => 'CancelVirtualVolumeTask'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def cancel_virtual_volume_task_with_object(r)
    if r.virtual_volume_task_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeTaskID in the request object."
    end
    cancel_virtual_volume_task(r.virtual_volume_task_id)
  end

  def clone_virtual_volume(virtual_volume_id, name = nil, qos = nil)
    ######
    # CloneVirtualVolume is used to execute a VMware Virtual Volume clone.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume to clone. 

    # param: str name:  The name for the newly-created volume. 

    # param: QoS qos:  New quality of service settings for this volume. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id
        },
        'method' => 'CloneVirtualVolume'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeAsyncResult.new(raw_response) : nil
  end

  def clone_virtual_volume_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    clone_virtual_volume(r.virtual_volume_id, r.name, r.qos)
  end

  def copy_diffs_to_virtual_volume(virtual_volume_id, base_virtual_volume_id, dst_virtual_volume_id)
    ######
    # CopyDiffsToVirtualVolume is a three-way merge function.
    # param: UUID virtualVolumeID: [required] The ID of the snapshot Virtual Volume. 

    # param: UUID baseVirtualVolumeID: [required] The ID of the base Virtual Volume. 

    # param: UUID dstVirtualVolumeID: [required] The ID of the Virtual Volume to be overwritten. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    check_parameter(base_virtual_volume_id, 'base_virtual_volume_id', 'UUID')

    check_parameter(dst_virtual_volume_id, 'dst_virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id,
            'baseVirtualVolumeID' => base_virtual_volume_id,
            'dstVirtualVolumeID' => dst_virtual_volume_id
        },
        'method' => 'CopyDiffsToVirtualVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeAsyncResult.new(raw_response) : nil
  end

  def copy_diffs_to_virtual_volume_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.base_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, baseVirtualVolumeID in the request object."
    end
    if r.dst_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, dstVirtualVolumeID in the request object."
    end
    copy_diffs_to_virtual_volume(r.virtual_volume_id, r.base_virtual_volume_id, r.dst_virtual_volume_id)
  end

  def create_virtual_volume(name, storage_container_id, virtual_volume_type, total_size, qos = nil, metadata = nil)
    ######
    # CreateVirtualVolume is used to create a new (empty) Virtual Volume on the cluster.
    # When the volume is created successfully it is available for connection via PE.
    # param: str name: [required] Name of the Virtual Volume. Not required to be unique, but it is recommended. May be 1 to 64 characters in length. 

    # param: UUID storageContainerID: [required] UUID for the Storage Container of this volume. 

    # param: str virtualVolumeType: [required] VMW_TYPE value for this volume. 

    # param: Fixnum totalSize: [required] Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size. 

    # param: QoS qos:  Initial quality of service settings for this volume.  Volumes created without specified QoS values are created with the default values for QoS. Default values for a volume can be found by running the GetDefaultQoS method. 

    # param: dict metadata:  List of name/value pairs to save in the volume's metadata. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(name, 'name', String)

    check_parameter(storage_container_id, 'storage_container_id', 'UUID')

    check_parameter(virtual_volume_type, 'virtual_volume_type', String)

    check_parameter(total_size, 'total_size', 'Fixnum')

    payload = {
        'params' => {
            'name' => name,
            'storageContainerID' => storage_container_id,
            'virtualVolumeType' => virtual_volume_type,
            'totalSize' => total_size
        },
        'method' => 'CreateVirtualVolume'
    }

    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    if metadata != nil
      check_parameter(metadata, 'metadata', dict)
      payload['params']['metadata'] = metadata
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeSyncResult.new(raw_response) : nil
  end

  def create_virtual_volume_with_object(r)
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.storage_container_id == nil
      raise "Before you can run this command, you need to set the param, storageContainerID in the request object."
    end
    if r.virtual_volume_type == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeType in the request object."
    end
    if r.total_size == nil
      raise "Before you can run this command, you need to set the param, totalSize in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    if r.metadata == nil
      raise "Before you can run this command, you need to set the param, metadata in the request object."
    end
    create_virtual_volume(r.name, r.storage_container_id, r.virtual_volume_type, r.total_size, r.qos, r.metadata)
  end

  def create_virtual_volume_host(virtual_volume_host_id, cluster_id, visible_protocol_endpoint_ids = nil, host_address = nil)
    ######
    # CreateVirtualVolumeHost creates a new ESX host.
    # param: UUID virtualVolumeHostID: [required] The GUID of the ESX host. 

    # param: UUID clusterID: [required] The GUID of the ESX Cluster. 

    # param: UUID visibleProtocolEndpointIDs:  A list of PEs the host is aware of. 

    # param: str hostAddress:  IP or DNS name for the host. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_host_id, 'virtual_volume_host_id', 'UUID')

    check_parameter(cluster_id, 'cluster_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeHostID' => virtual_volume_host_id,
            'clusterID' => cluster_id
        },
        'method' => 'CreateVirtualVolumeHost'
    }

    if visible_protocol_endpoint_ids != nil
      check_parameter(visible_protocol_endpoint_ids, 'visible_protocol_endpoint_ids', UUID)
      payload['params']['visibleProtocolEndpointIDs'] = visible_protocol_endpoint_ids
    end
    if host_address != nil
      check_parameter(host_address, 'host_address', str)
      payload['params']['hostAddress'] = host_address
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def create_virtual_volume_host_with_object(r)
    if r.virtual_volume_host_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeHostID in the request object."
    end
    if r.cluster_id == nil
      raise "Before you can run this command, you need to set the param, clusterID in the request object."
    end
    if r.visible_protocol_endpoint_ids == nil
      raise "Before you can run this command, you need to set the param, visibleProtocolEndpointIDs in the request object."
    end
    if r.host_address == nil
      raise "Before you can run this command, you need to set the param, hostAddress in the request object."
    end
    create_virtual_volume_host(r.virtual_volume_host_id, r.cluster_id, r.visible_protocol_endpoint_ids, r.host_address)
  end

  def delete_virtual_volumes(virtual_volumes)
    ######
    # DeleteVirtualVolume marks an active volume for deletion.
    # It is purged (permanently deleted) after the cleanup interval elapses.
    # After making a request to delete a volume, any active iSCSI connections to the volume is immediately terminated and no further connections are allowed while the volume is in this state.
    # It is not returned in target discovery requests.
    # 
    # Any snapshots of a volume that has been marked to delete are not affected.
    # Snapshots are kept until the volume is purged from the system.
    # 
    # If a volume is marked for deletion, and it has a bulk volume read or bulk volume write operation in progress, the bulk volume operation is stopped.
    # 
    # If the volume you delete is paired with a volume, replication between the paired volumes is suspended and no data is transferred to it or from it while in a deleted state.
    # The remote volume the deleted volume was paired with enters into a PausedMisconfigured state and data is no integerer sent to it or from the deleted volume.
    # Until the deleted volume is purged, it can be restored and data transfers resumes.
    # If the deleted volume gets purged from the system, the volume it was paired with enters into a StoppedMisconfigured state and the volume pairing status is removed.
    # The purged volume becomes permanently unavailable.
    # param: UUID virtualVolumes: [required] The UUID of the volume to delete. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volumes, 'virtual_volumes', 'UUID')

    payload = {
        'params' => {
            'virtualVolumes' => virtual_volumes
        },
        'method' => 'DeleteVirtualVolumes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def delete_virtual_volumes_with_object(r)
    if r.virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, virtualVolumes in the request object."
    end
    delete_virtual_volumes(r.virtual_volumes)
  end

  def enable_feature(feature)
    ######
    # You can use EnableFeature to enable cluster features that are disabled by default.
    # param: str feature: [required] Indicates which feature to enable. Valid value is: vvols: Enable the NetApp SolidFire VVols cluster feature. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(feature, 'feature', String)

    payload = {
        'params' => {
            'feature' => feature
        },
        'method' => 'EnableFeature'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? EnableFeatureResult.new(raw_response) : nil
  end

  def enable_feature_with_object(r)
    if r.feature == nil
      raise "Before you can run this command, you need to set the param, feature in the request object."
    end
    enable_feature(r.feature)
  end

  def fast_clone_virtual_volume(virtual_volume_id, name = nil, qos = nil)
    ######
    # FastCloneVirtualVolume is used to execute a VMware Virtual Volume fast clone.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume to clone. 

    # param: str name:  The name for the newly-created volume. 

    # param: QoS qos:  New quality of service settings for this volume. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id
        },
        'method' => 'FastCloneVirtualVolume'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeAsyncResult.new(raw_response) : nil
  end

  def fast_clone_virtual_volume_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    fast_clone_virtual_volume(r.virtual_volume_id, r.name, r.qos)
  end

  def get_feature_status(feature = nil)
    ######
    # GetFeatureStatus enables you to retrieve the status of a cluster feature.
    # param: str feature:  Specifies the feature for which the status is returned. Valid value is: vvols: Retrieve status for the NetApp SolidFire VVols cluster feature. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetFeatureStatus'
    }

    if feature != nil
      check_parameter(feature, 'feature', str)
      payload['params']['feature'] = feature
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetFeatureStatusResult.new(raw_response) : nil
  end

  def get_feature_status_with_object(r)
    if r.feature == nil
      raise "Before you can run this command, you need to set the param, feature in the request object."
    end
    get_feature_status(r.feature)
  end

  def get_vasa_provider_info()
    ######
    # Gets the Vasa Provider info######

    check_connection(9.0, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetVasaProviderInfo'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VasaProviderInfoResult.new(raw_response) : nil
  end


  def get_virtual_volume_allocated_bitmap(virtual_volume_id, segment_start, segment_length, chunk_size)
    ######
    # GetVirtualVolumeAllocatedBitmap returns a b64-encoded block of data 
    # representing a bitmap where non-zero bits indicate the allocation of a 
    # segment (LBA range) of the volume.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume. 

    # param: Fixnum segmentStart: [required] Byte offset. 

    # param: Fixnum segmentLength: [required] Byte length adjusted to end on a chunk boundary. 

    # param: Fixnum chunkSize: [required] Number of bytes represented by one bit in the bitmap. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    check_parameter(segment_start, 'segment_start', 'Fixnum')

    check_parameter(segment_length, 'segment_length', 'Fixnum')

    check_parameter(chunk_size, 'chunk_size', 'Fixnum')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id,
            'segmentStart' => segment_start,
            'segmentLength' => segment_length,
            'chunkSize' => chunk_size
        },
        'method' => 'GetVirtualVolumeAllocatedBitmap'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeBitmapResult.new(raw_response) : nil
  end

  def get_virtual_volume_allocated_bitmap_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.segment_start == nil
      raise "Before you can run this command, you need to set the param, segmentStart in the request object."
    end
    if r.segment_length == nil
      raise "Before you can run this command, you need to set the param, segmentLength in the request object."
    end
    if r.chunk_size == nil
      raise "Before you can run this command, you need to set the param, chunkSize in the request object."
    end
    get_virtual_volume_allocated_bitmap(r.virtual_volume_id, r.segment_start, r.segment_length, r.chunk_size)
  end

  def get_virtual_volume_count()
    ######
    # Enables retrieval of the number of virtual volumes currently in the system.######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetVirtualVolumeCount'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVirtualVolumeCountResult.new(raw_response) : nil
  end


  def get_virtual_volume_task_update(virtual_volume_task_id)
    ######
    # GetVirtualVolumeTaskUpdate checks the status of a VVol Async Task.
    # param: UUID virtualVolumeTaskID: [required] The UUID of the VVol Task. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_task_id, 'virtual_volume_task_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeTaskID' => virtual_volume_task_id
        },
        'method' => 'GetVirtualVolumeTaskUpdate'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeTaskResult.new(raw_response) : nil
  end

  def get_virtual_volume_task_update_with_object(r)
    if r.virtual_volume_task_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeTaskID in the request object."
    end
    get_virtual_volume_task_update(r.virtual_volume_task_id)
  end

  def get_virtual_volume_unshared_bitmap(virtual_volume_id, base_virtual_volume_id, segment_start, segment_length, chunk_size)
    ######
    # GetVirtualVolumeAllocatedBitmap returns a b64-encoded block of data 
    # representing a bitmap where non-zero bits indicate that data is not the same 
    # between two volumes for a common segment (LBA range) of the volumes.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume. 

    # param: UUID baseVirtualVolumeID: [required] The ID of the Virtual Volume to compare against. 

    # param: Fixnum segmentStart: [required] Byte offset. 

    # param: Fixnum segmentLength: [required] Byte length adjusted to end on a chunk boundary. 

    # param: Fixnum chunkSize: [required] Number of bytes represented by one bit in the bitmap. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    check_parameter(base_virtual_volume_id, 'base_virtual_volume_id', 'UUID')

    check_parameter(segment_start, 'segment_start', 'Fixnum')

    check_parameter(segment_length, 'segment_length', 'Fixnum')

    check_parameter(chunk_size, 'chunk_size', 'Fixnum')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id,
            'baseVirtualVolumeID' => base_virtual_volume_id,
            'segmentStart' => segment_start,
            'segmentLength' => segment_length,
            'chunkSize' => chunk_size
        },
        'method' => 'GetVirtualVolumeUnsharedBitmap'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeBitmapResult.new(raw_response) : nil
  end

  def get_virtual_volume_unshared_bitmap_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.base_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, baseVirtualVolumeID in the request object."
    end
    if r.segment_start == nil
      raise "Before you can run this command, you need to set the param, segmentStart in the request object."
    end
    if r.segment_length == nil
      raise "Before you can run this command, you need to set the param, segmentLength in the request object."
    end
    if r.chunk_size == nil
      raise "Before you can run this command, you need to set the param, chunkSize in the request object."
    end
    get_virtual_volume_unshared_bitmap(r.virtual_volume_id, r.base_virtual_volume_id, r.segment_start, r.segment_length, r.chunk_size)
  end

  def get_virtual_volume_unshared_chunks(virtual_volume_id, base_virtual_volume_id, segment_start, segment_length, chunk_size)
    ######
    # GetVirtualVolumeAllocatedBitmap scans a VVol segment and returns the number of 
    # chunks not shared between two volumes. This call will return results in less 
    # than 30 seconds. If the specified VVol and the base VVil are not related, an 
    # error is thrown. If the offset/length combination is invalid or out fo range 
    # an error is thrown.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume. 

    # param: UUID baseVirtualVolumeID: [required] The ID of the Virtual Volume to compare against. 

    # param: Fixnum segmentStart: [required] Start Byte offset. 

    # param: Fixnum segmentLength: [required] Length of the scan segment in bytes. 

    # param: Fixnum chunkSize: [required] Number of bytes represented by one bit in the bitmap. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    check_parameter(base_virtual_volume_id, 'base_virtual_volume_id', 'UUID')

    check_parameter(segment_start, 'segment_start', 'Fixnum')

    check_parameter(segment_length, 'segment_length', 'Fixnum')

    check_parameter(chunk_size, 'chunk_size', 'Fixnum')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id,
            'baseVirtualVolumeID' => base_virtual_volume_id,
            'segmentStart' => segment_start,
            'segmentLength' => segment_length,
            'chunkSize' => chunk_size
        },
        'method' => 'GetVirtualVolumeUnsharedChunks'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeUnsharedChunkResult.new(raw_response) : nil
  end

  def get_virtual_volume_unshared_chunks_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.base_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, baseVirtualVolumeID in the request object."
    end
    if r.segment_start == nil
      raise "Before you can run this command, you need to set the param, segmentStart in the request object."
    end
    if r.segment_length == nil
      raise "Before you can run this command, you need to set the param, segmentLength in the request object."
    end
    if r.chunk_size == nil
      raise "Before you can run this command, you need to set the param, chunkSize in the request object."
    end
    get_virtual_volume_unshared_chunks(r.virtual_volume_id, r.base_virtual_volume_id, r.segment_start, r.segment_length, r.chunk_size)
  end

  def list_virtual_volume_bindings(virtual_volume_binding_ids = nil)
    ######
    # ListVirtualVolumeBindings returns a list of all virtual volumes in the cluster that are bound to protocol endpoints.
    # param: Fixnum virtualVolumeBindingIDs:  A list of virtual volume binding IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume bindings. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVirtualVolumeBindings'
    }

    if virtual_volume_binding_ids != nil
      check_parameter(virtual_volume_binding_ids, 'virtual_volume_binding_ids', Fixnum)
      payload['params']['virtualVolumeBindingIDs'] = virtual_volume_binding_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeBindingsResult.new(raw_response) : nil
  end

  def list_virtual_volume_bindings_with_object(r)
    if r.virtual_volume_binding_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeBindingIDs in the request object."
    end
    list_virtual_volume_bindings(r.virtual_volume_binding_ids)
  end

  def list_virtual_volume_hosts(virtual_volume_host_ids = nil)
    ######
    # ListVirtualVolumeHosts returns a list of all virtual volume hosts known to the cluster. A virtual volume host is a VMware ESX host
    # that has initiated a session with the VASA API provider.
    # param: UUID virtualVolumeHostIDs:  A list of virtual volume host IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume hosts. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVirtualVolumeHosts'
    }

    if virtual_volume_host_ids != nil
      check_parameter(virtual_volume_host_ids, 'virtual_volume_host_ids', UUID)
      payload['params']['virtualVolumeHostIDs'] = virtual_volume_host_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeHostsResult.new(raw_response) : nil
  end

  def list_virtual_volume_hosts_with_object(r)
    if r.virtual_volume_host_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeHostIDs in the request object."
    end
    list_virtual_volume_hosts(r.virtual_volume_host_ids)
  end

  def list_virtual_volumes(details = nil, limit = nil, recursive = nil, start_virtual_volume_id = nil, virtual_volume_ids = nil)
    ######
    # ListVirtualVolumes enables you to list the virtual volumes currently in the system. You can use this method to list all virtual volumes,
    # or only list a subset.
    # param: bool details:  Specifies the level of detail about each virtual volume that is returned. Possible values are: true: Include more details about each virtual volume in the response. false: Include the standard level of detail about each virtual volume in the response. 

    # param: Fixnum limit:  The maximum number of virtual volumes to list. 

    # param: bool recursive:  Specifies whether to include information about the children of each virtual volume in the response. Possible values are: true: Include information about the children of each virtual volume in the response. false: Do not include information about the children of each virtual volume in the response. 

    # param: UUID startVirtualVolumeID:  The ID of the virtual volume at which to begin the list. 

    # param: UUID virtualVolumeIDs:  A list of virtual volume IDs for which to retrieve information. If you specify this parameter, the method returns information about only these virtual volumes. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVirtualVolumes'
    }

    if details != nil
      check_parameter(details, 'details', bool)
      payload['params']['details'] = details
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if recursive != nil
      check_parameter(recursive, 'recursive', bool)
      payload['params']['recursive'] = recursive
    end
    if start_virtual_volume_id != nil
      check_parameter(start_virtual_volume_id, 'start_virtual_volume_id', UUID)
      payload['params']['startVirtualVolumeID'] = start_virtual_volume_id
    end
    if virtual_volume_ids != nil
      check_parameter(virtual_volume_ids, 'virtual_volume_ids', UUID)
      payload['params']['virtualVolumeIDs'] = virtual_volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumesResult.new(raw_response) : nil
  end

  def list_virtual_volumes_with_object(r)
    if r.details == nil
      raise "Before you can run this command, you need to set the param, details in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.recursive == nil
      raise "Before you can run this command, you need to set the param, recursive in the request object."
    end
    if r.start_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, startVirtualVolumeID in the request object."
    end
    if r.virtual_volume_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeIDs in the request object."
    end
    list_virtual_volumes(r.details, r.limit, r.recursive, r.start_virtual_volume_id, r.virtual_volume_ids)
  end

  def list_virtual_volume_tasks(virtual_volume_task_ids = nil)
    ######
    # ListVirtualVolumeTasks returns a list of virtual volume tasks in the system.
    # param: UUID virtualVolumeTaskIDs:  A list of virtual volume task IDs for which to retrieve information. If you omit this parameter, the method returns information about all virtual volume tasks. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVirtualVolumeTasks'
    }

    if virtual_volume_task_ids != nil
      check_parameter(virtual_volume_task_ids, 'virtual_volume_task_ids', UUID)
      payload['params']['virtualVolumeTaskIDs'] = virtual_volume_task_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVirtualVolumeTasksResult.new(raw_response) : nil
  end

  def list_virtual_volume_tasks_with_object(r)
    if r.virtual_volume_task_ids == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeTaskIDs in the request object."
    end
    list_virtual_volume_tasks(r.virtual_volume_task_ids)
  end

  def modify_vasa_provider_info(keystore = nil, vasa_provider_id = nil)
    ######
    # Update the Vasa Provider info
    # param: str keystore:  Signed SSL certificate for the Vasa Provider 

    # param: UUID vasaProviderID:  UUID identifying the vasa provider 
    ######

    check_connection(9.0, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ModifyVasaProviderInfo'
    }

    if keystore != nil
      check_parameter(keystore, 'keystore', str)
      payload['params']['keystore'] = keystore
    end
    if vasa_provider_id != nil
      check_parameter(vasa_provider_id, 'vasa_provider_id', UUID)
      payload['params']['vasaProviderID'] = vasa_provider_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def modify_vasa_provider_info_with_object(r)
    if r.keystore == nil
      raise "Before you can run this command, you need to set the param, keystore in the request object."
    end
    if r.vasa_provider_id == nil
      raise "Before you can run this command, you need to set the param, vasaProviderID in the request object."
    end
    modify_vasa_provider_info(r.keystore, r.vasa_provider_id)
  end

  def modify_virtual_volume(virtual_volume_id, qos = nil, total_size = nil)
    ######
    # ModifyVirtualVolume is used to modify settings on an existing virtual volume.
    # param: UUID virtualVolumeID: [required] VvolVolumeID for the volume to be modified. 

    # param: QoS qos:  New quality of service settings for this volume. 

    # param: Fixnum totalSize:  New size of the volume in bytes. Size is rounded up to the nearest 1MiB size. This parameter can only be used to *increase* the size of a volume. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id
        },
        'method' => 'ModifyVirtualVolume'
    }

    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    if total_size != nil
      check_parameter(total_size, 'total_size', Fixnum)
      payload['params']['totalSize'] = total_size
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def modify_virtual_volume_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    if r.total_size == nil
      raise "Before you can run this command, you need to set the param, totalSize in the request object."
    end
    modify_virtual_volume(r.virtual_volume_id, r.qos, r.total_size)
  end

  def modify_virtual_volume_host(virtual_volume_host_id, cluster_id = nil, visible_protocol_endpoint_ids = nil, initiator_names = nil, host_address = nil)
    ######
    # ModifyVirtualVolumeHost changes an existing ESX host.
    # param: UUID virtualVolumeHostID: [required] The GUID of the ESX host. 

    # param: UUID clusterID:  The GUID of the ESX Cluster. 

    # param: UUID visibleProtocolEndpointIDs:  A list of PEs the host is aware of. 

    # param: str initiatorNames:  List of iSCSI initiator IQNs for the host. 

    # param: str hostAddress:  IP or DNS name for the host. 
    ######

    check_connection(None, 'Cluster')

    check_parameter(virtual_volume_host_id, 'virtual_volume_host_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeHostID' => virtual_volume_host_id
        },
        'method' => 'ModifyVirtualVolumeHost'
    }

    if cluster_id != nil
      check_parameter(cluster_id, 'cluster_id', UUID)
      payload['params']['clusterID'] = cluster_id
    end
    if visible_protocol_endpoint_ids != nil
      check_parameter(visible_protocol_endpoint_ids, 'visible_protocol_endpoint_ids', UUID)
      payload['params']['visibleProtocolEndpointIDs'] = visible_protocol_endpoint_ids
    end
    if initiator_names != nil
      check_parameter(initiator_names, 'initiator_names', str)
      payload['params']['initiatorNames'] = initiator_names
    end
    if host_address != nil
      check_parameter(host_address, 'host_address', str)
      payload['params']['hostAddress'] = host_address
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def modify_virtual_volume_host_with_object(r)
    if r.virtual_volume_host_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeHostID in the request object."
    end
    if r.cluster_id == nil
      raise "Before you can run this command, you need to set the param, clusterID in the request object."
    end
    if r.visible_protocol_endpoint_ids == nil
      raise "Before you can run this command, you need to set the param, visibleProtocolEndpointIDs in the request object."
    end
    if r.initiator_names == nil
      raise "Before you can run this command, you need to set the param, initiatorNames in the request object."
    end
    if r.host_address == nil
      raise "Before you can run this command, you need to set the param, hostAddress in the request object."
    end
    modify_virtual_volume_host(r.virtual_volume_host_id, r.cluster_id, r.visible_protocol_endpoint_ids, r.initiator_names, r.host_address)
  end

  def modify_virtual_volume_metadata(virtual_volume_id)
    ######
    # ModifyVirtualVolumeMetadata is used to selectively modify the VVol metadata.
    # param: UUID virtualVolumeID: [required] VvolVolumeID for the volume to be modified. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id
        },
        'method' => 'ModifyVirtualVolumeMetadata'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeNullResult.new(raw_response) : nil
  end

  def modify_virtual_volume_metadata_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    modify_virtual_volume_metadata(r.virtual_volume_id)
  end

  def prepare_virtual_snapshot(virtual_volume_id, name = nil, writable_snapshot = nil)
    ######
    # PrepareVirtualSnapshot is used to set up VMware Virtual Volume snapshot.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume to clone. 

    # param: str name:  The name for the newly-created volume. 

    # param: bool writableSnapshot:  Will the snapshot be writable? 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id
        },
        'method' => 'PrepareVirtualSnapshot'
    }

    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if writable_snapshot != nil
      check_parameter(writable_snapshot, 'writable_snapshot', bool)
      payload['params']['writableSnapshot'] = writable_snapshot
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PrepareVirtualSnapshotResult.new(raw_response) : nil
  end

  def prepare_virtual_snapshot_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.writable_snapshot == nil
      raise "Before you can run this command, you need to set the param, writableSnapshot in the request object."
    end
    prepare_virtual_snapshot(r.virtual_volume_id, r.name, r.writable_snapshot)
  end

  def query_virtual_volume_metadata()
    ######
    # QueryVirtualVolumeMetadata returns a list of VVols matching a metadata query.######

    check_connection(9.0, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'QueryVirtualVolumeMetadata'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? QueryVirtualVolumeMetadataResult.new(raw_response) : nil
  end


  def rollback_virtual_volume(src_virtual_volume_id, dst_virtual_volume_id)
    ######
    # RollbackVirtualVolume is used to restore a VMware Virtual Volume snapshot.
    # param: UUID srcVirtualVolumeID: [required] The ID of the Virtual Volume snapshot. 

    # param: UUID dstVirtualVolumeID: [required] The ID of the Virtual Volume to restore to. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(src_virtual_volume_id, 'src_virtual_volume_id', 'UUID')

    check_parameter(dst_virtual_volume_id, 'dst_virtual_volume_id', 'UUID')

    payload = {
        'params' => {
            'srcVirtualVolumeID' => src_virtual_volume_id,
            'dstVirtualVolumeID' => dst_virtual_volume_id
        },
        'method' => 'RollbackVirtualVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeAsyncResult.new(raw_response) : nil
  end

  def rollback_virtual_volume_with_object(r)
    if r.src_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, srcVirtualVolumeID in the request object."
    end
    if r.dst_virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, dstVirtualVolumeID in the request object."
    end
    rollback_virtual_volume(r.src_virtual_volume_id, r.dst_virtual_volume_id)
  end

  def snapshot_virtual_volume(virtual_volume_id, timeout)
    ######
    # SnapshotVirtualVolume is used to take a VMware Virtual Volume snapshot.
    # param: UUID virtualVolumeID: [required] The ID of the Virtual Volume to clone. 

    # param: Fixnum timeout: [required] Number of seconds to complete or fail. 
    ######

    check_connection(9.0, 'Cluster')

    check_parameter(virtual_volume_id, 'virtual_volume_id', 'UUID')

    check_parameter(timeout, 'timeout', 'Fixnum')

    payload = {
        'params' => {
            'virtualVolumeID' => virtual_volume_id,
            'timeout' => timeout
        },
        'method' => 'SnapshotVirtualVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SnapshotVirtualVolumeResult.new(raw_response) : nil
  end

  def snapshot_virtual_volume_with_object(r)
    if r.virtual_volume_id == nil
      raise "Before you can run this command, you need to set the param, virtualVolumeID in the request object."
    end
    if r.timeout == nil
      raise "Before you can run this command, you need to set the param, timeout in the request object."
    end
    snapshot_virtual_volume(r.virtual_volume_id, r.timeout)
  end

  def unbind_all_virtual_volumes_from_host()
    ######
    # UnbindAllVirtualVolumesFromHost removes all VVol <-> Host binding.######

    check_connection(None, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'UnbindAllVirtualVolumesFromHost'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? UnbindAllVirtualVolumesFromHostResult.new(raw_response) : nil
  end


  def unbind_virtual_volumes(unbind_context)
    ######
    # UnbindGetVirtualVolume removes the VVol <-> Host binding.
    # param: str unbindContext: [required] Normal, Start, or End? 
    ######

    check_connection(None, 'Cluster')

    check_parameter(unbind_context, 'unbind_context', String)

    payload = {
        'params' => {
            'unbindContext' => unbind_context
        },
        'method' => 'UnbindVirtualVolumes'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VirtualVolumeUnbindResult.new(raw_response) : nil
  end

  def unbind_virtual_volumes_with_object(r)
    if r.unbind_context == nil
      raise "Before you can run this command, you need to set the param, unbindContext in the request object."
    end
    unbind_virtual_volumes(r.unbind_context)
  end

  def cancel_clone(clone_id)
    ######
    # CancelClone enables you to stop an ongoing CloneVolume or CopyVolume process. When you cancel a group clone operation, the
    # system completes and removes the operation's associated asyncHandle.
    # param: Fixnum cloneID: [required] The cloneID for the ongoing clone process. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(clone_id, 'clone_id', 'Fixnum')

    payload = {
        'params' => {
            'cloneID' => clone_id
        },
        'method' => 'CancelClone'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CancelCloneResult.new(raw_response) : nil
  end

  def cancel_clone_with_object(r)
    if r.clone_id == nil
      raise "Before you can run this command, you need to set the param, cloneID in the request object."
    end
    cancel_clone(r.clone_id)
  end

  def cancel_group_clone(group_clone_id)
    ######
    # CancelGroupClone enables you to stop an ongoing CloneMultipleVolumes process occurring on a group of volumes. When you cancel
    # a group clone operation, the system completes and removes the operation's associated asyncHandle.
    # param: Fixnum groupCloneID: [required] The cloneID for the ongoing clone process. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(group_clone_id, 'group_clone_id', 'Fixnum')

    payload = {
        'params' => {
            'groupCloneID' => group_clone_id
        },
        'method' => 'CancelGroupClone'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CancelGroupCloneResult.new(raw_response) : nil
  end

  def cancel_group_clone_with_object(r)
    if r.group_clone_id == nil
      raise "Before you can run this command, you need to set the param, groupCloneID in the request object."
    end
    cancel_group_clone(r.group_clone_id)
  end

  def clone_multiple_volumes(volumes, access = nil, group_snapshot_id = nil, new_account_id = nil)
    ######
    # CloneMultipleVolumes enables you to create a clone of a group of specified volumes. You can assign a consistent set of characteristics
    # to a group of multiple volumes when they are cloned together.
    # Before using groupSnapshotID to clone the volumes in a group snapshot, you must create the group snapshot by using the
    # CreateGroupSnapshot API method or the Element OS Web UI. Using groupSnapshotID is optional when cloning multiple volumes.
    # Note: Cloning multiple volumes is allowed if cluster fullness is at stage 2 or 3. Clones are not created when cluster fullness is
    # at stage 4 or 5.
    # param: CloneMultipleVolumeParams volumes: [required] Unique ID for each volume to include in the clone. If optional parameters are not specified, the values are inherited from the source volumes. Required parameter for "volumes" array: volumeID Optional parameters for "volumes" array: access: Can be one of readOnly, readWrite, locked, or replicationTarget attributes: List of name-value pairs in JSON object format. name: New name for the clone. newAccountID: Account ID for the new volumes. newSize: New size Total size of the volume, in bytes. Size is rounded up to the nearest 1MB. 

    # param: str access:  New default access method for the new volumes if not overridden by information passed in the volume's array. 

    # param: Fixnum groupSnapshotID:  ID of the group snapshot to use as a basis for the clone. 

    # param: Fixnum newAccountID:  New account ID for the volumes if not overridden by information passed in the volumes array. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(volumes, 'volumes', 'CloneMultipleVolumeParams')

    payload = {
        'params' => {
            'volumes' => volumes
        },
        'method' => 'CloneMultipleVolumes'
    }

    if access != nil
      check_parameter(access, 'access', str)
      payload['params']['access'] = access
    end
    if group_snapshot_id != nil
      check_parameter(group_snapshot_id, 'group_snapshot_id', Fixnum)
      payload['params']['groupSnapshotID'] = group_snapshot_id
    end
    if new_account_id != nil
      check_parameter(new_account_id, 'new_account_id', Fixnum)
      payload['params']['newAccountID'] = new_account_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CloneMultipleVolumesResult.new(raw_response) : nil
  end

  def clone_multiple_volumes_with_object(r)
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.group_snapshot_id == nil
      raise "Before you can run this command, you need to set the param, groupSnapshotID in the request object."
    end
    if r.new_account_id == nil
      raise "Before you can run this command, you need to set the param, newAccountID in the request object."
    end
    clone_multiple_volumes(r.volumes, r.access, r.group_snapshot_id, r.new_account_id)
  end

  def clone_volume(volume_id, name, new_account_id = nil, new_size = nil, access = nil, snapshot_id = nil, attributes = nil, enable512e = nil)
    ######
    # CloneVolume enables you to create a copy of a volume. This method is asynchronous and might take a variable amount of time to complete. The cloning process begins immediately when you make the CloneVolume request and is representative of the state of the volume when the API method is issued. You can use the GetAsyncResult method to determine when the cloning process is complete and the new volume is available for connections. You can use ListSyncJobs to see the progress of creating the clone.
    # Note: The initial attributes and QoS settings for the volume are inherited from the volume being cloned. You can change these settings with ModifyVolume.
    # Note: Cloned volumes do not inherit volume access group memberships from the source volume.
    # param: Fixnum volumeID: [required] VolumeID for the volume to be cloned. 

    # param: str name: [required] The name of the new cloned volume. Might be 1 to 64 characters in length. 

    # param: Fixnum newAccountID:  AccountID for the owner of the new volume. If unspecified, the accountID of the owner of the volume being cloned is used. 

    # param: Fixnum newSize:  New size of the volume, in bytes. Might be greater or less than the size of the volume being cloned. If unspecified, the volume size is not changed. Size is rounded to the nearest 1MB. 

    # param: str access:  Specifies the level of access allowed for the new volume. Possible values are: readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. If unspecified, the level of access of the volume being cloned is used. replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. If a value is not specified, the access value does not change. 

    # param: Fixnum snapshotID:  ID of the snapshot that is used as the source of the clone. If no ID is provided, the current active volume is used. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 

    # param: bool enable512e:  Should the volume provide 512-byte sector emulation? 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    check_parameter(name, 'name', String)

    payload = {
        'params' => {
            'volumeID' => volume_id,
            'name' => name
        },
        'method' => 'CloneVolume'
    }

    if new_account_id != nil
      check_parameter(new_account_id, 'new_account_id', Fixnum)
      payload['params']['newAccountID'] = new_account_id
    end
    if new_size != nil
      check_parameter(new_size, 'new_size', Fixnum)
      payload['params']['newSize'] = new_size
    end
    if access != nil
      check_parameter(access, 'access', str)
      payload['params']['access'] = access
    end
    if snapshot_id != nil
      check_parameter(snapshot_id, 'snapshot_id', Fixnum)
      payload['params']['snapshotID'] = snapshot_id
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    if enable512e != nil
      check_parameter(enable512e, 'enable512e', bool)
      payload['params']['enable512e'] = enable512e
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CloneVolumeResult.new(raw_response) : nil
  end

  def clone_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.new_account_id == nil
      raise "Before you can run this command, you need to set the param, newAccountID in the request object."
    end
    if r.new_size == nil
      raise "Before you can run this command, you need to set the param, newSize in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    if r.enable512e == nil
      raise "Before you can run this command, you need to set the param, enable512e in the request object."
    end
    clone_volume(r.volume_id, r.name, r.new_account_id, r.new_size, r.access, r.snapshot_id, r.attributes, r.enable512e)
  end

  def copy_volume(volume_id, dst_volume_id, snapshot_id = nil)
    ######
    # CopyVolume enables you to overwrite the data contents of an existing volume with the data contents of another volume (or
    # snapshot). Attributes of the destination volume such as IQN, QoS settings, size, account, and volume access group membership are
    # not changed. The destination volume must already exist and must be the same size as the source volume.
    # NetApp strongly recommends that clients unmount the destination volume before the CopyVolume operation begins. If the
    # destination volume is modified during the copy operation, the changes will be lost.
    # This method is asynchronous and may take a variable amount of time to complete. You can use the GetAsyncResult method to
    # determine when the process has finished, and ListSyncJobs to see the progress of the copy.
    # param: Fixnum volumeID: [required] VolumeID of the volume to be read from. 

    # param: Fixnum dstVolumeID: [required] VolumeID of the volume to be overwritten. 

    # param: Fixnum snapshotID:  ID of the snapshot that is used as the source of the clone. If no ID is provided, the current active volume is used. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    check_parameter(dst_volume_id, 'dst_volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id,
            'dstVolumeID' => dst_volume_id
        },
        'method' => 'CopyVolume'
    }

    if snapshot_id != nil
      check_parameter(snapshot_id, 'snapshot_id', Fixnum)
      payload['params']['snapshotID'] = snapshot_id
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CopyVolumeResult.new(raw_response) : nil
  end

  def copy_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.dst_volume_id == nil
      raise "Before you can run this command, you need to set the param, dstVolumeID in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    copy_volume(r.volume_id, r.dst_volume_id, r.snapshot_id)
  end

  def create_volume(name, account_id, total_size, enable512e, qos = nil, attributes = nil, qos_policy_id = nil)
    ######
    # CreateVolume enables you to create a new (empty) volume on the cluster. As soon as the volume creation is complete, the volume is
    # available for connection via iSCSI.
    # param: str name: [required] The name of the volume access group (might be user specified). Not required to be unique, but recommended. Might be 1 to 64 characters in length. 

    # param: Fixnum accountID: [required] AccountID for the owner of this volume. 

    # param: Fixnum totalSize: [required] Total size of the volume, in bytes. Size is rounded up to the nearest 1MB size. 

    # param: bool enable512e: [required] Specifies whether 512e emulation is enabled or not. Possible values are: true: The volume provides 512-byte sector emulation. false: 512e emulation is not enabled. 

    # param: QoS qos:  Initial quality of service settings for this volume. Default values are used if none are specified. Valid settings are: minIOPS maxIOPS burstIOPS You can get the default values for a volume by using the GetDefaultQoS method. 

    # param: dict attributes:  The list of name-value pairs in JSON object format. Total attribute size must be less than 1000B, or 1KB, including JSON formatting characters. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(name, 'name', String)

    check_parameter(account_id, 'account_id', Fixnum)

    check_parameter(total_size, 'total_size', Fixnum)

    payload = {
        'params' => {
            'name' => name,
            'accountID' => account_id,
            'totalSize' => total_size,
            'enable512e' => enable512e
        },
        'method' => 'CreateVolume'
    }

    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    if qos_policy_id != nil
      check_parameter(qos_policy_id, 'qos_policy_id', Fixnum)
      payload['params']['qosPolicyID'] = qos_policy_id
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateVolumeResult.new(raw_response) : nil
  end

  def create_volume_with_object(r)
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    if r.total_size == nil
      raise "Before you can run this command, you need to set the param, totalSize in the request object."
    end
    if r.enable512e == nil
      raise "Before you can run this command, you need to set the param, enable512e in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_volume(r.name, r.account_id, r.total_size, r.enable512e, r.qos, r.attributes)
  end

  def delete_volume(volume_id)
    ######
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
    # param: Fixnum volumeID: [required] The ID of the volume to be deleted. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'DeleteVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumeResult.new(raw_response) : nil
  end

  def delete_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    delete_volume(r.volume_id)
  end

  def delete_volumes(account_ids = nil, volume_access_group_ids = nil, volume_ids = nil)
    ######
    # DeleteVolumes marks multiple (up to 500) active volumes for deletion. Once marked, the volumes are purged (permanently deleted) after the cleanup interval elapses.The cleanup interval can be set in the SetClusterSettings method. For more information on using this method, see SetClusterSettings on page 1. After making a request to delete volumes, any active iSCSI connections to the volumes are immediately terminated and no further connections are allowed while the volumes are in this state. A marked volume is not returned in target discovery requests. Any snapshots of a volume that has been marked for deletion are not affected. Snapshots are kept until the volume is purged from the system. If a volume is marked for deletion and has a bulk volume read or bulk volume write operation in progress, the bulk volume read or write operation is stopped. If the volumes you delete are paired with a volume, replication between the paired volumes is suspended and no data is transferred to them or from them while in a deleted state. The remote volumes the deleted volumes were paired with enter into a PausedMisconfigured state and data is no integerer sent to them or from the deleted volumes. Until the deleted volumes are purged, they can be restored and data transfers resume. If the deleted volumes are purged from the system, the volumes they were paired with enter into a StoppedMisconfigured state and the volume pairing status is removed. The purged volumes become permanently unavailable.
    # param: Fixnum accountIDs:  A list of account IDs. All volumes from these accounts are deleted from the system.  

    # param: Fixnum volumeAccessGroupIDs:  A list of volume access group IDs. All of the volumes from all of the volume access groups you specify in this list are deleted from the system. 

    # param: Fixnum volumeIDs:  The list of IDs of the volumes to delete from the system. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'DeleteVolumes'
    }

    if account_ids != nil
      check_parameter(account_ids, 'account_ids', Fixnum)
      payload['params']['accountIDs'] = account_ids
    end
    if volume_access_group_ids != nil
      check_parameter(volume_access_group_ids, 'volume_access_group_ids', Fixnum)
      payload['params']['volumeAccessGroupIDs'] = volume_access_group_ids
    end
    if volume_ids != nil
      check_parameter(volume_ids, 'volume_ids', Fixnum)
      payload['params']['volumeIDs'] = volume_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumesResult.new(raw_response) : nil
  end

  def delete_volumes_with_object(r)
    if r.account_ids == nil
      raise "Before you can run this command, you need to set the param, accountIDs in the request object."
    end
    if r.volume_access_group_ids == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupIDs in the request object."
    end
    if r.volume_ids == nil
      raise "Before you can run this command, you need to set the param, volumeIDs in the request object."
    end
    delete_volumes(r.account_ids, r.volume_access_group_ids, r.volume_ids)
  end

  def get_async_result(async_handle, keep_result = nil)
    ######
    # You can use GetAsyncResult to retrieve the result of asynchronous method calls. Some method calls require some time to run, and
    # might not be finished when the system sends the initial response. To obtain the status or result of the method call, use
    # GetAsyncResult to poll the asyncHandle value returned by the method.
    # GetAsyncResult returns the overall status of the operation (in progress, completed, or error) in a standard fashion, but the actual
    # data returned for the operation depends on the original method call and the return data is documented with each method.
    # param: Fixnum asyncHandle: [required] A value that was returned from the original asynchronous method call. 

    # param: bool keepResult:  If true, GetAsyncResult does not remove the asynchronous result upon returning it, enabling future queries to that asyncHandle. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(async_handle, 'async_handle', 'Fixnum')

    payload = {
        'params' => {
            'asyncHandle' => async_handle
        },
        'method' => 'GetAsyncResult'
    }

    if keep_result != nil
      check_parameter(keep_result, 'keep_result', bool)
      payload['params']['keepResult'] = keep_result
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? dict.new(raw_response) : nil
  end

  def get_async_result_with_object(r)
    if r.async_handle == nil
      raise "Before you can run this command, you need to set the param, asyncHandle in the request object."
    end
    if r.keep_result == nil
      raise "Before you can run this command, you need to set the param, keepResult in the request object."
    end
    get_async_result(r.async_handle, r.keep_result)
  end

  def get_default_qos()
    ######
    # GetDefaultQoS enables you to retrieve the default QoS values for a newly created volume.######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetDefaultQoS'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? VolumeQOS.new(raw_response) : nil
  end

  def list_qos_policies()
    ######
    # ListQoSPolicies enables you to retrieve the a list of all QoS Policies.######

  check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListQoSPolicies'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListQoSPoliciesResult.new(raw_response) : nil
  end

  def get_volume_count()
    ######
    # GetVolumeCount enables you to retrieve the number of volumes currently in the system.######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'GetVolumeCount'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeCountResult.new(raw_response) : nil
  end


  def get_volume_efficiency(volume_id)
    ######
    # GetVolumeEfficiency enables you to retrieve information about a volume. Only the volume you give as a parameter in this API method is used to compute the capacity.
    # param: Fixnum volumeID: [required] Specifies the volume for which capacity is computed. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'GetVolumeEfficiency'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeEfficiencyResult.new(raw_response) : nil
  end

  def get_volume_efficiency_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    get_volume_efficiency(r.volume_id)
  end

  def get_volume_stats(volume_id)
    ######
    # GetVolumeStats enables  you to retrieve high-level activity measurements for a single volume. Values are cumulative from the creation of the volume.
    # param: Fixnum volumeID: [required] Specifies the volume for which statistics are gathered. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'GetVolumeStats'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeStatsResult.new(raw_response) : nil
  end

  def get_volume_stats_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    get_volume_stats(r.volume_id)
  end

  def list_active_volumes(start_volume_id = nil, limit = nil, include_virtual_volumes = nil)
    ######
    # ListActiveVolumes enables you to return the list of active volumes currently in the system. The list of volumes is returned sorted in
    # VolumeID order and can be returned in multiple parts (pages).
    # param: Fixnum startVolumeID:  Starting VolumeID to return. If no volume exists with this VolumeID, the next volume by VolumeID order is used as the start of the list. To page through the list, pass the VolumeID of the last volume in the previous response + 1. 

    # param: Fixnum limit:  Maximum number of Volume Info objects to return. A value of 0 (zero) returns all volumes (unlimited). 

    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListActiveVolumes'
    }

    if start_volume_id != nil
      check_parameter(start_volume_id, 'start_volume_id', Fixnum)
      payload['params']['startVolumeID'] = start_volume_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListActiveVolumesResult.new(raw_response) : nil
  end

  def list_active_volumes_with_object(r)
    if r.start_volume_id == nil
      raise "Before you can run this command, you need to set the param, startVolumeID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_active_volumes(r.start_volume_id, r.limit, r.include_virtual_volumes)
  end

  def list_async_results(async_result_types = nil)
    ######
    # You can use ListAsyncResults to list the results of all currently running and completed asynchronous methods on the system.
    # Querying asynchronous results with ListAsyncResults does not cause completed asyncHandles to expire; you can use GetAsyncResult
    # to query any of the asyncHandles returned by ListAsyncResults.
    # param: str asyncResultTypes:  An optional list of types of results. You can use this list to restrict the results to only these types of operations. Possible values are: BulkVolume: Copy operations between volumes, such as backups or restores. Clone: Volume cloning operations. DriveRemoval: Operations involving the system copying data from a drive in preparation to remove it from the cluster. RtfiPendingNode: Operations involving the system installing compatible software on a node before adding it to the cluster 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListAsyncResults'
    }

    if async_result_types != nil
      check_parameter(async_result_types, 'async_result_types', str)
      payload['params']['asyncResultTypes'] = async_result_types
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListAsyncResultsResult.new(raw_response) : nil
  end

  def list_async_results_with_object(r)
    if r.async_result_types == nil
      raise "Before you can run this command, you need to set the param, asyncResultTypes in the request object."
    end
    list_async_results(r.async_result_types)
  end

  def list_bulk_volume_jobs()
    ######
    # ListBulkVolumeJobs enables you to retrieve information about each bulk volume read or write operation that is occurring in the
    # system.######

    check_connection(6, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListBulkVolumeJobs'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListBulkVolumeJobsResult.new(raw_response) : nil
  end


  def list_deleted_volumes(include_virtual_volumes = nil)
    ######
    # ListDeletedVolumes enables you to retrieve the list of volumes that have been marked for deletion and purged from the system.
    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListDeletedVolumes'
    }

    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListDeletedVolumesResult.new(raw_response) : nil
  end

  def list_deleted_volumes_with_object(r)
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_deleted_volumes(r.include_virtual_volumes)
  end

  def list_volumes(start_volume_id = nil, limit = nil, volume_status = nil, accounts = nil, is_paired = nil, volume_ids = nil, volume_name = nil, include_virtual_volumes = nil)
    ######
    # The ListVolumes method enables you to retrieve a list of volumes that are in a cluster. You can specify the volumes you want to
    # return in the list by using the available parameters.
    # param: Fixnum startVolumeID:  Only volumes with an ID greater than or equal to this value are returned. Mutually exclusive with the volumeIDs parameter. 

    # param: Fixnum limit:  Specifies the maximum number of volume results that are returned. Mutually exclusive with the volumeIDs parameter. 

    # param: str volumeStatus:  Only volumes with a status equal to the status value are returned. Possible values are: creating snapshotting active deleted 

    # param: Fixnum accounts:  Returns only the volumes owned by the accounts you specify here. Mutually exclusive with the volumeIDs parameter. 

    # param: bool isPaired:  Returns volumes that are paired or not paired. Possible values are: true: Returns all paired volumes. false: Returns all volumes that are not paired. 

    # param: Fixnum volumeIDs:  A list of volume IDs. If you supply this parameter, other parameters operate only on this set of volumes. Mutually exclusive with the accounts, startVolumeID, and limit parameters. 

    # param: str volumeName:  Only volume object information matching the volume name is returned. 

    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(8, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumes'
    }

    if start_volume_id != nil
      check_parameter(start_volume_id, 'start_volume_id', Fixnum)
      payload['params']['startVolumeID'] = start_volume_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if volume_status != nil
      check_parameter(volume_status, 'volume_status', str)
      payload['params']['volumeStatus'] = volume_status
    end
    if accounts != nil
      check_parameter(accounts, 'accounts', Fixnum)
      payload['params']['accounts'] = accounts
    end
    if is_paired != nil
      check_parameter(is_paired, 'is_paired', bool)
      payload['params']['isPaired'] = is_paired
    end
    if volume_ids != nil
      check_parameter(volume_ids, 'volume_ids', Fixnum)
      payload['params']['volumeIDs'] = volume_ids
    end
    if volume_name != nil
      check_parameter(volume_name, 'volume_name', str)
      payload['params']['volumeName'] = volume_name
    end
    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumesResult.new(raw_response) : nil
  end

  def list_volumes_with_object(r)
    if r.start_volume_id == nil
      raise "Before you can run this command, you need to set the param, startVolumeID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.volume_status == nil
      raise "Before you can run this command, you need to set the param, volumeStatus in the request object."
    end
    if r.accounts == nil
      raise "Before you can run this command, you need to set the param, accounts in the request object."
    end
    if r.is_paired == nil
      raise "Before you can run this command, you need to set the param, isPaired in the request object."
    end
    if r.volume_ids == nil
      raise "Before you can run this command, you need to set the param, volumeIDs in the request object."
    end
    if r.volume_name == nil
      raise "Before you can run this command, you need to set the param, volumeName in the request object."
    end
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_volumes(r.start_volume_id, r.limit, r.volume_status, r.accounts, r.is_paired, r.volume_ids, r.volume_name, r.include_virtual_volumes)
  end

  def list_volumes_for_account(account_id, start_volume_id = nil, limit = nil, include_virtual_volumes = nil)
    ######
    # ListVolumesForAccount returns the list of active and (pending) deleted volumes for an account.
    # param: Fixnum accountID: [required] Returns all volumes owned by this AccountID. 

    # param: Fixnum startVolumeID:  The ID of the first volume to list. This can be useful for paging results. By default, this starts at the lowest VolumeID. 

    # param: Fixnum limit:  The maximum number of volumes to return from the API. 

    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(account_id, 'account_id', 'Fixnum')

    payload = {
        'params' => {
            'accountID' => account_id
        },
        'method' => 'ListVolumesForAccount'
    }

    if start_volume_id != nil
      check_parameter(start_volume_id, 'start_volume_id', Fixnum)
      payload['params']['startVolumeID'] = start_volume_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumesForAccountResult.new(raw_response) : nil
  end

  def list_volumes_for_account_with_object(r)
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    if r.start_volume_id == nil
      raise "Before you can run this command, you need to set the param, startVolumeID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_volumes_for_account(r.account_id, r.start_volume_id, r.limit, r.include_virtual_volumes)
  end

  def list_volume_stats_by_account(accounts = nil, include_virtual_volumes = nil)
    ######
    # ListVolumeStatsByAccount returns high-level activity measurements for every account. Values are summed from all the volumes owned by the account.
    # param: Fixnum accounts:  One or more account ids by which to filter the result. 

    # param: bool includeVirtualVolumes:  Includes virtual volumes in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeStatsByAccount'
    }

    if accounts != nil
      check_parameter(accounts, 'accounts', Fixnum)
      payload['params']['accounts'] = accounts
    end
    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByAccountResult.new(raw_response) : nil
  end

  def list_volume_stats_by_account_with_object(r)
    if r.accounts == nil
      raise "Before you can run this command, you need to set the param, accounts in the request object."
    end
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_volume_stats_by_account(r.accounts, r.include_virtual_volumes)
  end

  def list_volume_stats_by_volume(include_virtual_volumes = nil)
    ######
    # ListVolumeStatsByVolume returns high-level activity measurements for every volume, by volume. Values are cumulative from the
    # creation of the volume.
    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(1, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeStatsByVolume'
    }

    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVolumeResult.new(raw_response) : nil
  end

  def list_volume_stats_by_volume_with_object(r)
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_volume_stats_by_volume(r.include_virtual_volumes)
  end

  def list_volume_stats_by_volume_access_group(volume_access_groups = nil, include_virtual_volumes = nil)
    ######
    # ListVolumeStatsByVolumeAccessGroup enables you to get total activity measurements for all of the volumes that are a member of the
    # specified volume access group(s).
    # param: Fixnum volumeAccessGroups:  An array of VolumeAccessGroupIDs for which volume activity is returned. If omitted, statistics for all volume access groups are returned. 

    # param: bool includeVirtualVolumes:  Specifies that virtual volumes are included in the response by default. To exclude virtual volumes, set to false. 
    ######

    check_connection(5, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeStatsByVolumeAccessGroup'
    }

    if volume_access_groups != nil
      check_parameter(volume_access_groups, 'volume_access_groups', Fixnum)
      payload['params']['volumeAccessGroups'] = volume_access_groups
    end
    if include_virtual_volumes != nil
      check_parameter(include_virtual_volumes, 'include_virtual_volumes', bool)
      payload['params']['includeVirtualVolumes'] = include_virtual_volumes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeStatsByVolumeAccessGroupResult.new(raw_response) : nil
  end

  def list_volume_stats_by_volume_access_group_with_object(r)
    if r.volume_access_groups == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroups in the request object."
    end
    if r.include_virtual_volumes == nil
      raise "Before you can run this command, you need to set the param, includeVirtualVolumes in the request object."
    end
    list_volume_stats_by_volume_access_group(r.volume_access_groups, r.include_virtual_volumes)
  end

  def modify_volume(volume_id, account_id = nil, access = nil, qos = nil, total_size = nil, set_create_time = nil, create_time = nil, attributes = nil)
    ######
    # ModifyVolume enables you to modify settings on an existing volume. You can make modifications to one volume at a time and
    # changes take place immediately. If you do not specify QoS values when you modify a volume, they remain the same as before the modification. You can retrieve
    # default QoS values for a newly created volume by running the GetDefaultQoS method.
    # When you need to increase the size of a volume that is being replicated, do so in the following order to prevent replication errors:
    # 1. Increase the size of the "Replication Target" volume.
    # 2. Increase the size of the source or "Read / Write" volume.
    # NetApp recommends that both the target and source volumes are the same size.
    # Note: If you change the "access" status to locked or target, all existing iSCSI connections are terminated.
    # param: Fixnum volumeID: [required] VolumeID for the volume to be modified. 

    # param: Fixnum accountID:  AccountID to which the volume is reassigned. If unspecified, the previous account name is used. 

    # param: str access:  Specifies the access allowed for the volume. Possible values are: readOnly: Only read operations are allowed. readWrite: Reads and writes are allowed. locked: No reads or writes are allowed. If not specified, the access value does not change. replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked. If a value is not specified, the access value does not change. 

    # param: QoS qos:  New QoS settings for this volume. If not specified, the QoS settings are not changed. 

    # param: Fixnum totalSize:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB. This parameter can only be used to increase the size of a volume. 

    # param: bool setCreateTime:  If set to true, changes the recorded date of volume creation. 

    # param: str createTime:  An ISO 8601 date string to set as the new volume creation date. Required if "setCreateTime" is set to true. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'ModifyVolume'
    }

    if account_id != nil
      check_parameter(account_id, 'account_id', Fixnum)
      payload['params']['accountID'] = account_id
    end
    if access != nil
      check_parameter(access, 'access', str)
      payload['params']['access'] = access
    end
    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    if total_size != nil
      check_parameter(total_size, 'total_size', Fixnum)
      payload['params']['totalSize'] = total_size
    end
    if set_create_time != nil
      check_parameter(set_create_time, 'set_create_time', bool)
      payload['params']['setCreateTime'] = set_create_time
    end
    if create_time != nil
      check_parameter(create_time, 'create_time', str)
      payload['params']['createTime'] = create_time
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeResult.new(raw_response) : nil
  end

  def modify_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    if r.total_size == nil
      raise "Before you can run this command, you need to set the param, totalSize in the request object."
    end
    if r.set_create_time == nil
      raise "Before you can run this command, you need to set the param, setCreateTime in the request object."
    end
    if r.create_time == nil
      raise "Before you can run this command, you need to set the param, createTime in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_volume(r.volume_id, r.account_id, r.access, r.qos, r.total_size, r.set_create_time, r.create_time, r.attributes)
  end

  def modify_volumes(volume_ids, account_id = nil, access = nil, qos = nil, total_size = nil, attributes = nil)
    ######
    # ModifyVolumes allows you to configure up to 500 existing volumes at one time. Changes take place immediately. If ModifyVolumes fails to modify any of the specified volumes, none of the specified volumes are changed.If you do not specify QoS values when you modify volumes, the QoS values for each volume remain unchanged. You can retrieve default QoS values for a newly created volume by running the GetDefaultQoS method.When you need to increase the size of volumes that are being replicated, do so in the following order to prevent replication errors:Increase the size of the "Replication Target" volume.Increase the size of the source or "Read / Write" volume. recommends that both the target and source volumes be the same size.NOTE: If you change access status to locked or replicationTarget all existing iSCSI connections are terminated.
    # param: Fixnum volumeIDs: [required] A list of volumeIDs for the volumes to be modified. 

    # param: Fixnum accountID:  AccountID to which the volume is reassigned. If none is specified, the previous account name is used. 

    # param: str access:  Access allowed for the volume. Possible values:readOnly: Only read operations are allowed.readWrite: Reads and writes are allowed.locked: No reads or writes are allowed.If not specified, the access value does not change.replicationTarget: Identify a volume as the target volume for a paired set of volumes. If the volume is not paired, the access status is locked.If a value is not specified, the access value does not change.  

    # param: QoS qos:  New quality of service settings for this volume.If not specified, the QoS settings are not changed. 

    # param: Fixnum totalSize:  New size of the volume in bytes. 1000000000 is equal to 1GB. Size is rounded up to the nearest 1MB in size. This parameter can only be used to increase the size of a volume. 

    # param: dict attributes:  List of name/value pairs in JSON object format. 
    ######

    check_connection(9, 'Cluster')

    check_parameter(volume_ids, 'volume_ids', 'Fixnum')

    payload = {
        'params' => {
            'volumeIDs' => volume_ids
        },
        'method' => 'ModifyVolumes'
    }

    if account_id != nil
      check_parameter(account_id, 'account_id', Fixnum)
      payload['params']['accountID'] = account_id
    end
    if access != nil
      check_parameter(access, 'access', str)
      payload['params']['access'] = access
    end
    if qos != nil
      check_parameter(qos, 'qos', QoS)
      payload['params']['qos'] = qos
    end
    if total_size != nil
      check_parameter(total_size, 'total_size', Fixnum)
      payload['params']['totalSize'] = total_size
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumesResult.new(raw_response) : nil
  end

  def modify_volumes_with_object(r)
    if r.volume_ids == nil
      raise "Before you can run this command, you need to set the param, volumeIDs in the request object."
    end
    if r.account_id == nil
      raise "Before you can run this command, you need to set the param, accountID in the request object."
    end
    if r.access == nil
      raise "Before you can run this command, you need to set the param, access in the request object."
    end
    if r.qos == nil
      raise "Before you can run this command, you need to set the param, qos in the request object."
    end
    if r.total_size == nil
      raise "Before you can run this command, you need to set the param, totalSize in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_volumes(r.volume_ids, r.account_id, r.access, r.qos, r.total_size, r.attributes)
  end

  def purge_deleted_volume(volume_id)
    ######
    # PurgeDeletedVolume immediately and permanently purges a volume that has been deleted. You must delete a volume using
    # DeleteVolume before it can be purged. Volumes are purged automatically after a period of time, so usage of this method is not
    # typically required.
    # param: Fixnum volumeID: [required] The ID of the volume to be purged. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'PurgeDeletedVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PurgeDeletedVolumeResult.new(raw_response) : nil
  end

  def purge_deleted_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    purge_deleted_volume(r.volume_id)
  end

  def purge_deleted_volumes(volume_ids = nil, account_ids = nil, volume_access_group_ids = nil)
    ######
    # PurgeDeletedVolumes immediately and permanently purges volumes that have been deleted; you can use this method to purge up to 500 volumes at one time. You must delete volumes using DeleteVolumes before they can be purged. Volumes are purged by the system automatically after a period of time, so usage of this method is not typically required.
    # param: Fixnum volumeIDs:  A list of volumeIDs of volumes to be purged from the system. 

    # param: Fixnum accountIDs:  A list of accountIDs. All of the volumes from all of the specified accounts are purged from the system. 

    # param: Fixnum volumeAccessGroupIDs:  A list of volumeAccessGroupIDs. All of the volumes from all of the specified Volume Access Groups are purged from the system. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'PurgeDeletedVolumes'
    }

    if volume_ids != nil
      check_parameter(volume_ids, 'volume_ids', Fixnum)
      payload['params']['volumeIDs'] = volume_ids
    end
    if account_ids != nil
      check_parameter(account_ids, 'account_ids', Fixnum)
      payload['params']['accountIDs'] = account_ids
    end
    if volume_access_group_ids != nil
      check_parameter(volume_access_group_ids, 'volume_access_group_ids', Fixnum)
      payload['params']['volumeAccessGroupIDs'] = volume_access_group_ids
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? PurgeDeletedVolumesResult.new(raw_response) : nil
  end

  def purge_deleted_volumes_with_object(r)
    if r.volume_ids == nil
      raise "Before you can run this command, you need to set the param, volumeIDs in the request object."
    end
    if r.account_ids == nil
      raise "Before you can run this command, you need to set the param, accountIDs in the request object."
    end
    if r.volume_access_group_ids == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupIDs in the request object."
    end
    purge_deleted_volumes(r.volume_ids, r.account_ids, r.volume_access_group_ids)
  end

  def restore_deleted_volume(volume_id)
    ######
    # RestoreDeletedVolume marks a deleted volume as active again. This action makes the volume immediately available for iSCSI connection.
    # param: Fixnum volumeID: [required] VolumeID of the deleted volume to be restored. 
    ######

    check_connection(1, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeID' => volume_id
        },
        'method' => 'RestoreDeletedVolume'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? RestoreDeletedVolumeResult.new(raw_response) : nil
  end

  def restore_deleted_volume_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    restore_deleted_volume(r.volume_id)
  end

  def set_default_qos(min_iops = nil, max_iops = nil, burst_iops = nil)
    ######
    # SetDefaultQoS enables you to configure the default Quality of Service (QoS) values (measured in inputs and outputs per second, or
    # IOPS) for a volume. For more information about QoS in a SolidFire cluster, see the User Guide.
    # param: Fixnum minIOPS:  The minimum number of sustained IOPS provided by the cluster to a volume. 

    # param: Fixnum maxIOPS:  The maximum number of sustained IOPS provided by the cluster to a volume. 

    # param: Fixnum burstIOPS:  The maximum number of IOPS allowed in a short burst scenario. 
    ######

    check_connection(9, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'SetDefaultQoS'
    }

    if min_iops != nil
      check_parameter(min_iops, 'min_iops', Fixnum)
      payload['params']['minIOPS'] = min_iops
    end
    if max_iops != nil
      check_parameter(max_iops, 'max_iops', Fixnum)
      payload['params']['maxIOPS'] = max_iops
    end
    if burst_iops != nil
      check_parameter(burst_iops, 'burst_iops', Fixnum)
      payload['params']['burstIOPS'] = burst_iops
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? SetDefaultQoSResult.new(raw_response) : nil
  end

  def set_default_qos_with_object(r)
    if r.min_iops == nil
      raise "Before you can run this command, you need to set the param, minIOPS in the request object."
    end
    if r.max_iops == nil
      raise "Before you can run this command, you need to set the param, maxIOPS in the request object."
    end
    if r.burst_iops == nil
      raise "Before you can run this command, you need to set the param, burstIOPS in the request object."
    end
    set_default_qos(r.min_iops, r.max_iops, r.burst_iops)
  end

  def start_bulk_volume_read(volume_id, format, snapshot_id = nil, script = nil, script_parameters = nil, attributes = nil)
    ######
    # StartBulkVolumeRead enables you to initialize a bulk volume read session on a specified volume. Only two bulk volume processes
    # can run simultaneously on a volume. When you initialize the session, data is read from a SolidFire storage volume for the purposes
    # of storing the data on an external backup source. The external data is accessed by a web server running on an SF-series node.
    # Communications and server interaction information for external data access is passed by a script running on the storage system.
    # At the start of a bulk volume read operation, a snapshot of the volume is made and the snapshot is deleted when the read is complete. You can also read a snapshot of the volume by entering the ID of the snapshot as a parameter. When you read a
    # previous snapshot, the system does not create a new snapshot of the volume or delete the previous snapshot when the
    # read completes.
    # Note: This process creates a new snapshot if the ID of an existing snapshot is not provided. Snapshots can be created if cluster fullness is at stage 2 or 3. Snapshots are not created when cluster fullness is at stage 4 or 5.
    # param: Fixnum volumeID: [required] The ID of the volume to be read. 

    # param: str format: [required] The format of the volume data. It can be either of the following formats: uncompressed: Every byte of the volume is returned without any compression. native: Opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write. 

    # param: Fixnum snapshotID:  The ID of a previously created snapshot used for bulk volume reads. If no ID is entered, a snapshot of the current active volume image is made. 

    # param: str script:  The executable name of a script. If unspecified, the key and URL is necessary to access SF-series nodes. The script is run on the primary node and the key and URL is returned to the script so the local web server can be contacted. 

    # param: dict scriptParameters:  JSON parameters to pass to the script. 

    # param: dict attributes:  JSON attributes for the bulk volume job. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    check_parameter(format, 'format', String)

    payload = {
        'params' => {
            'volumeID' => volume_id,
            'format' => format
        },
        'method' => 'StartBulkVolumeRead'
    }

    if snapshot_id != nil
      check_parameter(snapshot_id, 'snapshot_id', Fixnum)
      payload['params']['snapshotID'] = snapshot_id
    end
    if script != nil
      check_parameter(script, 'script', str)
      payload['params']['script'] = script
    end
    if script_parameters != nil
      check_parameter(script_parameters, 'script_parameters', dict)
      payload['params']['scriptParameters'] = script_parameters
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartBulkVolumeReadResult.new(raw_response) : nil
  end

  def start_bulk_volume_read_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.format == nil
      raise "Before you can run this command, you need to set the param, format in the request object."
    end
    if r.snapshot_id == nil
      raise "Before you can run this command, you need to set the param, snapshotID in the request object."
    end
    if r.script == nil
      raise "Before you can run this command, you need to set the param, script in the request object."
    end
    if r.script_parameters == nil
      raise "Before you can run this command, you need to set the param, scriptParameters in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    start_bulk_volume_read(r.volume_id, r.format, r.snapshot_id, r.script, r.script_parameters, r.attributes)
  end

  def start_bulk_volume_write(volume_id, format, script = nil, script_parameters = nil, attributes = nil)
    ######
    # StartBulkVolumeWrite enables you to initialize a bulk volume write session on a specified volume. Only two bulk volume processes can run simultaneously on a volume. When you initialize the write session, data is written to a SolidFire storage volume from an external backup source. The external data is accessed by a web server running on an SF-series node. Communications and server
    # interaction information for external data access is passed by a script running on the storage system.
    # param: Fixnum volumeID: [required] The ID of the volume to be written to. 

    # param: str format: [required] The format of the volume data. It can be either of the following formats: uncompressed: Every byte of the volume is returned without any compression. native: Opaque data is returned that is smaller and more efficiently stored and written on a subsequent bulk volume write. 

    # param: str script:  The executable name of a script. If unspecified, the key and URL are necessary to access SF-series nodes. The script runs on the primary node and the key and URL is returned to the script, so the local web server can be contacted. 

    # param: dict scriptParameters:  JSON parameters to pass to the script. 

    # param: dict attributes:  JSON attributes for the bulk volume job. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_id, 'volume_id', 'Fixnum')

    check_parameter(format, 'format', String)

    payload = {
        'params' => {
            'volumeID' => volume_id,
            'format' => format
        },
        'method' => 'StartBulkVolumeWrite'
    }

    if script != nil
      check_parameter(script, 'script', str)
      payload['params']['script'] = script
    end
    if script_parameters != nil
      check_parameter(script_parameters, 'script_parameters', dict)
      payload['params']['scriptParameters'] = script_parameters
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? StartBulkVolumeWriteResult.new(raw_response) : nil
  end

  def start_bulk_volume_write_with_object(r)
    if r.volume_id == nil
      raise "Before you can run this command, you need to set the param, volumeID in the request object."
    end
    if r.format == nil
      raise "Before you can run this command, you need to set the param, format in the request object."
    end
    if r.script == nil
      raise "Before you can run this command, you need to set the param, script in the request object."
    end
    if r.script_parameters == nil
      raise "Before you can run this command, you need to set the param, scriptParameters in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    start_bulk_volume_write(r.volume_id, r.format, r.script, r.script_parameters, r.attributes)
  end

  def update_bulk_volume_status(key, status, percent_complete = nil, message = nil, attributes = nil)
    ######
    # You can use UpdateBulkVolumeStatus in a script to update the status of a bulk volume job that you started with the
    # StartBulkVolumeRead or StartBulkVolumeWrite methods.
    # param: str key: [required] The key assigned during initialization of a StartBulkVolumeRead or StartBulkVolumeWrite session. 

    # param: str status: [required] The status of the given bulk volume job. The system sets the status. Possible values are:  running: Jobs that are still active. complete: Jobs that are done. failed: Jobs that failed. 

    # param: str percentComplete:  The completed progress of the bulk volume job as a percentage value. 

    # param: str message:  The message returned indicating the status of the bulk volume job after the job is complete. 

    # param: dict attributes:  JSON attributes; updates what is on the bulk volume job. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(key, 'key', String)

    check_parameter(status, 'status', String)

    payload = {
        'params' => {
            'key' => key,
            'status' => status
        },
        'method' => 'UpdateBulkVolumeStatus'
    }

    if percent_complete != nil
      check_parameter(percent_complete, 'percent_complete', str)
      payload['params']['percentComplete'] = percent_complete
    end
    if message != nil
      check_parameter(message, 'message', str)
      payload['params']['message'] = message
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? UpdateBulkVolumeStatusResult.new(raw_response) : nil
  end

  def update_bulk_volume_status_with_object(r)
    if r.key == nil
      raise "Before you can run this command, you need to set the param, key in the request object."
    end
    if r.status == nil
      raise "Before you can run this command, you need to set the param, status in the request object."
    end
    if r.percent_complete == nil
      raise "Before you can run this command, you need to set the param, percentComplete in the request object."
    end
    if r.message == nil
      raise "Before you can run this command, you need to set the param, message in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    update_bulk_volume_status(r.key, r.status, r.percent_complete, r.message, r.attributes)
  end

  def add_initiators_to_volume_access_group(volume_access_group_id, initiators)
    ######
    # AddInitiatorsToVolumeAccessGroup enables you
    # to add initiators to a specified volume access group.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group to modify. 

    # param: str initiators: [required] The list of initiators to add to the volume access group. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    check_parameter(initiators, 'initiators', String)

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id,
            'initiators' => initiators
        },
        'method' => 'AddInitiatorsToVolumeAccessGroup'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def add_initiators_to_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    add_initiators_to_volume_access_group(r.volume_access_group_id, r.initiators)
  end

  def add_volumes_to_volume_access_group(volume_access_group_id, volumes)
    ######
    # AddVolumesToVolumeAccessGroup enables you to add
    # volumes to a specified volume access group.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group to which volumes are added. 

    # param: Fixnum volumes: [required] The list of volumes to add to the volume access group. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    check_parameter(volumes, 'volumes', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id,
            'volumes' => volumes
        },
        'method' => 'AddVolumesToVolumeAccessGroup'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def add_volumes_to_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    add_volumes_to_volume_access_group(r.volume_access_group_id, r.volumes)
  end

  def create_qos_policy(name, qos)
    ######
    # CreateQoSPolicy enables you to create a QoS Policy.
    #
    # param: str name: [required] The name of the QoS Policy Might be 1 to 64 characters in length.
    #
    # param: QoS qos:  Initial quality of service settings for this volume. Default values are used if none are specified. Valid settings are: minIOPS maxIOPS burstIOPS You can get the default values for a volume by using the GetDefaultQoS method.

    check_connection(5, 'Cluster')

    check_parameter(name, 'name', String)

    check_parameter(qos, 'qos', QoS)

    payload = {
        'params' => {
            'name' => name,
            'qos' => qos.to_hash
        },
        'method' => 'CreateQoSPolicy'
    }
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateQoSPolicyResult.new(raw_response) : nil
  end

  def create_volume_access_group(name, initiators = nil, volumes = nil, virtual_network_id = nil, virtual_network_tags = nil, attributes = nil)
    ######
    # You can use CreateVolumeAccessGroup to create a new volume access group. When you create the volume access group, you need to give it a name, and you can optionally enter initiators and volumes. After you create the group, you can add volumes and initiator IQNs. Any initiator IQN that you add to the volume access group is able to access any volume in the group without CHAP authentication.
    # param: str name: [required] The name for this volume access group. Not required to be unique, but recommended. 

    # param: str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators are not modified. 

    # param: Fixnum volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes are not modified. 

    # param: Fixnum virtualNetworkID:  The ID of the SolidFire virtual network to associate the volume access group with. 

    # param: Fixnum virtualNetworkTags:  The ID of the SolidFire virtual network to associate the volume access group with. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(name, 'name', String)

    payload = {
        'params' => {
            'name' => name
        },
        'method' => 'CreateVolumeAccessGroup'
    }

    if initiators != nil
      check_parameter(initiators, 'initiators', str)
      payload['params']['initiators'] = initiators
    end
    if volumes != nil
      check_parameter(volumes, 'volumes', Fixnum)
      payload['params']['volumes'] = volumes
    end
    if virtual_network_id != nil
      check_parameter(virtual_network_id, 'virtual_network_id', Fixnum)
      payload['params']['virtualNetworkID'] = virtual_network_id
    end
    if virtual_network_tags != nil
      check_parameter(virtual_network_tags, 'virtual_network_tags', Fixnum)
      payload['params']['virtualNetworkTags'] = virtual_network_tags
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? CreateVolumeAccessGroupResult.new(raw_response) : nil
  end

  def create_volume_access_group_with_object(r)
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    if r.virtual_network_id == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkID in the request object."
    end
    if r.virtual_network_tags == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTags in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    create_volume_access_group(r.name, r.initiators, r.volumes, r.virtual_network_id, r.virtual_network_tags, r.attributes)
  end

  def delete_volume_access_group(volume_access_group_id)
    ######
    # DeleteVolumeAccessGroup enables you to delete a
    # volume access group.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group to be deleted. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id
        },
        'method' => 'DeleteVolumeAccessGroup'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? DeleteVolumeAccessGroupResult.new(raw_response) : nil
  end

  def delete_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    delete_volume_access_group(r.volume_access_group_id)
  end

  def get_volume_access_group_efficiency(volume_access_group_id)
    ######
    # GetVolumeAccessGroupEfficiency enables you to
    # retrieve efficiency information about a volume access
    # group. Only the volume access group you provide as the
    # parameter in this API method is used to compute the
    # capacity.
    # param: Fixnum volumeAccessGroupID: [required] The volume access group for which capacity is computed. 
    ######

    check_connection(6, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id
        },
        'method' => 'GetVolumeAccessGroupEfficiency'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetEfficiencyResult.new(raw_response) : nil
  end

  def get_volume_access_group_efficiency_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    get_volume_access_group_efficiency(r.volume_access_group_id)
  end

  def get_volume_access_group_lun_assignments(volume_access_group_id)
    ######
    # The GetVolumeAccessGroupLunAssignments
    # method enables you to retrieve details on LUN mappings
    # of a specified volume access group.
    # param: Fixnum volumeAccessGroupID: [required] The unique volume access group ID used to return information. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id
        },
        'method' => 'GetVolumeAccessGroupLunAssignments'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? GetVolumeAccessGroupLunAssignmentsResult.new(raw_response) : nil
  end

  def get_volume_access_group_lun_assignments_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    get_volume_access_group_lun_assignments(r.volume_access_group_id)
  end

  def list_volume_access_groups(start_volume_access_group_id = nil, limit = nil)
    ######
    # ListVolumeAccessGroups enables you to return
    # information about the volume access groups that are
    # currently in the system.
    # param: Fixnum startVolumeAccessGroupID:  The volume access group ID at which to begin the listing. If unspecified, there is no lower limit (implicitly 0). 

    # param: Fixnum limit:  The maximum number of results to return. This can be useful for paging. 
    ######

    check_connection(5, 'Cluster')

    payload = {
        'params' => {
        },
        'method' => 'ListVolumeAccessGroups'
    }

    if start_volume_access_group_id != nil
      check_parameter(start_volume_access_group_id, 'start_volume_access_group_id', Fixnum)
      payload['params']['startVolumeAccessGroupID'] = start_volume_access_group_id
    end
    if limit != nil
      check_parameter(limit, 'limit', Fixnum)
      payload['params']['limit'] = limit
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ListVolumeAccessGroupsResult.new(raw_response) : nil
  end

  def list_volume_access_groups_with_object(r)
    if r.start_volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, startVolumeAccessGroupID in the request object."
    end
    if r.limit == nil
      raise "Before you can run this command, you need to set the param, limit in the request object."
    end
    list_volume_access_groups(r.start_volume_access_group_id, r.limit)
  end

  def modify_volume_access_group(volume_access_group_id, virtual_network_id = nil, virtual_network_tags = nil, name = nil, initiators = nil, volumes = nil, delete_orphan_initiators = nil, attributes = nil)
    ######
    # You can use ModifyVolumeAccessGroup to update initiators and add or remove volumes from a volume access group. If a specified initiator or volume is a duplicate of what currently exists, the volume access group is left as-is. If you do not specify a value for volumes or initiators, the current list of initiators and volumes is not changed.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group to modify. 

    # param: Fixnum virtualNetworkID:  The ID of the SolidFire virtual network to associate the volume access group with. 

    # param: Fixnum virtualNetworkTags:  The ID of the SolidFire virtual network to associate the volume access group with. 

    # param: str name:  The new name for this volume access group. Not required to be unique, but recommended. 

    # param: str initiators:  List of initiators to include in the volume access group. If unspecified, the access group's configured initiators are not modified. 

    # param: Fixnum volumes:  List of volumes to initially include in the volume access group. If unspecified, the access group's volumes are not modified. 

    # param: bool deleteOrphanInitiators:  true: Delete initiator objects after they are removed from a volume access group. false: Do not delete initiator objects after they are removed from a volume access group. 

    # param: dict attributes:  List of name-value pairs in JSON object format. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id
        },
        'method' => 'ModifyVolumeAccessGroup'
    }

    if virtual_network_id != nil
      check_parameter(virtual_network_id, 'virtual_network_id', Fixnum)
      payload['params']['virtualNetworkID'] = virtual_network_id
    end
    if virtual_network_tags != nil
      check_parameter(virtual_network_tags, 'virtual_network_tags', Fixnum)
      payload['params']['virtualNetworkTags'] = virtual_network_tags
    end
    if name != nil
      check_parameter(name, 'name', str)
      payload['params']['name'] = name
    end
    if initiators != nil
      check_parameter(initiators, 'initiators', str)
      payload['params']['initiators'] = initiators
    end
    if volumes != nil
      check_parameter(volumes, 'volumes', Fixnum)
      payload['params']['volumes'] = volumes
    end
    if delete_orphan_initiators != nil
      check_parameter(delete_orphan_initiators, 'delete_orphan_initiators', bool)
      payload['params']['deleteOrphanInitiators'] = delete_orphan_initiators
    end
    if attributes != nil
      check_parameter(attributes, 'attributes', dict)
      payload['params']['attributes'] = attributes
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def modify_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.virtual_network_id == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkID in the request object."
    end
    if r.virtual_network_tags == nil
      raise "Before you can run this command, you need to set the param, virtualNetworkTags in the request object."
    end
    if r.name == nil
      raise "Before you can run this command, you need to set the param, name in the request object."
    end
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    if r.delete_orphan_initiators == nil
      raise "Before you can run this command, you need to set the param, deleteOrphanInitiators in the request object."
    end
    if r.attributes == nil
      raise "Before you can run this command, you need to set the param, attributes in the request object."
    end
    modify_volume_access_group(r.volume_access_group_id, r.virtual_network_id, r.virtual_network_tags, r.name, r.initiators, r.volumes, r.delete_orphan_initiators, r.attributes)
  end

  def modify_volume_access_group_lun_assignments(volume_access_group_id, lun_assignments)
    ######
    # The ModifyVolumeAccessGroupLunAssignments
    # method enables you to define custom LUN assignments
    # for specific volumes. This method changes only LUN
    # values set on the lunAssignments parameter in the
    # volume access group. All other LUN assignments remain
    # unchanged. LUN assignment values must be unique for volumes in a volume access group. You cannot define duplicate LUN values within a volume access group. However, you can use the same LUN values again in different volume access groups. 
    # Note: Correct LUN values are 0 through 16383. The system generates an exception if you pass a LUN value outside of this range. None of the specified LUN assignments are modified if there is an exception. 
    # Caution: If you change a LUN assignment for a volume with active I/O, the I/O can be disrupted. You might need to change the server configuration before changing volume LUN assignments.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group for which the LUN assignments will be modified. 

    # param: LunAssignment lunAssignments: [required] The volume IDs with new assigned LUN values. 
    ######

    check_connection(7, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    check_parameter(lun_assignments, 'lun_assignments', 'LunAssignment')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id,
            'lunAssignments' => lun_assignments
        },
        'method' => 'ModifyVolumeAccessGroupLunAssignments'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupLunAssignmentsResult.new(raw_response) : nil
  end

  def modify_volume_access_group_lun_assignments_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.lun_assignments == nil
      raise "Before you can run this command, you need to set the param, lunAssignments in the request object."
    end
    modify_volume_access_group_lun_assignments(r.volume_access_group_id, r.lun_assignments)
  end

  def remove_initiators_from_volume_access_group(volume_access_group_id, initiators, delete_orphan_initiators = nil)
    ######
    # RemoveInitiatorsFromVolumeAccessGroup enables
    # you to remove initiators from a specified volume access
    # group.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group from which the initiators are removed. 

    # param: str initiators: [required] The list of initiators to remove from the volume access group. 

    # param: bool deleteOrphanInitiators:  true: Delete initiator objects after they are removed from a volume access group. false: Do not delete initiator objects after they are removed from a volume access group. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    check_parameter(initiators, 'initiators', String)

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id,
            'initiators' => initiators
        },
        'method' => 'RemoveInitiatorsFromVolumeAccessGroup'
    }

    if delete_orphan_initiators != nil
      check_parameter(delete_orphan_initiators, 'delete_orphan_initiators', bool)
      payload['params']['deleteOrphanInitiators'] = delete_orphan_initiators
    end
    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def remove_initiators_from_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.initiators == nil
      raise "Before you can run this command, you need to set the param, initiators in the request object."
    end
    if r.delete_orphan_initiators == nil
      raise "Before you can run this command, you need to set the param, deleteOrphanInitiators in the request object."
    end
    remove_initiators_from_volume_access_group(r.volume_access_group_id, r.initiators, r.delete_orphan_initiators)
  end

  def remove_volumes_from_volume_access_group(volume_access_group_id, volumes)
    ######
    # The RemoveVolumeFromVolumeAccessGroup method enables you to remove volumes from a volume access group.
    # param: Fixnum volumeAccessGroupID: [required] The ID of the volume access group to remove volumes from. 

    # param: Fixnum volumes: [required] The ID of the volume access group to remove volumes from. 
    ######

    check_connection(5, 'Cluster')

    check_parameter(volume_access_group_id, 'volume_access_group_id', 'Fixnum')

    check_parameter(volumes, 'volumes', 'Fixnum')

    payload = {
        'params' => {
            'volumeAccessGroupID' => volume_access_group_id,
            'volumes' => volumes
        },
        'method' => 'RemoveVolumesFromVolumeAccessGroup'
    }

    json_payload = payload
    raw_response = send_request(json_payload)
    return raw_response ? ModifyVolumeAccessGroupResult.new(raw_response) : nil
  end

  def remove_volumes_from_volume_access_group_with_object(r)
    if r.volume_access_group_id == nil
      raise "Before you can run this command, you need to set the param, volumeAccessGroupID in the request object."
    end
    if r.volumes == nil
      raise "Before you can run this command, you need to set the param, volumes in the request object."
    end
    remove_volumes_from_volume_access_group(r.volume_access_group_id, r.volumes)
  end

end

