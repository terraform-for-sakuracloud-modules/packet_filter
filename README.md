# packet_filter

## 概要

さくらのクラウド用パケットフィルターモジュールです。
以下の通信が許可され、それ以外の通信は拒否されます。

  - SSH (tcp:デフォルト22番)
  - Web (tcp:80番、tcp:443番) 
  - NTPサーバーからのレスポンス(udp:123) #送信元のデフォルト値は`ntp1.sakura.ad.jp`
  - サーバー発通信の戻りパケット(TCP/UDP 32,768～61,000番ポート)
  - 全てのICMPパケット
  - 全てのfragmentパケット
  
## Variables

| 変数名        | 名称     | デフォルト値 | 説明       | 
|--------------|----------|---------|---------------|
|name          | 名称      | `packet_filter`    | - |
|zone          | ゾーン    |  `is1b`            | - |
|ssh_source_nw | SSH送信元 |  `0.0.0.0/0`      | - |
|ssh_port      | SSHポート |  `22`             | - |
|ntp_source_nw | NTP送信元 |  `210.188.224.14` | デフォルト値は"ntp1.sakura.ad.jp"のIPアドレス |
  
## Output

| 変数名           | 名称     | 説明       | 
|-----------------|----------|------------|
|packet_filter_id | ID      |  パケットフィルタのID |

## Example

```main.if:サンプル
module "pf" {
    source = "github.com/terraform-for-sakuracloud-modules/packet_filter"
}

resource sakuracloud_server "server01" {
    name = "server01"
    packet_filter_ids = ["${module.pf.packet_filter_id}"]
}
```

## License

  This project is published under [Apache 2.0 License](LICENSE).

## Author

  * Kazumichi Yamamoto ([@yamamoto-febc](https://github.com/yamamoto-febc))
