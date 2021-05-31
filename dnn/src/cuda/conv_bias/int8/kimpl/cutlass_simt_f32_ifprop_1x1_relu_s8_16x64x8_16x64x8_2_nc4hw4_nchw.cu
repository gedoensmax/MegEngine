
#if !MEGDNN_TEGRA_X1
// ignore warning of cutlass
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#include "src/cuda/conv_bias/implicit_gemm_conv_bias_cutlass_wrapper.cuinl"


// kernel instance "cutlass_simt_f32_ifprop_1x1_relu_s8_16x64x8_16x64x8_2_nc4hw4_nchw" generated by cutlass generator
using Convolution = 
  typename cutlass::conv::device::Convolution<
    int8_t, 
    cutlass::layout::TensorNCxHWx<4>,
    int8_t, 
    cutlass::layout::TensorCxRSKx<4>,
    float, 
    cutlass::layout::TensorNCHW,
    float, 
    cutlass::layout::TensorNCHW, 
    int32_t, 
    cutlass::conv::ConvType::kConvolution, 
    cutlass::arch::OpClassSimt,
    cutlass::arch::Sm61,
    cutlass::gemm::GemmShape<16, 64, 8>,
    cutlass::gemm::GemmShape<16, 64, 8>,
    cutlass::gemm::GemmShape<1, 1, 4>,
    cutlass::epilogue::thread::BiasAddLinearCombinationRelu<
      float,
      1,
      int32_t, 
      float, 
      float
    >,
    cutlass::conv::threadblock::ConvolutionFpropNCxHWxThreadblockSwizzle,     
    2,
    4, 
    4, 
    false, 
    cutlass::arch::OpMultiplyAdd>;



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
