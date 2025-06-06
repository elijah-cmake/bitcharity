;; BitCharity - Transparent Donation Management Platform
;;
;; A decentralized charity platform built on Bitcoin via Stacks Layer 2
;; that ensures complete transparency in donation collection and fund
;; utilization through blockchain-based accountability mechanisms.
;;
;; This smart contract enables:
;; - Transparent beneficiary registration and management
;; - Secure donation collection with immutable tracking
;; - Milestone-based fund utilization with admin approval
;; - Role-based access control for platform governance
;; - Complete audit trail of all financial transactions
;;
;; Leveraging Bitcoin's security through Stacks' Layer 2 infrastructure,
;; BitCharity brings trust and transparency to charitable giving.

;; CONTRACT CONFIGURATION

;; Contract owner (deployer becomes initial admin)
(define-data-var contract-owner principal tx-sender)

;; ERROR CONSTANTS

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; ROLE DEFINITIONS

(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES

;; User roles mapping
(define-map roles
  { user: principal }
  { role: uint }
)

;; Beneficiary registry
(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

;; Donation records
(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

;; Fund utilization tracking
(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)