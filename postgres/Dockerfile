FROM postgres:9.6.3-alpine

ADD posts_v2.sql /docker-entrypoint-initdb.d/posts_v2.sql

EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
