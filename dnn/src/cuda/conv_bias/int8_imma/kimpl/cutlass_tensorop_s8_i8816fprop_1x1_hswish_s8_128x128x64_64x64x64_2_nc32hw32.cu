
#if !MEGDNN_TEGRA_X1
// ignore warning of cutlass
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#include "src/cuda/conv_bias/implicit_gemm_conv_bias_cutlass_wrapper.cuinl"


// kernel instance "cutlass_tensorop_s8_i8816fprop_1x1_hswish_s8_128x128x64_64x64x64_2_nc32hw32" generated by cutlass generator
using Convolution = 
  typename cutlass::conv::device::Convolution<
    int8_t, 
    cutlass::layout::TensorNCxHWx<32>,
    int8_t, 
    cutlass::layout::TensorCxRSKx<32>,
    int8_t, 
    cutlass::layout::TensorNCxHWx<32>,
    int32_t, 
    cutlass::layout::TensorNCxHWx<32>, 
    int32_t, 
    cutlass::conv::ConvType::kConvolution, 
    cutlass::arch::OpClassTensorOp,
    cutlass::arch::Sm75,
    cutlass::gemm::GemmShape<128, 128, 64>,
    cutlass::gemm::GemmShape<64, 64, 64>,
    cutlass::gemm::GemmShape<8, 8, 16>,
    cutlass::epilogue::thread::BiasAddLinearCombinationHSwishClamp<
      int8_t,
      8,
      int32_t, 
      int32_t, 
      float
    >,
    cutlass::conv::threadblock::ConvolutionFpropNCxHWxThreadblockSwizzle,     
    2,
    16, 
    16, 
    false, 
    cutlass::arch::OpMultiplyAddSaturate>;


template void megdnn::cuda::cutlass_wrapper::cutlass_convolution_wrapper<Convolution>(
        const typename Convolution::ElementSrc* d_src, 
        const typename Convolution::ElementFilter* d_filter, 
        const typename Convolution::ElementBias* d_bias, 
        const typename Convolution::ElementDst* d_z, 
        typename Convolution::ElementDst* d_dst, 
        int* workspace, 
        typename Convolution::ConvolutionParameter const& conv_param, 
        typename Convolution::EpilogueOutputOp::Params const& epilogue, 
        cudaStream_t stream, 
        typename Convolution::ExtraParam extra_param);
#pragma GCC diagnostic pop
#endif
