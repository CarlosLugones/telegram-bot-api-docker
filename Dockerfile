FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-dev libc++abi-dev

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR /telegram-bot-api

RUN rm -rf build && mkdir build && cd build && CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang-14 CXX=/usr/bin/clang++-14 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. && cmake --build . --target install

WORKDIR /

RUN ls -l telegram-bot-api/bin/telegram-bot-api*
 