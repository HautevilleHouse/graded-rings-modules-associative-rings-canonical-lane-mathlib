import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure AssociativeRing (R : Type u) [Ring R] where
  associative : ∀ (a b c : R), (a * b) * c = a * (b * c)
  unit : R
  leftUnit : ∀ (a : R), unit * a = a
  rightUnit : ∀ (a : R), a * unit = a

structure AssociativeRingEvidence (R : AssociativeRing) where
  associativeClosed : R.associative
  unitClosed : True
  leftUnitClosed : R.leftUnit
  rightUnitClosed : R.rightUnit

def AssociativeRingClosed (R : AssociativeRing) : Prop :=
  R.associative ∧ (∀ a : R, R.unit * a = a) ∧ (∀ a : R, a * R.unit = a)

theorem associative_ring_closed_from_evidence (R : AssociativeRing) (E : AssociativeRingEvidence R) : AssociativeRingClosed R :=
  by
    have : (∀ a : R, R.unit * a = a) := E.leftUnitClosed
    have : (∀ a : R, a * R.unit = a) := E.rightUnitClosed
    exact And.intro E.associativeClosed (And.intro (by exact E.leftUnitClosed) (by exact E.rightUnitClosed))

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse