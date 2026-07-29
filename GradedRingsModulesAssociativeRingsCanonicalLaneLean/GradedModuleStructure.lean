import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedRingStructure

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedModulePackage {R : GradedRingPackage} where
  moduleCarrier : Type u
  moduleAddition : moduleCarrier → moduleCarrier → moduleCarrier
  scalarMultiplication : R.carrier → moduleCarrier → moduleCarrier
  gradingSet : Type v
  gradingMap : moduleCarrier → gradingSet
  homogeneousComponents : gradingSet → Set moduleCarrier
  additiveGroup : AddCommGroup moduleCarrier
  moduleStructure : Module R.carrier moduleCarrier
  additiveGroupClosed : additiveGroup.toAdd = moduleAddition
  moduleStructureClosed : ∀ r : R.carrier, moduleStructure.toSMul r = scalarMultiplication r
  gradingMapAdditive : ∀ x y : moduleCarrier, gradingMap (moduleAddition x y) = gradingMap x + gradingMap y
  gradingMapCompatible : ∀ (r : R.carrier) (x : moduleCarrier), gradingMap (scalarMultiplication r x) = R.gradingMap r + gradingMap x
  homogeneousComponentsDefined : ∀ (i : gradingSet), homogeneousComponents i = {x : moduleCarrier | gradingMap x = i}

structure GradedModuleEvidence {R : GradedRingPackage} (M : GradedModulePackage R) where
  additiveGroupClosed : M.additiveGroupClosed
  moduleStructureClosed : M.moduleStructureClosed
  gradingMapAdditiveClosed : M.gradingMapAdditive
  gradingMapCompatibleClosed : M.gradingMapCompatible
  homogeneousComponentsDefinedClosed : M.homogeneousComponentsDefined

def GradedModuleClosed {R : GradedRingPackage} (M : GradedModulePackage R) : Prop :=
  M.additiveGroupClosed ∧ M.moduleStructureClosed ∧ M.gradingMapAdditive ∧ M.gradingMapCompatible ∧ M.homogeneousComponentsDefined

theorem graded_module_closed_from_evidence {R : GradedRingPackage} (M : GradedModulePackage R) (E : GradedModuleEvidence M) : GradedModuleClosed M := by
  exact And.intro E.additiveGroupClosed
    (And.intro E.moduleStructureClosed
      (And.intro E.gradingMapAdditiveClosed
        (And.intro E.gradingMapCompatibleClosed E.homogeneousComponentsDefinedClosed)))

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse