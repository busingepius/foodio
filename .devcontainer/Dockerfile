FROM ghcr.io/cirruslabs/flutter:3.24.3
#  ghrc means git hub container repository 
RUN flutter precache --android

RUN yes | flutter doctor --android-licenses

RUN flutter doctor  
