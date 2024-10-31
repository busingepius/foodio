FROM ghcr.io/cirruslabs/flutter:latest
#  ghrc means git hub container repository 
RUN flutter precache --android

RUN yes | flutter doctor --android-licenses

RUN flutter doctor  
