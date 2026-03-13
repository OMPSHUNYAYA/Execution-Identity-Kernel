# ⭐ Shunyaya Execution Identity Kernel (EIK) — Execution Cases and Clarifications

---

# Purpose

This document provides **practical clarification for observable execution cases** in the **EIK public release**.

The kernel itself is intentionally **minimal**.

This file explains how certain observable behaviors should be interpreted when verifying **execution identity**.

Nothing in this document modifies the **frozen boundary** defined in `FREEZE_NOTE.txt`.

---

# Observable Boundary Principle

EIK certifies **execution identity**, not **program correctness**.

The certificate is derived from the **observable execution boundary**:

`B = (target_sha256, argv, stdin_text, stdout_text, stderr_text, exit_code)`

The execution certificate is:

`E = SHA256(JSON_canonical(B))`

If the observable boundary is identical, the certificate is identical.

`same observable boundary -> same execution certificate`

If any observable element changes, the certificate changes.

`changed observable boundary -> changed execution certificate`

If the boundary is restored, the certificate is restored.

`restored observable boundary -> restored execution certificate`

---

# Exact Output Preservation

EIK preserves **stdout** and **stderr** exactly as observed.

The kernel does **not normalize or modify program output**.

This means:

- whitespace differences affect the certificate
- newline differences affect the certificate
- encoding differences affect the certificate

The certificate represents the **exact observable execution result**.

---

# Case: Programs Without Trailing Newline

Some example programs intentionally produce output **without a trailing newline**.

Example program:

`plain_copy_upper.py`

If the original file contains **no trailing newline** and the program preserves that structure, the output will also contain **no trailing newline**.

This is **correct behavior**.

The absence of a newline is part of the **observable execution boundary** and is therefore included in the execution certificate.

This demonstrates that EIK certifies **exact observable structure**, not normalized text output.

---

# Case: Empty stderr

If a program produces **no stderr output**, the captured stderr component of the boundary is simply an empty string.

Example boundary element:

`stderr_text = ""`

An empty stderr is therefore a **meaningful structural state** and contributes deterministically to the certificate.

---

# Case: Deterministic Replay

Running the same execution twice should produce the **same certificate** if the observable boundary is identical.

Replay condition:

`B_A = B_B`

Which implies:

`E_A = E_B`

The verification scripts demonstrate this property.

These tests confirm that **execution identity remains stable across replay**.

---

# Case: Mutation Sensitivity

If any observable element of the execution boundary changes, the certificate must change.

Examples include:

- modifying the program
- changing arguments
- changing stdin input
- changing stdout output
- changing stderr output
- changing exit code

Mutation condition:

`B_A != B_B`

Which implies:

`E_A != E_B`

The verification scripts demonstrate this sensitivity.

---

# Scope of Certification

EIK certifies **structural execution identity only**.

The kernel does **not certify**:

- algorithm correctness
- domain validity
- safety
- optimization quality
- performance characteristics
- full hermetic environment reproducibility

The certificate represents **only the observable execution boundary**.

---

# Environment Scope

EIK intentionally excludes environmental factors such as:

- Python version
- operating system version
- system locale
- CPU architecture
- installed libraries

These factors may influence execution behavior, but they are **outside the scope of the minimal execution identity model demonstrated in this release**.

The goal of the kernel is to demonstrate **deterministic identity at the observable boundary level**, not full environment capture.

---

# Binary Output Scope

The current release captures **stdout and stderr as text streams**.

This is sufficient for the example programs provided.

Programs producing **binary output** may require explicit encoding (for example **base64**) in future extensions.

Binary handling is intentionally **outside the minimal demonstration scope of this release**.

---

# Relationship to the Frozen Boundary

The frozen boundary for this release is defined in:

`FREEZE_NOTE.txt`

Files inside the frozen boundary define the **deterministic demonstration of execution identity**.

This document exists **outside the frozen boundary** and serves only as explanatory material.

No statements in this file modify the frozen artifact or its deterministic guarantees.

---

# Operational Discipline

When verifying EIK behavior:

- use the provided scripts
- do not modify frozen files
- treat `outputs_example` as authoritative reference outputs

If frozen files are modified, the release must be **re-frozen and verification repeated**.

---

# Structural Interpretation

EIK demonstrates a **minimal deterministic structural operator applied to program execution**.

`Φ(P, I, O) = SHA256(JSON_canonical(B))`

Where:

`B = (target_sha256, argv, stdin_text, stdout_text, stderr_text, exit_code)`

The hash of the canonical boundary becomes the **execution identity**.

This tiny primitive establishes the **first layer of a larger architecture** where identity becomes the foundation for **reproducible computation and verifiable knowledge systems**.

---

# Verification Philosophy

EIK verification is intentionally **simple**.

The kernel does **not attempt to judge program correctness**.

It only certifies the **structural identity of an execution**.

Two executions that produce the same observable boundary will produce the **same certificate**.

Verification therefore asks a structural question:

**Did the observable execution boundary remain identical?**

---

# Interpreting Certificate Differences

If two executions produce **different certificates**, this indicates that **at least one observable boundary element changed**.

Common causes include:

- program modification
- different command arguments
- different stdin input
- different stdout output
- different stderr output
- different exit code

A changed certificate does **not indicate failure**.

It simply indicates that **the execution boundary was different**.

