FROM jetbrains/teamcity-agent:2020.1.2
RUN apt update && apt install wget && \
    wget -c https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz && \
    tar -xvf openjdk-11_linux-x64_bin.tar.gz && \
    rm openjdk-11_linux-x64_bin.tar.gz && \
    mkdir -p /usr/lib/jvm/jdk-11 && \
    mv jdk-11*/* /usr/lib/jvm/jdk-11/ && \
    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-11/bin/java" 1020 && \
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-11/bin/javac" 1020 && \
    curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose