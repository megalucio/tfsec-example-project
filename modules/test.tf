resource "google_compute_firewall" "identity_aware_proxy" {
  name        = "identity-aware-proxy"
  network     = data.google_compute_network.default.self_link
  description = "Allow connection to VMs on private subnetwork via IAP"

  allow {
    protocol = "tcp"
  }

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  # IP range of Cloud IAP network
  # https://cloud.google.com/iap/docs/using-tcp-forwarding
  source_ranges = ["35.235.240.0/20"]
}