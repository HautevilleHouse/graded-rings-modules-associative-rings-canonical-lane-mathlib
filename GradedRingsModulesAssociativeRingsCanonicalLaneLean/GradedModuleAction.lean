import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsModulesAssociativeRingsCanonicalLaneLean.GradedRingStructure

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure GradedModulePackage (R : GradedRingPackage) where
  moduleComponents : R.indexSet → Type v
  scalarMultiplication : ∀ (i j : R.indexSet), R.components i → moduleComponents j → moduleComponents (i ⊕ j)
  moduleAssociativity : Prop
  moduleDistributivity : Prop
  moduleGradingConsistent : Prop

structure GradedModuleEvidence {R : GradedRingPackage} (M : GradedModulePackage R) where
  moduleAssociativityClosed : M.moduleAssociativity
  moduleDistributivityClosed : M.moduleDistributivity
  moduleGradingConsistentClosed : M.moduleGradingConsistent

def GradedModuleClosed {R : GradedRingPackage} (M : GradedModulePackage R) : Prop :=
  M.moduleAssociativity ∧ M.moduleDistributivity ∧ M.moduleGradingConsistent

theorem graded_module_closed_from_evidence {R : GradedRingPackage} (M : GradedModulePackage R) (E : GradedModuleEvidence M) : GradedModuleClosed M := by
  exact And.intro E.moduleAssociativityClosed (And.intro E.moduleDistributivityClosed E.moduleGradingConsistentClosed)

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse
