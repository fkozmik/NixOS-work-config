{ config, pkgs, ... }:
{
  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    osquery = {
      enable = true;
      flags = {
        enroll_secret_path = "/home/fkozmik/.config/osquery/enroll_secret";
        tls_hostname = "laptops.fleetdm.enalean.com:443";
        tls_server_certs = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
        enroll_tls_endpoint = "/api/v1/osquery/enroll";
        config_plugin = "tls";
        config_tls_endpoint = "/api/v1/osquery/config";
        config_refresh = "600";
        disable_distributed = "false";
        distributed_plugin = "tls";
        distributed_tls_max_attempts = "10";
        distributed_tls_read_endpoint = "/api/v1/osquery/distributed/read";
        distributed_tls_write_endpoint = "/api/v1/osquery/distributed/write";
        logger_plugin = "tls";
        logger_tls_endpoint = "/api/v1/osquery/log";
        host-identifier = "uuid";
        enable_syslog = "false";
        disable_events = "false";
        enable_bpf_events = "true";
      };
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };
}

