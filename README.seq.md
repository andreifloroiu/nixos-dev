# Using seq

Config includes packages in order to use [seq from datalust](https://docs.datalust.co/docs/an-overview-of-seq).


## seq Ingestion

API key is ```123``` in this config:

```bash
PH=$(echo '123' | docker run --rm -i datalust/seq config hash) \
  && docker run \
  --name seq \
  -d \
  --restart unless-stopped \
  -e ACCEPT_EULA=Y \
  -e SEQ_API_CANONICALURI=https://seq.example.com \
  -e SEQ_FIRSTRUN_ADMINPASSWORDHASH="$PH" \
  -p 5080:80 \
  -p 5341:5341 \
  datalust/seq:latest
```

No volume mounted. If persistance is wanted the following version can be used:

```bash
PH=$(echo '123' | docker run --rm -i datalust/seq config hash) \
  && docker run \
  --name seq \
  -d \
  --restart unless-stopped \
  -e ACCEPT_EULA=Y \
  -e SEQ_API_CANONICALURI=https://seq.example.com \
  -e SEQ_FIRSTRUN_ADMINPASSWORDHASH="$PH" \
  -v /path/to/seq/data:/data \
  -p 5080:80 \
  -p 5341:5341 \
  datalust/seq
```

### Periodically Ingestion

Periodically run ```sql-cli``` in order to ingest ```json``` logs:

```bash
seqcli ingest -i /mnt/d/logs/*.log -s http://localhost:5341 -a 123 --json
```

