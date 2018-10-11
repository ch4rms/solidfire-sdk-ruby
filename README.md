# Solidfire
This is the solidfire gem. Feel free to use it to your heart's content, but be aware that this gem is in the develop phase. Any version you use will be a beta version until the gem is officially released. As such, it may have latent bugs. Feel free to contact Ariel Hoffman for help and bugfixes at ariel.hoffman@netapp.com.

## Installation
You'll have to install the gemfile from source.

1. Clone this project onto your machine.
2. Set up your RVM or version of Ruby. RVM stands for ruby version manager. It is very helpful for troubleshooting. For more info about RVMs, see https://rvm.io/. 
3. Execute the following commands:

```ruby
gem build solidfire.gemspec
gem install solidfire-0.1.1.gem
```
Now the gem should be installed on your version of Ruby!

## Quick Start
To get a basic script up and running, I recommend first establishing a connection with the ElementFactory class as follows:

```ruby
# Import the module
require 'solidfire'
# Set up a connection. There are two ways to do this - directly or indirectly.
# This is the indirect method and it contains a whole bunch of checks and logging
# features, so I recommend you use it. The direct method has basically the same
# interface though. You just call it on Element.new instead of ElementFactory.create
@user = 'admin'
@pass = 'admin'
@host = '10.117.61.44'
e = ElementFactory.create(host, user, pass)
# Now you can run your first command!
# The ruby sdk supports all the same functionality as the Fluorine API does.
e.list_accounts() # This will list the accounts
e.get_account_by_id(3065) # This will get a specific account

```

To see the full list of commands supported, navigate into lib/solidfire/element.rb. All the available commands are in that file.

## Connections
You can establish connections using one of two mechanisms:
1. ElementFactory.create
This is the recommended mechanism for establishing a connection. Consistent with our other SDKs, this method will run a bunch of preliminary checks to ensure that your connection is legit. In particular, it verifies the version you try to connect with. The SDK supports all versions >7.0 and the cluster is contstrained to whatever the latest release is. ElementFactory will negotiate versioning for you.
2. Element.new
This is the direct method. It will just attempt to create a connection if it can. If it can't, it'll just time out. If you want to use this, you may get a slight performance bump because ElementFactory.create calls GetAPI to verify the version and Element.new doesn't. However, the cost is that you'll be on your own when it comes to dealing with error cases.

## Commands Supported
Below is a list of all the commands the Ruby SDK supports.

add_account

get_account_by_id

get_account_by_name

get_account_efficiency

list_accounts

modify_account

remove_account

create_backup_target

get_backup_target

list_backup_targets

modify_backup_target

remove_backup_target

add_cluster_admin

clear_cluster_faults

create_cluster

create_support_bundle

delete_all_support_bundles

disable_encryption_at_rest

disable_snmp

enable_encryption_at_rest

enable_snmp

get_api

get_cluster_capacity

get_cluster_config

get_cluster_full_threshold

get_cluster_info

get_cluster_master_node_id

get_cluster_state

get_cluster_stats

get_cluster_version_info

get_current_cluster_admin

get_limits

get_ntp_info

get_snmp_acl

get_snmp_info

get_snmp_state

get_snmp_trap_info

get_system_status

list_cluster_admins

list_cluster_faults

list_events

list_sync_jobs

modify_cluster_admin

modify_cluster_full_threshold

remove_cluster_admin

set_cluster_config

set_ntp_info

set_snmp_acl

set_snmp_info

set_snmp_trap_info

snmp_send_test_traps

add_drives

get_drive_config

get_drive_hardware_info

get_drive_stats

list_drive_hardware

list_drives

remove_drives

reset_drives

secure_erase_drives

test_drives

get_cluster_hardware_info

get_hardware_config

get_node_hardware_info

get_nvram_info

create_initiators

delete_initiators

list_initiators

modify_initiators

add_ldap_cluster_admin

disable_ldap_authentication

enable_ldap_authentication

get_ldap_configuration

test_ldap_authentication

get_login_session_info

get_remote_logging_hosts

set_login_session_info

set_remote_logging_hosts

list_fibre_channel_port_info

list_fibre_channel_sessions

list_iscsisessions

list_network_interfaces

list_node_fibre_channel_port_info

add_nodes

get_bootstrap_config

get_config

get_network_config

get_node_stats

get_origin

get_pending_operation

list_active_nodes

list_all_nodes

list_node_stats

list_pending_active_nodes

list_pending_nodes

remove_nodes

set_config

set_network_config

complete_cluster_pairing

complete_volume_pairing

list_active_paired_volumes

list_cluster_pairs

modify_volume_pair

remove_cluster_pair

remove_volume_pair

start_cluster_pairing

start_volume_pairing

list_protocol_endpoints

reset_node

restart_networking

restart_services

shutdown

get_ipmi_config

get_ipmi_info

list_services

invoke_sfapi

create_group_snapshot

create_schedule

create_snapshot

delete_group_snapshot

delete_snapshot

get_schedule

list_group_snapshots

list_schedules

list_snapshots

modify_group_snapshot

modify_schedule

modify_snapshot

rollback_to_group_snapshot

rollback_to_snapshot

get_complete_stats

get_hardware_info

get_raw_stats

list_drive_stats

list_volume_stats

list_volume_stats_by_virtual_volume

create_storage_container

delete_storage_containers

get_storage_container_efficiency

list_storage_containers

modify_storage_container

list_tests

list_utilities

test_connect_ensemble

test_connect_mvip

test_connect_svip

test_ping

add_virtual_network

list_virtual_networks

modify_virtual_network

remove_virtual_network

bind_virtual_volumes

cancel_virtual_volume_task

clone_virtual_volume

copy_diffs_to_virtual_volume

create_virtual_volume

create_virtual_volume_host

delete_virtual_volumes

enable_feature

fast_clone_virtual_volume

get_feature_status

get_vasa_provider_info

get_virtual_volume_allocated_bitmap

get_virtual_volume_count

get_virtual_volume_task_update

get_virtual_volume_unshared_bitmap

get_virtual_volume_unshared_chunks

list_virtual_volume_bindings

list_virtual_volume_hosts

list_virtual_volumes

list_virtual_volume_tasks

modify_vasa_provider_info

modify_virtual_volume

modify_virtual_volume_host

modify_virtual_volume_metadata

prepare_virtual_snapshot

query_virtual_volume_metadata

rollback_virtual_volume

snapshot_virtual_volume

unbind_all_virtual_volumes_from_host

unbind_virtual_volumes

cancel_clone

cancel_group_clone

clone_multiple_volumes

clone_volume

copy_volume

create_volume

delete_volume

delete_volumes

get_async_result

get_default_qos

get_volume_count

get_volume_efficiency

get_volume_stats

list_active_volumes

list_async_results

list_bulk_volume_jobs

list_deleted_volumes

list_volumes

list_volumes_for_account

list_volume_stats_by_account

list_volume_stats_by_volume

list_volume_stats_by_volume_access_group

modify_volume

modify_volumes

purge_deleted_volume

purge_deleted_volumes

restore_deleted_volume

set_default_qos

start_bulk_volume_read

start_bulk_volume_write

update_bulk_volume_status

add_initiators_to_volume_access_group

add_volumes_to_volume_access_group

create_volume_access_group

delete_volume_access_group

get_volume_access_group_efficiency

get_volume_access_group_lun_assignments

list_volume_access_groups

modify_volume_access_group

modify_volume_access_group_lun_assignments

remove_initiators_from_volume_access_group

remove_volumes_from_volume_access_group

add_account

get_account_by_id

get_account_by_name

get_account_efficiency

list_accounts

modify_account

remove_account

create_backup_target

get_backup_target

list_backup_targets

modify_backup_target

remove_backup_target

add_cluster_admin

clear_cluster_faults

create_cluster

create_support_bundle

delete_all_support_bundles

disable_encryption_at_rest

disable_snmp

enable_encryption_at_rest

enable_snmp

get_api

get_cluster_capacity

get_cluster_config

get_cluster_full_threshold

get_cluster_info

get_cluster_master_node_id

get_cluster_state

get_cluster_stats

get_cluster_version_info

get_current_cluster_admin

get_limits

get_ntp_info

get_snmp_acl

get_snmp_info

get_snmp_state

get_snmp_trap_info

get_system_status

list_cluster_admins

list_cluster_faults

list_events

list_sync_jobs

modify_cluster_admin

modify_cluster_full_threshold

remove_cluster_admin

set_cluster_config

set_ntp_info

set_snmp_acl

set_snmp_info

set_snmp_trap_info

snmp_send_test_traps

add_drives

get_drive_config

get_drive_hardware_info

get_drive_stats

list_drive_hardware

list_drives

remove_drives

reset_drives

secure_erase_drives

test_drives

get_cluster_hardware_info

get_hardware_config

get_node_hardware_info

get_nvram_info

create_initiators

delete_initiators

list_initiators

modify_initiators

add_ldap_cluster_admin

disable_ldap_authentication

enable_ldap_authentication

get_ldap_configuration

test_ldap_authentication

get_login_session_info

get_remote_logging_hosts

set_login_session_info

set_remote_logging_hosts

list_fibre_channel_port_info

list_fibre_channel_sessions

list_iscsisessions

list_network_interfaces

list_node_fibre_channel_port_info

add_nodes

get_bootstrap_config

get_config

get_network_config

get_node_stats

get_origin

get_pending_operation

list_active_nodes

list_all_nodes

list_node_stats

list_pending_active_nodes

list_pending_nodes

remove_nodes

set_config

set_network_config

complete_cluster_pairing

complete_volume_pairing

list_active_paired_volumes

list_cluster_pairs

modify_volume_pair

remove_cluster_pair

remove_volume_pair

start_cluster_pairing

start_volume_pairing

list_protocol_endpoints

reset_node

restart_networking

restart_services

shutdown

get_ipmi_config

get_ipmi_info

list_services

invoke_sfapi

create_group_snapshot

create_schedule

create_snapshot

delete_group_snapshot

delete_snapshot

get_schedule

list_group_snapshots

list_schedules

list_snapshots

modify_group_snapshot

modify_schedule

modify_snapshot

rollback_to_group_snapshot

rollback_to_snapshot

get_complete_stats

get_hardware_info

get_raw_stats

list_drive_stats

list_volume_stats

list_volume_stats_by_virtual_volume

create_storage_container

delete_storage_containers

get_storage_container_efficiency

list_storage_containers

modify_storage_container

list_tests

list_utilities

test_connect_ensemble

test_connect_mvip

test_connect_svip

test_ping

add_virtual_network

list_virtual_networks

modify_virtual_network

remove_virtual_network

bind_virtual_volumes

cancel_virtual_volume_task

clone_virtual_volume

copy_diffs_to_virtual_volume

create_virtual_volume

create_virtual_volume_host

delete_virtual_volumes

enable_feature

fast_clone_virtual_volume

get_feature_status

get_vasa_provider_info

get_virtual_volume_allocated_bitmap

get_virtual_volume_count

get_virtual_volume_task_update

get_virtual_volume_unshared_bitmap

get_virtual_volume_unshared_chunks

list_virtual_volume_bindings

list_virtual_volume_hosts

list_virtual_volumes

list_virtual_volume_tasks

modify_vasa_provider_info

modify_virtual_volume

modify_virtual_volume_host

modify_virtual_volume_metadata

prepare_virtual_snapshot

query_virtual_volume_metadata

rollback_virtual_volume

snapshot_virtual_volume

unbind_all_virtual_volumes_from_host

unbind_virtual_volumes

cancel_clone

cancel_group_clone

clone_multiple_volumes

clone_volume

copy_volume

create_volume

delete_volume

delete_volumes

get_async_result

get_default_qos

get_volume_count

get_volume_efficiency

get_volume_stats

list_active_volumes

list_async_results

list_bulk_volume_jobs

list_deleted_volumes

list_volumes

list_volumes_for_account

list_volume_stats_by_account

list_volume_stats_by_volume

list_volume_stats_by_volume_access_group

modify_volume

modify_volumes

purge_deleted_volume

purge_deleted_volumes

restore_deleted_volume

set_default_qos

start_bulk_volume_read

start_bulk_volume_write

update_bulk_volume_status

add_initiators_to_volume_access_group

add_volumes_to_volume_access_group

create_volume_access_group

delete_volume_access_group

get_volume_access_group_efficiency

get_volume_access_group_lun_assignments

list_volume_access_groups

modify_volume_access_group

modify_volume_access_group_lun_assignments

remove_initiators_from_volume_access_group

remove_volumes_from_volume_access_group

