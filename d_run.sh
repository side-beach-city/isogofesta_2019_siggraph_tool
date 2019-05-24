# Dockerマシンでのコンテナ実行用。
# 予めDocker用仮想マシンで、
# 外部マシンのフォルダを「/docker」に結びつけておくこと。
docker run -v /docker:/outside -it takamichie/stest bash