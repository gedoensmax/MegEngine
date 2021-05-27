#if !MEGDNN_TEGRA_X1
// generated by gen_cuda_conv_bias_kern_impls.py
// ignore warning of cutlass
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#include "src/cuda/convolution/backward_data/int8/deconv_int8_implicit_gemm_cutlass_wrapper.cuinl"

using LayoutSrc = cutlass::layout::TensorNCxHWx<4>;
using LayoutFilter = cutlass::layout::TensorKxRSCx<4>;
using LayoutDst = cutlass::layout::TensorNCxHWx<4>;
using ThreadBlockShape = cutlass::gemm::GemmShape<16, 64, 8>;
using WarpShape = cutlass::gemm::GemmShape<16, 64, 8>;
using InstructionShape = cutlass::gemm::GemmShape<1, 1, 4>;
using EpilogueOp = cutlass::epilogue::thread::BiasAddLinearCombinationClamp<
                    int8_t, 4, int32_t, int32_t, float>;
using Deconvolution = cutlass::conv::device::Deconvolution<
    int8_t, LayoutSrc, int8_t, LayoutFilter, int8_t, 
    LayoutDst, int32_t, LayoutDst, int32_t, 
    cutlass::arch::OpClassSimt, cutlass::arch::Sm61, 
    ThreadBlockShape, WarpShape, InstructionShape, EpilogueOp, 
    cutlass::conv::threadblock::ConvolutionDgradNCxHWxThreadblockSwizzle, 
    2, 4, 4, true, 
    cutlass::arch::OpMultiplyAdd>;
template void megdnn::cuda::cutlass_wrapper::cutlass_deconvolution_wrapper<Deconvolution>(
        const typename Deconvolution::ElementSrc* d_src, 
        const typename Deconvolution::ElementFilter* d_filter, 
        const typename Deconvolution::ElementBias* d_bias, 
        const typename Deconvolution::ElementDst* d_z, 
        typename Deconvolution::ElementDst* d_dst, 
        int* workspace, 
        typename Deconvolution::ConvolutionParameter const& conv_param, 
        typename Deconvolution::EpilogueOutputOp::Params const& epilogue, 
        cudaStream_t stream);
#pragma GCC diagnostic pop
#endif
