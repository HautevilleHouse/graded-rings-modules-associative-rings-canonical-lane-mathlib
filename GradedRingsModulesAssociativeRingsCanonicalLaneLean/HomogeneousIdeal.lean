import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRings

structure HomogeneousIdeal (R : Type u) [Ring R] (G : GradedRing R) (I : Ideal R) where
  homogeneousComponents : ∀ i : G.grading, I ∩ G.components i = (I : Set R) ∩ (G.components i : Set R)

structure HomogeneousIdealEvidence (H : HomogeneousIdeal R G I) where
  homogeneousComponentsClosed : H.homogeneousComponents

def HomogeneousIdealClosed (H : HomogeneousIdeal R G I) : Prop :=
  H.homogeneousComponents

theorem homogeneous_ideal_closed_from_evidence (H : HomogeneousIdeal R G I) (E : HomogeneousIdealEvidence H) : HomogeneousIdealClosed H := by
  exact E.homogeneousComponentsClosed

end GradedRingsModulesAssociativeRings
end HautevilleHouse