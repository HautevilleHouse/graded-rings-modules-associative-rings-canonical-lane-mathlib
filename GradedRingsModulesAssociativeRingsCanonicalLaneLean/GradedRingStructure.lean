import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedRingPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  gradingSet : Type v
  gradingMap : carrier → gradingSet
  homogeneousComponents : gradingSet → Set carrier
  additiveGroup : Group carrier
  ringStructure : Ring carrier
  additiveGroupClosed : additiveGroup.toMul = addition
  ringStructureClosed : ringStructure.toMul = multiplication
  gradingMapAdditive : ∀ x y : carrier, gradingMap (addition x y) = gradingMap x + gradingMap y
  gradingMapMultiplicative : ∀ x y : carrier, gradingMap (multiplication x y) = gradingMap x + gradingMap y
  homogeneousComponentsDefined : ∀ (i : gradingSet), homogeneousComponents i = {x : carrier | gradingMap x = i}

structure GradedRingEvidence (G : GradedRingPackage) where
  additiveGroupClosed : G.additiveGroupClosed
  ringStructureClosed : G.ringStructureClosed
  gradingMapAdditiveClosed : G.gradingMapAdditive
  gradingMapMultiplicativeClosed : G.gradingMapMultiplicative
  homogeneousComponentsDefinedClosed : G.homogeneousComponentsDefined

def GradedRingClosed (G : GradedRingPackage) : Prop :=
  G.additiveGroupClosed ∧ G.ringStructureClosed ∧ G.gradingMapAdditive ∧ G.gradingMapMultiplicative ∧ G.homogeneousComponentsDefined

theorem graded_ring_closed_from_evidence (G : GradedRingPackage) (E : GradedRingEvidence G) : GradedRingClosed G := by
  exact And.intro E.additiveGroupClosed
    (And.intro E.ringStructureClosed
      (And.intro E.gradingMapAdditiveClosed
        (And.intro E.gradingMapMultiplicativeClosed E.homogeneousComponentsDefinedClosed)))

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse