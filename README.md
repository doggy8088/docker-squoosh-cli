# willh/squoosh-cli

The Dockerized [squoosh-cli](https://www.npmjs.com/package/@squoosh/cli): An adaptation of the renowned Google [Squoosh](https://github.com/GoogleChromeLabs/squoosh) tool in a Docker container. This containerized version brings the power and flexibility of Squoosh to your development environment with ease. Enjoy efficient image optimization and manipulation, all within a convenient Docker package.

## Docker Hub

<https://hub.docker.com/r/willh/squoosh-cli>

```sh
docker pull willh/squoosh-cli
```

## Usage

The following examples are compatible with the **PowerShell** & **Bash** as the main shell environment. Don't use **Command Prompt** on Windows.

1. Show help manual

    ```sh
    docker run --rm -it -v ${PWD}:/data willh/squoosh-cli -h
    ```

2. Use WebP to generate a `.webp` file with the given configuration

    Compress image to WebP format with 80% quality, output result to `out/` folder.

    ```sh
    docker run --rm -it -v ${PWD}:/data willh/squoosh-cli --webp '{quality:80}' -d 'out' SNAG-0060.png
    ```

3. Use OxiPNG to generate a `.png` file with the given configuration

    Compress image to `OxiPNG` format, without the `-d` argument will replace it's original image.

    ```sh
    docker run --rm -it -v ${PWD}:/data willh/squoosh-cli --oxipng '{}' SNAG-0060.png
    ```

    > Note: pass `{}` means using the default options

4. Use MozJPEG to generate a `.jpg` file with the given configuration

    ```sh
    docker run --rm -it -v ${PWD}:/data willh/squoosh-cli --mozjpeg '{quality:80}' -d 'out' SNAG-0066.png SNAG-0068.png
    ```

5. Use AVIF to generate a `.avif` file with the given configuration

    The command supports wildcard character `*`:

    ```sh
    docker run --rm -it -v ${PWD}:/data willh/squoosh-cli --mozjpeg '{quality:80}' -d 'out' SNAG-*.png
    ```

## Help Manual

```txt
Usage: squoosh-cli [options] <files...>

Options:
  -d, --output-dir <dir>                                 Output directory (default: ".")
  -s, --suffix <suffix>                                  Append suffix to output files (default: "")
  --max-optimizer-rounds <rounds>                        Maximum number of compressions to use for auto optimizations (default: "6")
  --optimizer-butteraugli-target <butteraugli distance>  Target Butteraugli distance for auto optimizer (default: "1.4")
  --resize [config]                                      Resize the image before compressing
  --quant [config]                                       Reduce the number of colors used (aka. paletting)
  --rotate [config]                                      Rotate image
  --mozjpeg [config]                                     Use MozJPEG to generate a .jpg file with the given configuration
  --webp [config]                                        Use WebP to generate a .webp file with the given configuration
  --avif [config]                                        Use AVIF to generate a .avif file with the given configuration
  --jxl [config]                                         Use JPEG-XL to generate a .jxl file with the given configuration
  --wp2 [config]                                         Use WebP2 to generate a .wp2 file with the given configuration
  --oxipng [config]                                      Use OxiPNG to generate a .png file with the given configuration
  -h, --help                                             display help for command
```

## Configurations

Note that the [Squoosh CLI project](https://www.npmjs.com/package/@squoosh/cli) project is no longer maintained by Google.

All available CLI config options can be found here: [codecs.ts](https://github.com/doggy8088/squoosh/blob/cli/libsquoosh/src/codecs.ts)

> It because the source code of the [@squoosh/cli](https://www.npmjs.com/package/@squoosh/cli) and [@squoosh/lib](https://www.npmjs.com/package/@squoosh/lib) has been removed from the [squoosh](https://github.com/GoogleChromeLabs/squoosh) repository. I made a fork to host all the last minute source code of the CLI in my GitHub repo.

- [MozJPEG](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/mozJPEG/shared/meta.ts#L22-L40) (`--mozjpeg [config]`)

    ```js
    {
      quality: 75,
      baseline: false,
      arithmetic: false,
      progressive: true,
      optimize_coding: true,
      smoothing: 0,
      color_space: MozJpegColorSpace.YCbCr,
      quant_table: 3,
      trellis_multipass: false,
      trellis_opt_zero: false,
      trellis_opt_table: false,
      trellis_loops: 1,
      auto_subsample: true,
      chroma_subsample: 2,
      separate_chroma_quality: false,
      chroma_quality: 75,
    }
    ```

- [WebP](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/avif/shared/meta.ts#L20-L31) (`--webp [config]`)

    ```js
    {
      quality: 75,
      target_size: 0,
      target_PSNR: 0,
      method: 4,
      sns_strength: 50,
      filter_strength: 60,
      filter_sharpness: 0,
      filter_type: 1,
      partitions: 0,
      segments: 4,
      pass: 1,
      show_compressed: 0,
      preprocessing: 0,
      autofilter: 0,
      partition_limit: 0,
      alpha_compression: 1,
      alpha_filtering: 1,
      alpha_quality: 100,
      lossless: 0,
      exact: 0,
      image_hint: 0,
      emulate_jpeg_size: 0,
      thread_level: 0,
      low_memory: 0,
      near_lossless: 100,
      use_delta_palette: 0,
      use_sharp_yuv: 0,
    }
    ```

- [AVIF](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/jxl/shared/meta.ts#L20-L29) (`--avif [config]`)

    ```js
    {
      cqLevel: 33,
      cqAlphaLevel: -1,
      denoiseLevel: 0,
      tileColsLog2: 0,
      tileRowsLog2: 0,
      speed: 6,
      subsample: 1,
      chromaDeltaQ: false,
      sharpness: 0,
      tune: AVIFTune.auto,
    }
    ```

- [JPEG-XL](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/jxl/shared/meta.ts#L20-L29) (`--jxl [config]`)

    ```js
    {
      effort: 7,
      quality: 75,
      progressive: false,
      epf: -1,
      lossyPalette: false,
      decodingSpeedTier: 0,
      photonNoiseIso: 0,
      lossyModular: false,
    }
    ```

- [WebP2](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/wp2/shared/meta.ts#L21-L31) (`--wp2 [config]`)

    ```js
    {
      quality: 75,
      alpha_quality: 75,
      effort: 5,
      pass: 1,
      sns: 50,
      uv_mode: UVMode.UVModeAuto,
      csp_type: Csp.kYCoCg,
      error_diffusion: 0,
      use_random_matrix: false,
    }
    ```

- [OxiPNG](https://github.com/GoogleChromeLabs/squoosh/blob/d87eff7645c151c2f4365c2515c71f4e56ed71ca/src/features/encoders/oxiPNG/shared/meta.ts#L22-L25) (`--oxipng [config]`)

    ```js
    {
      level: 2
    }
    ```

- [Rotate](https://github.com/doggy8088/squoosh/blob/42594277fd3d1f31b60103eb05cc8df62a82fb86/libsquoosh/src/codecs.ts#L45C3-L47) (`--rotate [config]`)

    ```js
    {
      numRotations: 0
    }
    ```

    > Possible values: `1` for 90 degree, `2` for 180 degree, ...etc.

- [Resize](https://github.com/doggy8088/squoosh/blob/42594277fd3d1f31b60103eb05cc8df62a82fb86/libsquoosh/src/codecs.ts#L32C32-L38C2) (`--resize [config]`)

    ```js
    {
      width: number,
      height: number,
      method: 'triangle' | 'catrom' | 'mitchell' | 'lanczos3',
      premultiply: true,
      linearRGB: true,
    }
    ```

- [Quantize](https://github.com/doggy8088/squoosh/blob/42594277fd3d1f31b60103eb05cc8df62a82fb86/libsquoosh/src/codecs.ts#L40C1-L43C2) (`--quant [config]`)

    ```js
    {
      numColors: 256,
      dither: 1.0,
    }
    ```

## Links

- [willh/squoosh-cli - Docker Image | Docker Hub](https://hub.docker.com/r/willh/squoosh-cli)
- The latest source of the CLI and LIB: <https://github.com/doggy8088/squoosh/tree/cli>
- [@squoosh/cli - npm](https://www.npmjs.com/package/@squoosh/cli)
- [GoogleChromeLabs/squoosh: Make images smaller using best-in-class codecs, right in the browser.](https://github.com/GoogleChromeLabs/squoosh)

## Author

- This [repository](https://github.com/doggy8088/docker-squoosh-cli) was created by [Will 保哥](https://www.facebook.com/will.fans/).
