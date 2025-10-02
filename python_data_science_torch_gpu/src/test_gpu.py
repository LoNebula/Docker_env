#!/usr/bin/env python3
"""
GPU PyTorch Test Script
This script verifies that PyTorch is properly installed with GPU support.
"""

import torch
import sys

def test_pytorch_gpu():
    """Test PyTorch GPU functionality"""
    print("=== PyTorch GPU Test ===")
    print(f"Python version: {sys.version}")
    print(f"PyTorch version: {torch.__version__}")
    print(f"CUDA available: {torch.cuda.is_available()}")
    
    if torch.cuda.is_available():
        print(f"CUDA version: {torch.version.cuda}")
        print(f"cuDNN version: {torch.backends.cudnn.version()}")
        print(f"Number of GPUs: {torch.cuda.device_count()}")
        
        for i in range(torch.cuda.device_count()):
            print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
            print(f"  Memory: {torch.cuda.get_device_properties(i).total_memory / 1e9:.1f} GB")
        
        # Test GPU computation
        print("\n=== GPU Computation Test ===")
        device = torch.device('cuda:0')
        
        # Create tensors on GPU
        x = torch.randn(1000, 1000, device=device)
        y = torch.randn(1000, 1000, device=device)
        
        # Perform computation
        z = torch.matmul(x, y)
        
        print(f"Successfully performed matrix multiplication on GPU")
        print(f"Result tensor shape: {z.shape}")
        print(f"Result tensor device: {z.device}")
        print(f"Result tensor mean: {z.mean().item():.4f}")
        
    else:
        print("⚠️  CUDA not available. Running on CPU only.")
        
        # Test CPU computation
        print("\n=== CPU Computation Test ===")
        x = torch.randn(1000, 1000)
        y = torch.randn(1000, 1000)
        z = torch.matmul(x, y)
        
        print(f"Successfully performed matrix multiplication on CPU")
        print(f"Result tensor shape: {z.shape}")
        print(f"Result tensor device: {z.device}")
        print(f"Result tensor mean: {z.mean().item():.4f}")

if __name__ == "__main__":
    test_pytorch_gpu()
