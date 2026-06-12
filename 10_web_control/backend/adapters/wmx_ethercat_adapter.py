"""Compatibility wrapper for the former direct WMX EtherCAT adapter.

Runtime access now routes through EthercatBridgeAdapter and its Python 3.6
bridge process. This class remains only so old imports keep resolving.
"""

from __future__ import annotations

from adapters.ethercat_bridge_adapter import EthercatBridgeAdapter


class WmxEthercatAdapter(EthercatBridgeAdapter):
    name = "ethercat_bridge"
