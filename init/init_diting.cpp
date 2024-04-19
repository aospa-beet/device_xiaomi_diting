/*
 * Copyright (C) 2021 The LineageOS Project
 *           (C) 2024 Paranoid Android
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_variant.h>

#include "vendor_init.h"

static const variant_info_t diting = {
    .hwc = "CN",
    .brand = "Redmi",
    .device = "diting",
    .model = "22081212C",
    .name = "diting",
    .marketname = "Redmi K50 Ultra",
};

static const variant_info_t ditingp = {
    .hwc = "GL",
    .brand = "Xiaomi",
    .device = "diting",
    .model = "22081212UG",
    .name = "ditingp_global",
    .marketname = "Xiaomi 12T Pro",
};

static const std::vector<variant_info_t> variants = {
    diting,
    ditingp,
};

void vendor_load_properties() {
    search_set_variant_props(variants);
}
