# docker_latex
Docker file setup for latex projects. Contains an example of what compose should look like.


## Expected folder structure

This repo is expected to be cloned into a latex project. The latex project should contain at least the following directories:
```
\src
\output
```
Those get mounted into the container to compile the latex files in the `src` directory and output the pdf files in the `output` directory.