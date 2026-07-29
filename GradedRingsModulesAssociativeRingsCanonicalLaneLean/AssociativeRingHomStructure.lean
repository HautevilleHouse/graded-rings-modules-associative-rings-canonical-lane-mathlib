import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure AssociativeRingHomPackage where
  sourceRing : Type u
  targetRing : Type u
  ringHom : sourceRing → targetRing
  additionPreserved : ∀ x y : sourceRing, ringHom (x + y) = ringHom x + ringHom y
  multiplicationPreserved : ∀ x y : sourceRing, ringHom (x * y) = ringHom x * ringHom y
  unitPreserved : ringHom 1 = 1
  ringStructureSource : Ring sourceRing
  ringStructureTarget : Ring targetRing

structure AssociativeRingHomEvidence (H : AssociativeRingHomPackage) where
  additionPreservedClosed : H.additionPreserved
  multiplicationPreservedClosed : H.multiplicationPreserved
  unitPreservedClosed : H.unitPreserved

def AssociativeRingHomClosed (H : AssociativeRingHomPackage) : Prop :=
  H.additionPreserved ∧ H.multiplicationPreserved ∧ H.unitPreserved

theorem associative_ring_hom_closed_from_evidence (H : AssociativeRingHomPackage) (E : AssociativeRingHomEvidence H) : AssociativeRingHomClosed H := by
  exact And.intro E.additionPreservedClosed
    (And.intro E.multiplicationPreservedClosed E.unitPreservedClosed)

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse