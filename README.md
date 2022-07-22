# Webserver para o DokuWiki

Esse projeto contém um webserver leve e robusto para para rodar a aplicação [DokuWiki](https://www.dokuwiki.org/dokuwiki).

### Preparando o ambiente:

    docker volume create dokuwiki

## Subindo o contêiner:

    docker run -d --name='dokuwiki' \
	    --hostname='dokuwiki' \
	    -v dokuwiki:/var/www/html \
	    -p 80:80 \
	--restart=always aprendendolinux/dokuwiki

Caso prefira, você pode usar o Docker Composer com o arquivo [docker-compose.yml](https://github.com/AprendendoLinux/dokuwiki/blob/main/docker-compose.yml).

Se tiver qualquer dúvida, acesse meu site:

[https://www.henrique.tec.br](https://www.henrique.tec.br)

Atenciosamente,

**Henrique Fagundes** \
Analista de Suporte Gnu/Linux
