import Mathlib.RingTheory.Graded.Basic
import Mathlib.Algebra.Ring.Basic

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure AssociativeRingPackage (R : Type u) [Ring R] where
  associative : ∀ a b c : R, (a * b) * c = a * (b * c)
  zeroMul : ∀ a : R, 0 * a = 0
  mulZero : ∀ a : R, a * 0 = 0
  oneMul : ∀ a : R, 1 * a = a
  mulOne : ∀ a : R, a * 1 = a
  leftDistrib : ∀ a b c : R, a * (b + c) = a * b + a * c
  rightDistrib : ∀ a b c : R, (a + b) * c = a * c + b * c

def AssociativeRingPackageClosed {R : Type u} [Ring R] (A : AssociativeRingPackage R) : Prop :=
  A.associative

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse