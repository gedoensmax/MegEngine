
#if !MEGDNN_TEGRA_X1
// ignore warning of cutlass
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#include "src/cuda/conv_bias/implicit_gemm_conv_bias_cutlass_wrapper.cuinl"


// kernel instance "cutlass_tensorop_u4_i8832fprop_relu_u4_s4_128x128x128_64x64x128_2_nc64hw64" generated by cutlass generator
using Convolution = 
  typename cutlass::conv::device::Convolution<
    cutlass::uint4b_t, 
    cutlass::layout::TensorNCxHWx<64>,
    cutlass::int4b_t, 
    cutlass::layout::TensorCxRSKx<64>,
    cutlass::uint4b_t, 
    cutlass::layout::TensorNCxHWx<64>,
    int32_t, 
    cutlass::layout::TensorNCxHWx<64>, 
    int32_t, 
    cutlass::conv::ConvType::kConvolution, 
    cutlass::arch::OpClassTensorOp,
    cutlass::arch::Sm75,
    cutlass::gemm::GemmShape<128, 128, 128>,
    cutlass::gemm::GemmShape<64, 64, 128>,
    cutlass::gemm::GemmShape<8, 8, 32>,
    cutlass::epilogue::thread::BiasAddLinearCombinationReluClamp<
      cutlass::uint4b_t,
      16,
      int32_t, 
      int32_t, 
      float
    >,
    cutlass::conv::threadblock::ConvolutionFpropNCxHWxThreadblockSwizzle,     
    2,
    32, 
    32, 
    true, 
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
