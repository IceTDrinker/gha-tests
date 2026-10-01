fn main() {
    #[cfg(target_arch = "aarch64")]
    {
        println!("aarch64");
    }

    #[cfg(all(target_arch = "aarch64", target_feature = "fcma"))]
    {
        println!("fcma");
    }

    #[cfg(target_arch = "aarch64")]
    {
        let has_fcma = std::arch::is_aarch64_feature_detected!("fcma");
        println!("feature detects fcma: {has_fcma:?}");
    }
}
