/**
 * \file dnn/src/x86/elemwise_helper/kimpl/pow.h
 * MegEngine is Licensed under the Apache License, Version 2.0 (the "License")
 *
 * Copyright (c) 2014-2021 Megvii Inc. All rights reserved.
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT ARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 */
#pragma once

#include "src/x86/elemwise_helper/kimpl/op_unary_base.h"

namespace megdnn {
namespace x86 {

/////////////////////// POW float only ////////////////////////////
template <SIMDType simd_type, typename src_ctype, typename dst_ctype = src_ctype>
struct PowOp : BinaryOpBase<src_ctype, dst_ctype> {
    using BinaryOpBase<src_ctype, dst_ctype>::BinaryOpBase;
    constexpr static size_t SIMD_WIDTH = 1;
    void operator()(
            const src_ctype& src0, const src_ctype& src1, dst_ctype* dst) const {
        *dst = operator()(src0, src1);
    }
    dst_ctype operator()(const src_ctype& src0, const src_ctype& src1) const {
        return powf(src0, src1);
    }
};

}  // namespace x86
}  // namespace megdnn

// vim: syntax=cpp.doxygen
