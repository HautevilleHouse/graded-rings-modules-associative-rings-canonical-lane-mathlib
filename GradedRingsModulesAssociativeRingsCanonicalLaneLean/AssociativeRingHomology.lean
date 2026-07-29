import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure AssociativeRingHomologyPackage where
  ringObject : Type u
  multiplication : ringObject → ringObject → ringObject
  associativityCondition : Prop
  unitElement : ringObject
  leftUnitLaw : Prop
  rightUnitLaw : Prop

structure AssociativeRingHomologyEvidence (H : AssociativeRingHomologyPackage) where
  associativityConditionClosed : H.associativityCondition
  leftUnitLawClosed : H.leftUnitLaw
  rightUnitLawClosed : H.rightUnitLaw

def AssociativeRingHomologyClosed (H : AssociativeRingHomologyPackage) : Prop :=
  H.associativityCondition ∧ H.leftUnitLaw ∧ H.rightUnitLaw

theorem associative_ring_homology_closed_from_evidence (H : AssociativeRingHomologyPackage) (E : AssociativeRingHomologyEvidence H) : AssociativeRingHomologyClosed H := by
  exact And.intro E.associativityConditionClosed (And.intro E.leftUnitLawClosed E.rightUnitLawClosed)

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse
