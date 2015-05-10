# 日本語の文字化け対策
日本語の曲名やアーティスト名が文字化けする場合は、mountポイントに` <charset>windows-31j</charset>` を追記する。

例えば、mountポイントが`/stream`で文字化けする場合、以下の行を追記する。

    <mount>
        <mount-name>/stream</mount-name>
        <charset>windows-31j</charset>
    </mount>