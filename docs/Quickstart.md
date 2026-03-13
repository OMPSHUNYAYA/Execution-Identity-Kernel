# ⭐ Shunyaya Execution Identity Kernel (EIK) — Quickstart

**Deterministic • Replay-Verifiable • Minimal Execution Identity Kernel (~1 KB)**  
**No Probability • No Randomness • No Hidden State**

---

# What You Need to Know First

The **Shunyaya Execution Identity Kernel (EIK)** is a minimal deterministic kernel that produces a **structural certificate representing the observable identity of a program execution.**

EIK does **not verify program correctness.**  
EIK **certifies execution identity.**

This means the kernel determines **whether two executions are structurally identical.**

---

# What EIK Does Not Do

EIK does **not**:

- modify program behavior
- perform machine learning
- perform prediction
- inject randomness
- alter program outputs
- change execution semantics

EIK **observes execution boundaries only.**

---

# What EIK Does

EIK:

- executes a program
- captures the execution boundary
- canonicalizes observable execution structure
- produces a deterministic execution identity certificate
- enables replay-verifiable execution identity

The execution certificate is a **deterministic structural fingerprint of the run.**

---

# Core Identity Rule

Execution identity invariant:

`same execution boundary -> same execution certificate`

Mutation rule:

`changed execution boundary -> changed execution certificate`

Restoration rule:

`restored execution boundary -> restored execution certificate`

There is **no probabilistic tolerance.**

Identity must **match exactly.**

---

# Minimum Requirements

Environment:

- **Python 3.9+** (CPython recommended)
- **Standard library only**
- **No external dependencies**

EIK runs **entirely offline.**

---

# Repository Layout

```
Public_Release/

├── README.md
├── README_CASES.md
├── LICENSE
│
├── EIK
│ │
│ ├── eik.py
│ ├── eik.cmd
│ │
│ ├── RUN_EIK.cmd
│ ├── REPLAY_EIK.cmd
│ ├── VERIFY_EIK.cmd
│ ├── RUN_ALL_TESTS.cmd
│ │
│ ├── run_eik.sh
│ ├── replay_eik.sh
│ ├── verify_eik.sh
│ ├── run_all_tests.sh
│ │
│ ├── FREEZE_NOTE.txt
│ │
│ ├── examples
│ │ ├── hello_cert.py
│ │ ├── sum_cert.py
│ │ ├── plain_fib.py
│ │ ├── plain_copy_upper.py
│ │ └── note.txt
│ │
│ └── outputs_example
│ ├── hello_world_run_1.txt
│ ├── hello_world_run_2.txt
│ ├── hello_alice.txt
│ ├── hello_bob.txt
│ ├── fib_7_run_1.txt
│ ├── fib_7_run_2.txt
│ ├── fib_8.txt
│ ├── sum_5_9.txt
│ └── note_upper.txt
│
└── docs
├── Quickstart.md
├── FAQ.md
├── EIK-Execution-Identity-Workflow.md
├── EIK-Civilization-Architecture.md
└── Execution-Identity-Pipeline.png
```


The **`EIK` folder defines the frozen execution boundary.**

Documentation is **outside the boundary** and may evolve independently.

---

# 30-Second Demo

Navigate to the EIK folder:

`cd EIK`

Run a program through the kernel:

```
python eik.py examples\hello_cert.py -- World
```

Example output:

```
Hello, World

EIK_MANIFEST_SPEC
v1

EIK_EXECUTION_CERTIFICATE
1c2e0e6dd9c20ff092679318cc1a40a9ed6b76f1af5144d5eb148efefdd49129
```

You just generated a **deterministic execution identity certificate.**

---

# Official Verification Method

Run the verification script:

```
VERIFY_EIK.cmd
```

Expected result:

```
VERIFY_EIK
HELLO_WORLD_REPLAY: PASS
FIB_7_REPLAY: PASS
HELLO_MUTATION: PASS
FIB_MUTATION: PASS
OVERALL_STATUS: PASS
```

Verification confirms:

- **replay identity**
- **mutation sensitivity**
- **deterministic execution behavior**

---

# Replay Demonstration

Replay identity means identical executions produce **identical certificates.**

Example:

```
python eik.py examples\hello_cert.py -- World
```

```
python eik.py examples\hello_cert.py -- World
```

Certificates **must match.**

Replay identity rule:

`same execution boundary -> same certificate`

---

# Mutation Demonstration

Changing the execution boundary changes the identity.

Example:

```
python eik.py examples\hello_cert.py -- Alice
```

```
python eik.py examples\hello_cert.py -- Bob
```

Certificates **must differ.**

Mutation rule:

`changed boundary -> changed certificate`

---

# Run Full Test Suite

To regenerate the full demonstration set:

```
RUN_ALL_TESTS.cmd
```

or on Linux / macOS:

```
bash run_all_tests.sh
```

This produces deterministic example outputs inside:

`outputs_example/`

These files demonstrate **replay and mutation behavior.**

---

# Structural Execution Model

EIK implements a structural operator:

`Φ(P, I, O)`

Where:

`P = program`  
`I = inputs`  
`O = outputs`

The observable execution boundary is transformed into a deterministic identity.

Formally:

`Φ(P, I, O) = SHA256(JSON_canonical(boundary))`

The resulting hash is the **execution identity certificate.**

---

# What EIK Certifies

EIK certifies:

- execution identity
- deterministic replay behavior
- structural execution boundary

EIK does **not certify**:

- algorithm correctness
- program safety
- performance
- domain validity

EIK certifies **identity only.**

---

# Why the Kernel Is Small

The kernel performs a single transformation:

`execution -> identity`

It does **not implement higher-level systems.**

This minimal design allows the kernel to remain **~1 KB** while enabling larger architectures built on top of **execution identity.**

---

# Freeze Boundary

The following artifacts define the **frozen demonstration boundary**:

`eik.py`  
`eik.cmd`

`RUN_EIK.cmd`  
`REPLAY_EIK.cmd`  
`VERIFY_EIK.cmd`  
`RUN_ALL_TESTS.cmd`

`run_eik.sh`  
`replay_eik.sh`  
`verify_eik.sh`  
`run_all_tests.sh`

`examples/`  
`outputs_example/`  
`FREEZE_NOTE.txt`

Changes inside this boundary require **regeneration and verification.**

---

# One-Line Summary

**EIK is a ~1 KB deterministic kernel that produces replay-verifiable structural certificates of program execution identity.**



