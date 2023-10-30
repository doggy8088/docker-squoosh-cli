# Release Notes

## 0.2.0

- feat: add support for directory handling
  - Update README.md to include usage examples for CLI options
  - Modify squoosh-cli-wrapper file to accept CLI options as arguments
  - Add support for resizing images using `--resize` option
  - Add support for quantization using `--quant` option
  - Add support for image rotation using `--rotate` option
  - Add support for different image codecs: MozJPEG, WebP, AVIF, JPEG-XL, WebP2, and OxiPNG
  - When handling directories, the `-d` (output dir) is required. If not provided, the script will exit with an error.

## 0.1.0

- Initial release
  - Support for filename wildcard handling
